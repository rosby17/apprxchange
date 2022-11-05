const Crypto = artifacts.require("Crypto");

module.exports = function (deployer) {
deployer.deploy(Crypto);
};
