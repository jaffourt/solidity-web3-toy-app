// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract ConwaysLife {
    
    // World state
    uint[] private x;
    uint[] private y;
    bool[] private alive;
    // N+1 world state
    bool[] private nextAlive;

    function initState(uint _x, uint _y) public {
        x = new uint[](_x * _y);
        y = new uint[](_x * _y);
        alive = new bool[](_x * _y);
        nextAlive = new bool[](_x * _y);
        for (uint i = 0; i < x.length; i++) {
            x[i] = i % _x;
            y[i] = i / _x;
            alive[i] = false;
        }
    }

    function step() public {
        // Reset and copy state to next state
        for (uint i = 0; i < alive.length; i++) {
            nextAlive[i] = alive[i];
        }

        // Iterate through all the cells
        for (uint i = 0; i < alive.length; i++) {
            uint tempX = x[i];
            uint tempY = y[i];
            // Count how many alive neighbors
            uint aliveNeighbors = 0;
            for (uint j = 0; j < alive.length; j++) {
                uint tempX2 = x[j];
                uint tempY2 = y[j];

                if (isNeighbor(tempX2, tempY2, tempX, tempY) && alive[j]) {
                    aliveNeighbors++;
                }
            }
            // Conway's Game of Life rules:
            // ---------------------------------------------------------------------------
            // 1. A live cell dies if it has fewer than two live neighbors.
            // 2. A live cell with two or three live neighbors lives on to the next generation.
            // 3. A live cell with more than three live neighbors dies.
            // 4. A dead cell will be brought back to live if it has exactly three live neighbors.

            // kill/spawn a cell from rules
            if (alive[i]) {
                nextAlive[i] = (aliveNeighbors == 2) || (aliveNeighbors == 3);
            } else {
                nextAlive[i] = (aliveNeighbors == 3);
            }
        }
        // Update state
        for (uint i = 0; i < alive.length; i++) {
            alive[i] = nextAlive[i];
        }
    }

    function getState() public view returns (uint[] memory, uint[] memory, bool[] memory) {
        return (x, y, alive);
    }

    function isNeighbor(uint x1, uint y1, uint x2, uint y2) internal pure returns (bool) {
        return (abs(int256(x1) - int256(x2)) <= 1) && (abs(int256(y1) - int256(y2)) <= 1);
    }

    function abs(int256 a) internal pure returns (int256) {
        // Copied from: https://ethereum.stackexchange.com/a/84391
        // I'm surprised this doesn't exist natively
        return a > 0 ? a : -a;
    }
}