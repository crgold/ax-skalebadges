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

    function _beforeTokenTransfer(
        address operator,
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory amounts,
        bytes memory data
    ) internal override {
        super._beforeTokenTransfer(operator, from, to, ids, amounts, data);

        if (from == address(0)) {
            for (uint256 i = 0; i < ids.length; ++i) {
                totalSupply[ids[i]] += amounts[i];
            }
        } else {
            revert("Soulbound NFT's cannot be transferred or burned");
        }
    }
}