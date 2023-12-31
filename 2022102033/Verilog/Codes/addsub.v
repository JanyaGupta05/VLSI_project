
module addblock(A,B,M,S,C);
    input A,B,M;
    output S,C;
    wire t0,t1,t2,Cout;
    
    xor G2(t1,A,B);
    xor G3(S,M,t1);
    and G4(t2,A,B);
    and G5(Cout,M,t1);
    or G6(C,Cout,t2);
endmodule

// `include "fulladder.v"
// module addblock(A0,A1,A2,A3,B0,B1,B2,B3,M,S0,S1,S2,S3,Carryf)
//       input A0,A1,A2,A3,B0,B1,B2,B3,M;
//       output S0,S1,S2,S3,Carryf;
//       wire C1,C2,C3;
//       wire Bf0, Bf1, Bf2, Bf3;
//       xor G1(Bf0,B0,M);
//       xor G2(Bf1,B1,M);
//       xor G3(Bf2,B2,M);
//       xor G4(Bf3,B3,M);
//       adder call1(A0,Bf0,M,S0,C1);
//       adder call2(A1,Bf1,C1,S1,C2);
//       adder call1(A0,Bf2,C2,S2,C3);
//       adder call1(A0,Bf3,M,S3,Carryf);
// endmodule
