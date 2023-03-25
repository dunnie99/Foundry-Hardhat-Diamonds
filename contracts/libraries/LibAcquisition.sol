// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "../libraries/AcquisitionStorage.sol";
import "../../lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";
import "../../lib/openzeppelin-contracts/contracts/token/ERC1155/IERC1155.sol";

library LibAquisition{
    //function events
    event PropertyListed(
        uint256 indexed propertyId,
        uint256 indexed nftId,
        address indexed oldOwner
    );

    event PropertySold(
        uint256 indexed propertyId, 
        address indexed newOwner
    );

    event onlyOwnerWithdrawal(
        address indexed moderator, 
        uint256 indexed propertyNftId, 
        address indexed recipientAddress, 
        IERC1155  tokenAddress
    );
    modifier onlyOwner() {
        require(msg.sender == moderator, "Not a moderator");
        _;
    }

    modifier isValidID(uint _propertyId) {
        require((idUsed[_propertyId]), "INVALID ID");
        _;
    }


    function getPrice(
        AggregatorV3Interface _token2swap
    ) internal view returns (int) {
        (, int256 price, , , ) = _token2swap.latestRoundData();

        return (price);
    }

    //int ethPrice = getPrice(ETHUSD, tokenDecimal);

    function listProperty(
        uint256 _propertyId,
        string memory _propertyName,
        string memory _propertyDescription,
        string memory _propertyLocation,
        IERC1155 _propertyNft,
        uint256 _propertyNftId
    ) internal {
        //require(msg.value > 0, "Insufficient Fund");
        require(idUsed[_propertyId] == false, "ID already taken");
        idUsed[_propertyId] = true;
        propertyIds.push(_propertyId);
        _propertyNft.safeTransferFrom(
            msg.sender,
            address(this),
            _propertyNftId,
            1,
            "0x0"
        );

        Property memory newProperty = Property({
            forSale: true,
            price: 3.5 ether,
            owner: msg.sender,
            name: _propertyName,
            description: _propertyDescription,
            location: _propertyLocation,
            nft: _propertyNft,
            nftId: _propertyNftId
        });

        properties[_propertyId] = newProperty;

        emit PropertyListed(_propertyId, _propertyNftId, msg.sender);
    }

    
    function buyProperty(
        uint256 _propertyId,
        AggregatorV3Interface _token2swap,
        IERC20 _tokenAddress
    ) internal isValidID(_propertyId) {
        Property storage property = properties[_propertyId];
        require(property.forSale == true, "Property sold out");
        uint256 usdt = uint256(getPrice(_token2swap));
        uint256 propertyPrice = property.price * usdt;
        address newOwner = msg.sender;
        require(
            propertyPrice <= _tokenAddress.balanceOf(newOwner),
            "Insufficient balance for property purchase"
        );
        _tokenAddress.transferFrom(newOwner, address(this), propertyPrice);

        _tokenAddress.transfer(property.owner, propertyPrice);

        (property.nft).safeTransferFrom(
            address(this),
            newOwner,
            property.nftId,
            1,
            "0x0"
        );
        
        property.forSale = false;
        property.owner = newOwner;

        emit PropertySold(_propertyId, newOwner);
    }

    function withdrawNFT(IERC1155 _tokenAddress, address _recipientAddress, uint256 _propertyNftId, uint256 _propertyID) internal onlyOwner() {
        require(_recipientAddress != address(0), "Invalid address");
        require(idUsed[_propertyID], "Invalid PropertyID");
        Property storage property = properties[_propertyID];
        require(property.nftId == _propertyNftId, "Invalid _propertyNftId");
        _tokenAddress.safeTransferFrom(
            address(this),
            _recipientAddress,
            _propertyNftId,
            1,
            "0x0"
        );

        emit onlyOwnerWithdrawal(msg.sender, _propertyNftId, _recipientAddress, _tokenAddress);
    }

    function withdrawTokens(IERC20 _tokenAddress, address _recipientAddress, uint _amount) internal onlyOwner() {
        require(_recipientAddress != address(0), "Invalid address");
        require(_amount <= _tokenAddress.balanceOf(address(this)), "Insufficient acount balance");
        _tokenAddress.transferFrom(address(this), _recipientAddress, _amount);
    }

    
}






































