// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract DegenToken {
    address public owner;
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;

    constructor() {
        owner = msg.sender;
        name = "Degen";
        symbol = "DGN";
        decimals = 10;
        totalSupply = 0;
        storeNftAccessory(0, "Diamond Sword", 50);
        storeNftAccessory(1, "Sapphire Sword", 100);
        storeNftAccessory(2, "Jade Sword", 200);
        storeNftAccessory(3, "Crystal Sword", 250);
    }

    modifier ownerOnly() {
        require(msg.sender == owner, "This function can only be used by the owner.");
        _;
    }

    mapping(address => uint256) private balance;
    mapping(address => mapping(address => uint256)) private allowances;
    mapping(uint256 => Nft) public nftaccs;

    struct Nft {
        string name;
        uint256 price;
    }

    function storeNftAccessory(uint256 itemId, string memory itemName, uint256 itemPrice) public ownerOnly {
        nftaccs[itemId] = Nft(itemName, itemPrice);
    }

    event Mint(address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Burn(address indexed from, uint256 value);
    event Redeem(address indexed from, string itemName);

    function mint(address to, uint256 amount) external ownerOnly {
        totalSupply += amount;
        balance[to] += amount;

        emit Mint(to, amount);
        emit Transfer(address(0), to, amount);
    }

    function balanceOf(address accountAddress) external view returns (uint256) {
        return balance[accountAddress];
    }

    function transfer(address reciever, uint256 amount) external returns (bool) {
        require(balance[msg.sender] >= amount, "Kindly enter an amount lower than or equal to your balance.");

        balance[msg.sender] -= amount;
        balance[reciever] += amount;

        emit Transfer(msg.sender, reciever, amount);
        return true;
    }

    function transferFrom(address sender, address reciever, uint256 amount) external returns (bool) {
        require(balance[msg.sender] >= amount, "Kindly enter an amount lower than or equal to your balance.");
        require(allowances[sender][msg.sender] >= amount, "Kindly enter an amount lower than or equal to your balance.");

        balance[sender] -= amount;
        balance[reciever] += amount;
        allowances[sender][msg.sender] -= amount;

        emit Transfer(sender, reciever, amount);
        return true;
    }

    function burn(uint256 amount) external {
        require(amount <= balance[msg.sender], "Kindly enter an amount lower than or equal to your balance.");

        balance[msg.sender] -= amount;
        totalSupply -= amount;

        emit Burn(msg.sender, amount);
        emit Transfer(msg.sender, address(0), amount);
    }

    function redeem(uint256 accId) external returns (string memory) {
        require(balance[msg.sender] > 0, "Balance is very low and unredeemable.");
        require(nftaccs[accId].price > 0, "Invalid item ID.");

        uint256 redemptionAmount = nftaccs[accId].price;
        require(balance[msg.sender] >= redemptionAmount, "Balance should be equal to or more than the item to redeem it.");

        balance[msg.sender] -= redemptionAmount;

        emit Redeem(msg.sender, nftaccs[accId].name);

        return nftaccs[accId].name;
    }
}