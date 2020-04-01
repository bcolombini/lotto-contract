var Lotto = artifacts.require("Lotto");
// var JogoDoBicho = artifacts.require("JogoDoBicho");

module.exports = function(deployer) {
    deployer.deploy(Lotto);
    // deployer.deploy(JogoDoBicho);
}