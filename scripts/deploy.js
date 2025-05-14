const hre = require("hardhat")

async function main() {
    const VotingSystem = await hre.ethers.getContractFactory("VotingSystem");
    const votingSystem = await VotingSystem.deploy(["Alice", "Bob", "Charlie"]);
    await votingSystem.waitForDeployment();
    console.log("votingSystem deployed to:", await votingSystem.getAddress());
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});