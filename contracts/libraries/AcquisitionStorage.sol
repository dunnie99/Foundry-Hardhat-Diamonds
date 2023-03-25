// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import "../../lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";
import "../../lib/openzeppelin-contracts/contracts/token/ERC1155/IERC1155.sol";
import "../../lib/chainlink-brownie-contracts/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";



struct Property {
        bool forSale;
        address owner;
        string name;
        IERC1155 nft;
        uint256 nftId;
        string description;
        string location;
        uint256 price;
    }





struct AcquisitionStorage {
    //chainlink price feed addresses.
    AggregatorV3Interface ETHLINK;
    AggregatorV3Interface ETHAAVE;
    AggregatorV3Interface ETHDAI;
    AggregatorV3Interface ETHUSDT;
    AggregatorV3Interface ETHUNI;
    //Accepted tokens addresses
    IERC20 LINK;
    IERC20 AAVE;
    IERC20 DAI;
    IERC20 USDT;
    IERC20 UNI;
    address moderator;
    //Array of listed property IDs
    uint256[] propertyIds;
    //mapping of property ID to struct that contains property info
    mapping(uint256 => Property) properties;
    mapping(uint256 => bool) idUsed;

}