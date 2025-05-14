# Voting-System-Dapp
This is a simplified voting system in the form of a smart contract written in Solidity, along with testing and deployment scripts written in JavaScript.
It includes function for the contract owner to authorize voters, prevent double voting and return the winning candidate. 

# Directions
You will need to have Node.js, npm and Ganache installed. Ganache allows you to locally run a lightweight blockchain for testing smart contracts. Since it
will run on local host, so you will need to deploy it each time to test the contract.

Run "npx hardhat init" in the directory where this project is stored in a terminal window and choose "Create a JavaScript project"

Run "npm install @openzeppelin/contracts". The "Ownable" contract will be used

In a separate terminal, run "ganache" to start a local blockchain and automatically create 10 accounts with 100 ETH

The hardhat.config.js is configured to match Ganache's chain ID to connect hardhat to Ganache's local blockchain

Open Metamask in a browser and add a custom network (local host). Enter the RPC URL from the ganache terminal and enter 1337 for Chain ID (Ganache default).
Set the currency symbol to ETH.

In the hardhat terminal, run "npx hardhat compile"

To test, run "npx hardhat test"

To deploy, run "npx hardhat run scripts/deploy.js --network localhost" which will deploy the contract by calling the constructor with 3 candidates. The address
of the contract will be returned.

In Metamask, make sure the test network (local host) is still connected and connect the first two accounts using the private keys outputted from the Ganache
terminal.

Open remix at (remix.ethereum.org) and connect it to Metamask (Injected Provider - Metamask)

In the at address field, paste the address from the hardhat terminal and click on "At address"

Call "authorizeVoter()" as the owner, with the second account's public key as the argument

Switch to the second account and call "vote(1)" to vote for Alice

Call "getWinner()" to view the candidate with the most votes

Sources:
- Solidity Documentation - Solidity by Example - Voting
