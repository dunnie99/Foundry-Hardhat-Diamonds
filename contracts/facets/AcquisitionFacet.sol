// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../libraries/LibAcquisition.sol";
import "../libraries/AcquisitionStorage.sol";

import {LibDiamond} from "../libraries/LibDiamond.sol";


contract AquisitionFacet{

    function setState() external returns (bool) {}
    function listProperty_(
        uint256 _propertyId,
        string memory _propertyName,
        string memory _propertyDescription,
        string memory _propertyLocation,
        IERC1155 _propertyNft,
        uint256 _propertyNftId
    ) external {
        LibAcquisition.listProperty( _propertyId, _propertyName, _propertyDescription, _propertyLocation, _propertyNft, _propertyNftId);
    }




    function buyPropertyUSDT_(uint256 _propertyId) external {
        LibAcquisition.buyPropertyUSDT(_propertyId);
    }

    function buyPropertyDAI_(uint256 _propertyId) external {
        LibAcquisition.buyPropertyDAI(_propertyId);
    }

    function buyPropertyUNI_(uint256 _propertyId) external {
        LibAcquisition.buyPropertyUNI(_propertyId);
    }

    function buyPropertyLINK_(uint256 _propertyId) external {
        LibAcquisition.buyPropertyLINK(_propertyId);
    }

    function buyPropertyAAVE_(uint256 _propertyId) external {
        LibAcquisition.buyPropertyAAVE(_propertyId);
    }





    function withdrawNFT_(IERC1155 _tokenAddress, 
        address _recipientAddress, 
        uint256 _propertyNftId, 
        uint256 _propertyID) external {
        LibAcquisition.withdrawNFT(_tokenAddress, _recipientAddress, _propertyNftId, _propertyID);
    }

    function withdrawTokens_(IERC20 _tokenAddress, 
        address _recipientAddress, 
        uint _amount
        ) external {
        LibAcquisition.withdrawTokens(_tokenAddress, _recipientAddress, _amount);
    }








































}


















