// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import "../../lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";
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
    AggregatorV3Interface ETHLINK =
        AggregatorV3Interface(0xDC530D9457755926550b59e8ECcdaE7624181557);
    AggregatorV3Interface ETHAAVE =
        AggregatorV3Interface(0x6Df09E975c830ECae5bd4eD9d90f3A95a4f88012);
    AggregatorV3Interface ETHDAI =
        AggregatorV3Interface(0x773616E4d11A78F511299002da57A0a94577F1f4);
    AggregatorV3Interface ETHUSDT =
        AggregatorV3Interface(0xEe9F2375b4bdF6387aa8265dD4FB8F16512A1d46);
    AggregatorV3Interface ETHUNI =
        AggregatorV3Interface(0xD6aA3D25116d8dA79Ea0246c4826EB951872e02e);
    //Accepted tokens addresses
    IERC20 internal LINK = IERC20(0x514910771AF9Ca656af840dff83E8264EcF986CA);
    IERC20 internal AAVE = IERC20(0x7Fc66500c84A76Ad7e9c93437bFc5Ac33E2DDaE9);
    IERC20 internal DAI = IERC20(0x6B175474E89094C44Da98b954EedeAC495271d0F);
    IERC20 internal USDT = IERC20(0xdAC17F958D2ee523a2206206994597C13D831ec7);
    IERC20 internal UNI = IERC20(0x1f9840a85d5aF5bf1D1762F925BDADdC4201F984);
    address public moderator = msg.sender;
    //Array of listed property IDs
    uint256[] public propertyIds;
    //mapping of property ID to struct that contains property info
    mapping(uint256 => Property) public properties;
    mapping(uint256 => bool) idUsed;

}