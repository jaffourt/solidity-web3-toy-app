const TestConwaysLife = artifacts.require("TestConwaysLife");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
contract("TestConwaysLife", function (/* accounts */) {
  it("should assert true", async function () {
    await TestConwaysLife.deployed();
    return assert.isTrue(true);
  });
});
