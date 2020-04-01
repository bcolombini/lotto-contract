var HDWalletProvider = require("truffle-hdwallet-provider");
module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!
  networks: {
    ropsten: {
      provider: function() {
        return new HDWalletProvider("2fe3192ea2a637cdc6533cbbbb0eb02427d283ac8f9536ae2f99664a48ab4d14", "https://ropsten.infura.io/v3/6c01b95707d2486b96b09e4e4a620af5");
      },
      network_id: '3',
    },
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*", // Match any network id
      websockets: true
    },
    develop: {
      port: 8545
    }
  }
};
