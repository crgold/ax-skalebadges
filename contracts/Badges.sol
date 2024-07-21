// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@thirdweb-dev/contracts/base/ERC1155Base.sol";

contract Badges is ERC1155Base {

    constructor(
        address _defaultAdmin,
        string memory _name,
        string memory _symbol
    )
        ERC1155Base(
            _defaultAdmin,
            _name,
            _symbol,
            address(0x0Fd26096A4a9b0E1C774cD2c53F63e44BcAcC004),
            uint128(0)
        )
    {}

    /*//////////////////////////////////////////////////////////////
            Overriden logic to disable NFT transfers and burns
    //////////////////////////////////////////////////////////////*/

    function safeTransferFrom(
        address from,
        address to,
        uint256 id,
        uint256 amount,
        bytes memory data
    ) public pure override {
        revert("Soulbound NFTs cannot be transferred");
    }

    function safeBatchTransferFrom(
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory amounts,
        bytes memory data
    ) public pure override {
        revert("Soulbound NFTs cannot be transferred");
    }

    function burn(
        address _owner,
        uint256 _tokenId,
        uint256 _amount
    ) external pure override {
        revert("Soulbound NFTs cannot be burned");
    }

    function burnBatch(
        address _owner,
        uint256[] memory _tokenIds,
        uint256[] memory _amounts
    ) external pure override {
        revert("Soulbound NFTs cannot be burned");
    }
}