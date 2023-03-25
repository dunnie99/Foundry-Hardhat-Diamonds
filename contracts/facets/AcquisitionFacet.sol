// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../libraries/LibAcquisition.sol";
import {LibDiamond} from "../libraries/LibDiamond.sol"


contract AquisitionFacet{
    function listProperty_(
        uint256 _propertyId,
        string memory _propertyName,
        string memory _propertyDescription,
        string memory _propertyLocation,
        IERC1155 _propertyNft,
        uint256 _propertyNftId
    ) external {
        listProperty( uint256 _propertyId,string memory _propertyName, string memory _propertyDescription, string memory _propertyLocation, IERC1155 _propertyNft, uint256 _propertyNftId);
    }




    function buyPropertyUSDT(uint256 _propertyId) external {
        buyProperty(_propertyId, ETHUSDT, USDT);
    }

    function buyPropertyDAI(uint256 _propertyId) external {
        buyProperty(_propertyId, ETHDAI, DAI);
    }

    function buyPropertyUNI(uint256 _propertyId) external {
        buyProperty(_propertyId, ETHUNI, UNI);
    }

    function buyPropertyLINK(uint256 _propertyId) external {
        buyProperty(_propertyId, ETHLINK, LINK);
    }

    function buyPropertyAAVE(uint256 _propertyId) external {
        buyProperty(_propertyId, ETHAAVE, AAVE);
    }






    function buyProperty_(
        uint256 _propertyId,
        AggregatorV3Interface _token2swap,
        IERC20 _tokenAddress
    ) external {
        buyProperty(uint256 _propertyId, AggregatorV3Interface _token2swap, IERC20 _tokenAddress);
    }










































}


















