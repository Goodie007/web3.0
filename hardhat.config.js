require("@nomiclabs/hardhat-waffle");

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.8.0",
  networks: {
    rinkeby: {
      url: "https://eth-rinkeby.alchemyapi.io/v2/jOIZw-FSk8fFXuZYhuQfnRNE8HAZyUOI",
      accounts: ["a72f3b85b91e46a2cbd20bbf74b07a7a56265a0e0b179bdb9170ae2cbe906e47"]
    },
  },
};
