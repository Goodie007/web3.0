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

     constructor() payable {
         console.log("We have been constructed!");

         //set the initial seed
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

     function wave(string memory _message) public {
         totalWaves += 1;
         console.log("%s has waved!", msg.sender);

         waves.push(Wave(msg.sender, _message, block.timestamp));

     emit NewWave(msg.sender, block.timestamp, _message);

     uint256 prizeAmount = 0.0001 ether;
     require(
         prizeAmount <= address(this).balance,
         "Trying to withdraw more money than the contract has."
     );
     (bool success, ) = (msg.sender).call{value: prizeAmount}("");
     require(success, "Failed to withdraw money from contract.");
   }

 }



// pragma solidity ^0.8.0;

// import "hardhat/console.sol";

// contract WavePortal {
//     uint256 totalWaves;

//     event NewWave(address indexed from, uint256 timestamp, string message);

//     struct Wave {
//         address waver;
//         string message;
//         uint256 timestamp;
//     }

//     Wave[] waves;

//     constructor() payable {
//         console.log("We have been constructed!");
//     }

//     function wave(string memory _message) public {
//         totalWaves += 1;
//         console.log("%s has waved!", msg.sender);

//         waves.push(Wave(msg.sender, _message, block.timestamp));

//         emit NewWave(msg.sender, block.timestamp, _message);

//         uint256 prizeAmount = 0.0001 ether;
//         require(
//             prizeAmount <= address(this).balance,
//             "Trying to withdraw more money than they contract has."
//         );
//         (bool success, ) = (msg.sender).call{value: prizeAmount}("");
//         require(success, "Failed to withdraw money from contract.");
//     }

//     function getAllWaves() public view returns (Wave[] memory) {
//         return waves;
//     }

//     function getTotalWaves() public view returns (uint256) {
//         return totalWaves;
//     }
// }