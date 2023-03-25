// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "../contracts/facets/AcquisitionFacet.sol";
import "../contracts/facets/MockNFT.sol";
import "./deployDiamond.t.sol";
import "../../lib/openzeppelin-contracts/contracts/token/ERC1155/IERC1155.sol";


contract AcquisitionTest is DiamondDeployer {
    AcquisitionFacet  assetFacet;
    MockNFT nftTst;
    address vince = vm.addr(0x1);
    address alice = vm.addr(0x2);
    address bob = vm.addr(0x3);

    function setUp() public {
        assetFacet = new AcquisitionFacet();
        nftTst = new MockNFT();
        
    }

    function mint() public {
        nftTst.mintProperty(vince, 2, 5);
        nftTst.balanceOf(vince, 2);
    }


    function testFacet() public {
        vm.startPrank(vince);
        mint();
        vm.deal(vince, 100);
        IERC1155(nftTst).setApprovalForAll(address(assetFacet), true);

        assetFacet.listProperty_(
        9499,
        "Genesis House",
        "A house",
        "The moon",
        IERC1155(nftTst),
        2
    );
    }
}
















