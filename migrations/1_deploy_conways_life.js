const ConwaysLife = artifacts.require("ConwaysLife");

module.exports = function(deployer) {
  deployer.deploy(ConwaysLife);
};