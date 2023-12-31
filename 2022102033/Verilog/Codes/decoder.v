module decode(D0,D1,D2,D3,S0,S1);
    input S0,S1;
    output D0,D1,D2,D3;
    and G1(D0,~S0,~S1);
    and G2(D1,S0,~S1);
    and G3(D2,~S0,S1);
    and G4(D3,S0,S1);
endmodule
