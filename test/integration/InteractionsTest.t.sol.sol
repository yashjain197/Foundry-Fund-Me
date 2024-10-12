// SPDX-License-Identifier: MIT
import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../../src/FundMe.sol";
import {DeployFundMe} from "../../script/DeployFundMe.s.sol";
import {FundFundMe} from "../../script/Interactions.s.sol";
import {WithdrawFundMe} from "../../script/Interactions.s.sol";
pragma solidity ^0.8.18;

contract InteractionsTest is Test {

    uint256 favNumber = 0;
    bool greatCourse = false;
    FundMe fundMe;
    uint256 constant SEND_VALUE = 0.1 ether;
    address public USER = makeAddr("user");
    uint256 constant STARTING_BALANCE = 10 ether;
    uint256 constant GAS_PRICE = 1;

    function setUp() external {

        DeployFundMe deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();
        vm.deal(USER, STARTING_BALANCE);
    }

    function testUserCanFundInteractions() public {
        FundFundMe fundFundMe = new FundFundMe();
        fundFundMe.fundFundMe(address(fundMe));
        WithdrawFundMe withdrawFundMe = new WithdrawFundMe();
        withdrawFundMe.withdrawFundMe(address(fundMe));

        // assertEq(address(fundMe).balance, 0);
        assert(address(fundMe).balance == 0);
    }
}