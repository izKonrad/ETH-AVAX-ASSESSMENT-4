// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts@4.9.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.9.0/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
    string[] private weapons = [
        "Two-handed Sword",
        "Spear",
        "Twin Sword",
        "One-handed Sword",
        "Bow",
        "Dagger",
        "Staff",
        "Wand",
        "Crossbow",
        "Axe"
    ];

    mapping(string => uint256) public weaponPrices;
    mapping(address => string) public inventory;

    constructor() ERC20("Degen", "DGN") {
        _mint(msg.sender, 1000000 * 1 ** uint(decimals()));

        weaponPrices["Two-handed Sword"] = 100 * 1 ** uint(decimals());
        weaponPrices["Spear"] = 80 * 1 ** uint(decimals());
        weaponPrices["Twin Sword"] = 90 * 1 ** uint(decimals());
        weaponPrices["One-handed Sword"] = 70 * 1 ** uint(decimals());
        weaponPrices["Bow"] = 60 * 1 ** uint(decimals());
        weaponPrices["Dagger"] = 50 * 1 ** uint(decimals());
        weaponPrices["Staff"] = 110 * 1 ** uint(decimals());
        weaponPrices["Wand"] = 120 * 1 ** uint(decimals());
        weaponPrices["Crossbow"] = 85 * 1 ** uint(decimals());
        weaponPrices["Axe"] = 95 * 1 ** uint(decimals());
    }

    function checkBalance(address account) public view returns (uint256) {
        return balanceOf(account);
    }

    function burn(uint256 amount) public {
        _burn(_msgSender(), amount);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function transfer(address to, uint256 amount) public virtual override returns (bool) {
        _transfer(_msgSender(), to, amount);
        return true;
    }

    function redeem(string memory weaponName) external {
        require(weaponPrices[weaponName] > 0, "Weapon does not exist");
        uint256 weaponPrice = weaponPrices[weaponName];
        require(balanceOf(msg.sender) >= weaponPrice, "Insufficient balance to buy this weapon!");

        _burn(msg.sender, weaponPrice);

        inventory[msg.sender] = weaponName;
    }

    function getRedeemedItem(address account) external view returns (string memory) {
        return inventory[account];
    }
}
