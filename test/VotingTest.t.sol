// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {DeployVoting} from "../script/DeployVoting.s.sol";
import {Voting} from "../src/Voting.sol";
import {MaxVote} from "../src/MaxVote.sol";

contract VotingTest is Test {
    Voting voting;
    address USER = makeAddr("user");
    string[4] private candidateNames = ["hud", "nuh", "pius", "yol"];
    uint256[5] myArray = [2, 5, 1, 9, 4];

    function setUp() external {
        DeployVoting deploy = new DeployVoting();
        voting = deploy.run();
    }

    function testAddCandidate() public {
        vm.prank(msg.sender);
        voting.addCandidate("hud");

        assertEq(voting.getCandidate(0).name, "hud");
    }

    function testAddMultipleCandidates() public {
        //Arrange
        for (uint i = 0; i < candidateNames.length; i++) {
            vm.prank(msg.sender);
            voting.addCandidate(candidateNames[i]);
        }

        for (uint i = 0; i < candidateNames.length; i++) {
            assertEq(voting.getCandidate(i).name, candidateNames[i]);
        }
    }

    function testAddCandidateNotOnwer() public {
        vm.expectRevert();
        vm.prank(USER);
        voting.addCandidate("hud");
    }

    function testOnlyOwner() public view {
        console.log(voting.getOwner());
        console.log(msg.sender);
        assertEq(voting.getOwner(), msg.sender);
    }

    function testVote() public addCandidate {
        uint initialVoteCount = voting.getCandidate(0).voteCount;

        vm.prank(USER);
        voting.vote(0);

        uint finalVoteCount = voting.getCandidate(0).voteCount;

        assertEq(initialVoteCount + 1, finalVoteCount);
    }

    function testRepeatedVote() public addCandidate {
        vm.prank(USER);
        voting.vote(0);

        vm.expectRevert();
        vm.prank(USER);
        voting.vote(0);
    }

    function testResult() public addMultipleCandidate {
        // Arrange
        for (uint160 i = 0; i < 11; i++) {
            vm.prank(address(i));
            voting.vote(0);
        }

        for (uint160 i = 11; i < 13; i++) {
            vm.prank(address(i));
            voting.vote(1);
        }

        for (uint160 i = 13; i < 30; i++) {
            vm.prank(address(i));
            voting.vote(2);
        }

        assertEq(voting.getCandidate(2).name, voting.results().name);
        assertEq(voting.getCandidate(2).voteCount, voting.results().voteCount);
    }

    modifier addCandidate() {
        vm.prank(msg.sender);
        voting.addCandidate("hud");
        _;
    }

    modifier addMultipleCandidate() {
        vm.prank(msg.sender);
        voting.addCandidate("hud");
        vm.prank(msg.sender);
        voting.addCandidate("nuh");
        vm.prank(msg.sender);
        voting.addCandidate("pius");
        _;
    }
}
