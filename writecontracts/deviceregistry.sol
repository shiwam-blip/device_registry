// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DeviceRegistry {
    
    // Struct to store device info
    struct Device {
        string name;
        string deviceType;
        address owner;
    }

    // Device ID => Device details
    mapping(uint => Device) public devices;

    // Counter to generate unique device IDs
    uint public deviceCount = 0;

    // Register a new device
    function registerDevice(string memory _name, string memory _deviceType) public {
        deviceCount += 1;  

        devices[deviceCount] = Device({
            name: _name,
            deviceType: _deviceType,
            owner: msg.sender
        });
    }

    // Get device details by ID
    function getDevice(uint _deviceId) public view returns (string memory, string memory, address) {
        Device memory d = devices[_deviceId];
        return (d.name, d.deviceType, d.owner);
    }
}

