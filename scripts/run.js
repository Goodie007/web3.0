//  const main = async () => {
//    const waveContractFactory = await hre.ethers.getContractFactory("WavePortal");
//    const waveContract = await waveContractFactory.deploy({
//      value: hre.ethers.utils.parseEther("0.1"),
//    });

//    await waveContract.deployed();
//    console.log("Contract addy:", waveContract.address);

//    /* get balance */
//    let contractBalance = await hre.ethers.provider.getBalance(
//      waveContract.address
//    )
//    console.log(
//      "Contract balance:",
//      hre.ethers.utils.formatEther(contractBalance)
//    );

//   //  let waveCount;
//   //  waveCount = await waveContract.getTotalWaves();
//   //  console.log(waveCount.toNumber());

//    /**
//     * Let's send a few waves!
//     */
//    let waveTxn = await waveContract.wave("A message!");
//    await waveTxn.wait(); // Wait for the transaction to be mined

//    contractBalance = await hre.ethers.provider.getBalance(waveContract.address);
//    console.log(
//      "Contract balance:",
//      hre.ethers.utils.formatEther(contractBalance)
//    );

//    const [_, randomPerson] = await hre.ethers.getSigners();
//    waveTxn = await waveContract.connect(randomPerson).wave("Another message!");
//    await waveTxn.wait(); // Wait for the transaction to be mined

//    let allWaves = await waveContract.getAllWaves();
//    console.log(allWaves);
//  };

//  const runMain = async () => {
//    try {
//      await main();
//      process.exit(0);
//    } catch (error) {
//      console.log(error);
//      process.exit(1);
//    }
//  };

//  runMain();

// // const main = async () => {
// //   const waveContractFactory = await hre.ethers.getContractFactory('WavePortal');
// //   const waveContract = await waveContractFactory.deploy({
// //     value: hre.ethers.utils.parseEther('0.01'),
// //   });
// //   await waveContract.deployed();
// //   console.log('Contract addy:', waveContract.address);

// //   let contractBalance = await hre.ethers.provider.getBalance(
// //     waveContract.address
// //   );
// //   console.log(
// //     'Contract balance:',
// //     hre.ethers.utils.formatEther(contractBalance)
// //   );

// //   let waveTxn = await waveContract.wave('A message!');
// //   await waveTxn.wait();

// //   contractBalance = await hre.ethers.provider.getBalance(waveContract.addresss);
// //   console.log(
// //     'Contract balance:',
// //     hre.ethers.utils.formatEther(contractBalance)
// //   );

// //   let allWaves = await waveContract.getAllWaves();
// //   console.log(allWaves);
// // };

// // const runMain = async () => {
// //   try {
// //     await main();
// //     process.exit(0);
// //   } catch (error) {
// //     console.log(error);
// //     process.exit(1);
// //   }
// // };

// // runMain();

const main = async () => {
  const waveContractFactory = await hre.ethers.getContractFactory("WavePortal");
  const waveContract = await waveContractFactory.deploy({
    value: hre.ethers.utils.parseEther("0.1"),
  });
  await waveContract.deployed();
  console.log("Contract addy:", waveContract.address);

  let contractBalance = await hre.ethers.provider.getBalance(
    waveContract.address
  );
  console.log(
    "Contract balance:",
    hre.ethers.utils.formatEther(contractBalance)
  );

  /*
   * Let's try two waves now
   */
  const waveTxn = await waveContract.wave("This is wave #1");
  await waveTxn.wait();

  const waveTxn2 = await waveContract.wave("This is wave #2");
  await waveTxn2.wait();

  contractBalance = await hre.ethers.provider.getBalance(waveContract.address);
  console.log(
    "Contract balance:",
    hre.ethers.utils.formatEther(contractBalance)
  );

  let allWaves = await waveContract.getAllWaves();
  console.log(allWaves);
};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
};

runMain();