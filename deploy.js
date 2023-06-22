const ethers = require("ethers");
const fs = require("node:fs");

async function main() {
    const provider = new ethers.JsonRpcProvider("http://127.0.0.1:7545");
    const wallet = new ethers.Wallet("0x270bb4da8863981f5fd7473026444595f9f6f30039562d0c4003805431453718", provider);
    const abi = fs.readFileSync("./1_Storage_sol_SimpleStorage.abi", "utf8");
    const binary = fs.readFileSync("./1_Storage_sol_SimpleStorage.bin", "utf8");
    const contractFactory = new ethers.ContractFactory(abi, binary, wallet);
    console.log("Deploying contract...");
    const contract = await contractFactory.deploy();
    console.log(contract);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.log(error);
        process.exit(0);
    });
