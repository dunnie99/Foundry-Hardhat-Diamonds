// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;



import "../contracts/facets/MockNFT.sol";
import "../lib/forge-std/src/Script.sol";


contract nftScript is Script {

    function run() external {

        MockNFT nft;

        //address deployer = 0xA2d1B5D60cc5b2E8b99bE8E043059823e2F0aFCe;
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

            nft = new MockNFT();

            vm.stopBroadcast();
    }


// nftContract address => 0x85028dC499394Ded80755d8100B4265Ac356Ade8;

}