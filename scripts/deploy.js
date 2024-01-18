const hre = require("hardhat");
// const ethers = require("ethers");

async function main() {
  const Coffee = await hre.ethers.getContractFactory("coffee"); //fetching bytecode and ABI
  const coffee = await Coffee.deploy(); //creating an instance of our smart contract

  await coffee.waitForDeployment(); //deploying your smart contract
  const contractAddress = await coffee.getAddress();

  console.log("Deployed contract address:", `${contractAddress}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
