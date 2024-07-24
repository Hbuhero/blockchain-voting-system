// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;
import {Test, console} from "forge-std/Test.sol";
import {MaxVote} from "../src/MaxVote.sol";

contract Voting {
    using MaxVote for address;

    address public i_owner;
    Candidate[] private candidateList;
    mapping(address => bool) alreadyVoted;

    constructor() {
        i_owner = msg.sender;
    }

    struct Candidate {
        string name;
        uint voteCount;
    }

    function vote(uint index) public Voted {
        candidateList[index].voteCount += 1;
        alreadyVoted[msg.sender] = true;
        emit VotedSuccessful(msg.sender);
    }

    function results() public view returns (Candidate memory) {
        uint[] memory voteArray = new uint[](12);
        for (uint i = 0; i < candidateList.length; i++) {
            voteArray[i] = candidateList[i].voteCount;
        }
        console.log("ok");
        return getCandidate(MaxVote.max(voteArray));
    }

    function addCandidate(string memory _name) public OnlyOwner {
        Candidate memory candidate = Candidate({name: _name, voteCount: 0});
        candidateList.push(candidate);
        // emit CandidateAdded(candidate);
    }

    function getCandidate(uint index) public view returns (Candidate memory) {
        return candidateList[index];
    }

    function getOwner() public view returns (address) {
        return i_owner;
    }

    modifier OnlyOwner() {
        require(msg.sender == i_owner);
        _;
    }

    modifier Voted() {
        require(alreadyVoted[msg.sender] != true);
        _;
    }

    event CandidateAdded(Candidate _candidate);
    event VotedSuccessful(address voter);
}

//voters- should vote once. Use mapping with user address to determine if voted or not
//candidate to vote for. Use a struct with name, address and vote count
//announcing winner
