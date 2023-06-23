const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("6_Payments.sol", () => {
    let account;
    let contract;

    beforeEach(async () => {
        [account] = await ethers.getSigners();
        const contractFactory = await ethers.getContractFactory("Payments", account);
        contract = await contractFactory.deploy();
        await contract.waitForDeployment();
    });

    it("should be deployed", async () => {
        const address = await contract.getAddress();
        expect(address).to.be.properAddress
    });

    it("should have 0 payments from account", async () => {
        const address = await account.getAddress();
        const payments = await contract.getPayments(address);
        expect(payments.length).to.eq(0);
    });

    it("should be possible to send transaction", async () => {
        const transaction = await contract.pay("test message", { value: 100 });
        await transaction.wait();

        const address = await account.getAddress();
        const payments = await contract.getPayments(address);
        expect(payments.length).to.eq(1);
    });
});
