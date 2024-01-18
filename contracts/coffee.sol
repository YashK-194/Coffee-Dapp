// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract coffee {
    struct memo {
        string name;
        string message;
        uint256 timestramp;
        address from;
    }

    address payable owner;
    memo[] memos;

    constructor() {
        owner = payable(msg.sender);
    }

    function buyCoffee(
        string calldata name,
        string calldata message
    ) external payable {
        require(msg.value > 0, "The Coffee is not free!");
        owner.transfer(msg.value);
        memos.push(memo(name, message, block.timestamp, msg.sender));
    }

    function getBuyers() external view returns (memo[] memory) {
        return memos;
    }
}
