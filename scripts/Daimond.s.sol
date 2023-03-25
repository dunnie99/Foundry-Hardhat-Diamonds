// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;


import "../contracts/Diamond.sol";
import "../contracts/facets/DiamondCutFacet.sol";
import "../contracts/facets/DiamondLoupeFacet.sol";
import "../contracts/facets/OwnershipFacet.sol";
import "../contracts/interfaces/IDiamondCut.sol";
import "../contracts/facets/AcquisitionFacet.sol";
import "../contracts/facets/MockNFT.sol";
import "../lib/openzeppelin-contracts/contracts/token/ERC1155/IERC1155.sol";
import "../lib/forge-std/src/Script.sol";


contract DiamondScript is Script, IDiamondCut{
    function run() external {
    DiamondCutFacet dCutFacet;
    Diamond diamond;
    DiamondLoupeFacet dLoupeFacet;
    OwnershipFacet dOwnerFacet;
    AcquisitionFacet acqFacet;
    address deployer = 0xA2d1B5D60cc5b2E8b99bE8E043059823e2F0aFCe;
    uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
    vm.startBroadcast(deployerPrivateKey);

    dCutFacet = new DiamondCutFacet();
        diamond = new Diamond(deployer, address(dCutFacet));
        dLoupeFacet = new DiamondLoupeFacet();
        dOwnerFacet = new OwnershipFacet();
        acqFacet = new AcquisitionFacet();


    //adding facets to the diamond
        FacetCut[] memory cut = new FacetCut[](3);
        
        cut[0] =(
            FacetCut({
                facetAddress: address(dLoupeFacet),
                action: FacetCutAction.Add,
                functionSelectors: generateSelectors("DiamondLoupeFacet")
            })
        );
        cut[1] =(
            FacetCut({
                facetAddress: address(dOwnerFacet),
                action: FacetCutAction.Add,
                functionSelectors: generateSelectors("OwnershipFacet")
            })
        );
        cut[2] =(
            FacetCut({
                facetAddress: address(acqFacet),
                action: FacetCutAction.Add,
                functionSelectors: generateSelectors("AcquisitionFacet")
            })
        );

        IDiamondCut(address(diamond)).diamondCut(cut, address(0x0), "");

        // call a function
        DiamondLoupeFacet(address(diamond)).facetAddresses();
        vm.stopBroadcast();


    }
    function generateSelectors(string memory _facetName)
        internal
        returns (bytes4[] memory selectors)
    {
        string[] memory cmd = new string[](3);
        cmd[0] = "node";
        cmd[1] = "scripts/genSelectors.js";        cmd[2] = _facetName;
        bytes memory res = vm.ffi(cmd);
        selectors = abi.decode(res, (bytes4[]));
    }

    function diamondCut(
        FacetCut[] calldata _diamondCut,
        address _init,
        bytes calldata _calldata
    ) external override {}
}




    

