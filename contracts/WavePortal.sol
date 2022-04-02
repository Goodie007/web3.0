// SPDX-License-Identifier: UNLICENSED

 pragma solidity ^0.8.0;

 import "hardhat/console.sol";

 contract WavePortal {
     uint256 totalWaves;

     uint256 private seed;
    
     /* events in solidity */
     event NewWave(address indexed from, uint timestamp, string message);
     /* creation of struct, a strubct is a custom datatype that can hold objects */

     struct Wave {
         address waver; // address of who waved
         string message; //content of msg
         uint timestamp; // time the user waved
     }

     /* declaration of variables that store arrays of waves */
     Wave[] waves;

     //associating an address with a number using mapping
     mapping(address => uint256) public lastWavedAt;

     constructor() payable {
         console.log("We have been constructed!");
         
           //set the initial seed
         seed = (block.timestamp + block.difficulty) % 100;

       
     }

     function wave(string memory _message) public {
         require (
             //current timestamp is greater than 15min ago
             lastWavedAt[msg.sender] + 2 minutes < block.timestamp,
             "Wait 15m"
         );

         lastWavedAt[msg.sender] = block.timestamp;

         totalWaves += 1;
         console.log("%s has waved!", msg.sender);

         waves.push(Wave(msg.sender, _message, block.timestamp));

        
            seed = (block.timestamp + block.difficulty) % 100;

          console.log("Random # generated: %d", seed);

          /*
         * Give a 50% chance that the user wins the prize.
         */
        if (seed <= 50) {
            console.log("%s won!", msg.sender);

            /*
             * The same code we had before to send the prize.
             */
            uint256 prizeAmount = 0.0001 ether;
            require(
                prizeAmount <= address(this).balance,
                "Trying to withdraw more money than the contract has."
            );
            (bool success, ) = (msg.sender).call{value: prizeAmount}("");
            require(success, "Failed to withdraw money from contract.");
        }

        emit NewWave(msg.sender, block.timestamp, _message);
    }

         function getAllWaves() public view returns (Wave[] memory) {
             return waves;
         }

         function getTotalWaves() public view returns (uint256) {
             return totalWaves;
        }


 }

