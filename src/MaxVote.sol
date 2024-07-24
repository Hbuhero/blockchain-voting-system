// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

library MaxVote {
    function max(uint[] memory myArray) internal pure returns (uint) {
        uint base = 0;
        uint index;
        for (uint i = 0; i < myArray.length; i++) {
            if (base >= myArray[i]) {
                continue;
            } else {
                base = myArray[i];
                index = i;
            }
        }

        return (index);
    }
}
