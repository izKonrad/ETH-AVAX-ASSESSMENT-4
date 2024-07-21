// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

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
        "Wand"
        
    ];
    address private storeAddress;
    mapping(address => string) private redeemedItems;

    event TokensMinted(address indexed to, uint256 amount);
    event TokensBurned(address indexed from, uint256 amount);
    event WeaponRedeemed(address indexed player, string weapon);

    constructor() ERC20("Degen", "DGN") {
        storeAddress = msg.sender; 
    }

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
        emit TokensMinted(to, amount);
    }

    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
        emit TokensBurned(msg.sender, amount);
    }

    function redeemWeapon() external {
        uint256 balance = balanceOf(msg.sender);
        require(balance > 0, "Insufficient token balance to redeem your Weapon");

        _burn(msg.sender, balance);

        string memory weapon = weapons[random() % weapons.length];

        redeemedItems[msg.sender] = weapon;

        emit WeaponRedeemed(msg.sender, weapon);
    }

    function getRedeemedItem(address player) external view returns (string memory) {
        return redeemedItems[player];
    }

    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        require(recipient != address(0), "ERC20: transfer to the zero address");
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    function random() private view returns (uint256) {
        return uint256(keccak256(abi.encodePacked(block.timestamp, blockhash(block.number - 1))));
    }

    function setStoreAddress(address _storeAddress) external onlyOwner {
        storeAddress = _storeAddress;
    }
}