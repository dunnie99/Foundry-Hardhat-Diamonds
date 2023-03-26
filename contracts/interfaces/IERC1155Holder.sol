// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v4.5.0) (token/ERC1155/utils/ERC1155Holder.sol)
pragma solidity ^0.8.0;


// import "../../lib/openzeppelin-contracts/contracts/token/ERC1155/utils/ERC1155Receiver.sol";
contract IERC1155Holder {
    function onERC1155Received(
        address,
        address,
        uint256,
        uint256,
        bytes memory
    ) external returns (bytes4){}

    function onERC1155BatchReceived(
        address,
        address,
        uint256[] memory,
        uint256[] memory,
        bytes memory
    ) external returns (bytes4){}
}