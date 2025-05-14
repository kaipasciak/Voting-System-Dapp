// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";

contract VotingSystem is Ownable {
    // Struct to store candidate information
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // Mapping to track candidates (id => Candidate)
    mapping(uint => Candidate) public candidates;
    // Mapping to track if an address has voted
    mapping(address => bool) public hasVoted;
    // Mapping to track authorized voters
    mapping(address => bool) public authorizedVoters;

    // Total number of candidates
    uint public candidatesCount;
    // Event emitted when a vote is cast
    event Voted(uint indexed candidateId, address voter);
    
    // Constructor to initialize candidates
    constructor(string[] memory candidateNames) Ownable(msg.sender) {
        for (uint i = 0; i < candidateNames.length; i++) {
            candidatesCount++;
            candidates[candidatesCount] = Candidate(candidatesCount, candidateNames[i], 0);
        }
    }

    // Authorize a voter (only owner)
    function authorizeVoger(address voter) external onlyOwner {
        authorizedVoters[voter] = true;
    }

    // Vote for a candidate
    function vote(uint candidateId) external {
        require(authorizedVoters[msg.sender], "Not authorized to vote");
        require(!hasVoted[msg.sender], "Already voted");
        require(candidateId > 0 && candidateId <= candidatesCount, "Invalid candidate");

        hasVoted[msg.sender] = true;
        candidates[candidateId].voteCount++;
        emit Voted(candidateId, msg.sender);
    }

    // Get the winner (candidate with most votes)
    function getWinner() external view returns (string memory winnerName, uint winnerVotes) {
        uint highestVotes = 0;
        uint winningId = 0;

        for (uint i = 1; i <=candidatesCount; i++) {
            if (candidates[i].voteCount > highestVotes) {
                highestVotes = candidates[i].voteCount;
                winningId = i;
            }
        }
        return (candidates[winningId].name, highestVotes);
    }
}