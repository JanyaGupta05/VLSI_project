module andmod(O3,O2,O1,O0,A0,A1,A2,A3,B0,B1,B2,B3);
    input A0,A1,A2,A3,B0,B1,B2,B3;
    output O3,O2,O1,O0;
    and G1(O3,A3,B3);
    and G2(O2,A2,B2);
    and G3(O1,A1,B1);
    and G4(O0,A0,B0);
endmodule
