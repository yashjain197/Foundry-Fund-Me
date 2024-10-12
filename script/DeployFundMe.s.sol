// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.sol";
contract DeployFundMe is Script {
    function run() external returns (FundMe) {
        HelperConfig helperConfig = new HelperConfig();
        address ethUsdPriceFeed = helperConfig.activeNetworkConfig();
        //Before StartBroadcast -> not a real txn
        vm.startBroadcast();
        //After StartBroadcast -> a real txn
        FundMe fundMe = new FundMe(ethUsdPriceFeed);
        vm.stopBroadcast();

        return fundMe;
    }
}