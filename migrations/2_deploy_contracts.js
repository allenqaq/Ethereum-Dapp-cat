var cat = artifacts.require("./cat.sol");

module.exports = function(deployer) {
  deployer.deploy(cat,"Tommy");
};
