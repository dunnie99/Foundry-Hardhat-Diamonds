// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "../../lib/openzeppelin-contracts/contracts/token/ERC1155/ERC1155.sol";
import "../../lib/openzeppelin-contracts/contracts/utils/Strings.sol";
import "../../lib/openzeppelin-contracts/contracts/access/Ownable.sol";
contract MockNFT is ERC1155, Ownable {
    uint256 public constant House = 1;
    uint256 public constant Land = 2;

    constructor() ERC1155("https://ipfs.io/ipfs/bafybeigxgjr3bre3vvro7duzpz2j5tfrhwnarlqw6yq5cce6fo5qh3u7yq/{id}.json") {}


    function mintProperty(address _to, uint256 _nftId, uint16 _amount) public {
         _mint(_to, _nftId, _amount, "");
    }
    function uri(uint256 _tokenid) override public pure returns (string memory) {
        return string(
            abi.encodePacked(
                "https://ipfs.io/ipfs/bafybeihjjkwdrxxjnuwevlqtqmh3iegcadc32sio4wmo7bv2gbf34qs34a/",
                Strings.toString(_tokenid),".json"
            )
        );
    }
}