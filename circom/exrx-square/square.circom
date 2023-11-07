pragma circom 2.1.4;

template SquareNTimes (n) {
    signal input base;
    signal output result;

    signal square[n+1];
    square[0] <== base;
    for(var i = 0; i < n; i++) {
        // constraint 1: Each square[i+1] is the square of square[i]
        square[i+1] <== square[i] * square[i];
    }
    // constraint 2: result is the last squared value
    result <== square[n];
}

component main { public [ base ] } = SquareNTimes(2);

/*
INPUT = { "base": "3" }
*/
