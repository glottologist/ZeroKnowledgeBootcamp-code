pragma circom 2.1.4;

template IsZero() {
   signal input in;
    signal output isZero;
signal inv;
    inv <-- in!=0 ? 1/in : 0;
    out <== -in*inv +1;
    in*out === 0;
}

component main = IsZero();

/* INPUT = {
    "in": "5"
} */
