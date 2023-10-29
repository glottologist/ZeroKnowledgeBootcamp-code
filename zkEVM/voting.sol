// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract SimpleVoting {
    struct Candidate {
        uint256 id;
        string name;
        uint256 voteCount;
    }

    mapping(uint256 => Candidate) public candidates;
    mapping(address => bool) public voters;
    uint256 public candidatesCount;

    event CandidateAdded(uint256 indexed candidateId, string name);
    event Voted(address indexed voter, uint256 indexed candidateId);

    function addCandidate(string memory name) public {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, name, 0);
        emit CandidateAdded(candidatesCount, name);
    }

    function vote(uint256 candidateId) public {
        require(!voters[msg.sender], "You have already voted.");
        require(candidateId > 0 && candidateId <= candidatesCount, "Invalid candidate ID.");

        voters[msg.sender] = true;
        candidates[candidateId].voteCount++;
        emit Voted(msg.sender, candidateId);
    }

    function getWinner() public view returns (uint256 winnerId, string memory winnerName) {
        uint256 highestVoteCount = 0;

        for (uint256 i = 1; i <= candidatesCount; i++) {
            if (candidates[i].voteCount > highestVoteCount) {
                highestVoteCount = candidates[i].voteCount;
                winnerId = candidates[i].id;
                winnerName = candidates[i].name;
            }
        }
    }
}