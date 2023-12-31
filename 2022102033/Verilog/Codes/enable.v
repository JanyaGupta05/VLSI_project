module enab(Af0,Af1,Af2,Af3,Bf0,Bf1,Bf2,Bf3,A0,A1,A2,A3,B0,B1,B2,B3,E);
    input E,A0,A1,A2,A3,B0,B1,B2,B3;
    output Af0,Af1,Af2,Af3,Bf0,Bf1,Bf2,Bf3;
    and G1(Af0,E,A0);
    and G2(Af1,E,A1);
    and G3(Af2,E,A2);
    and G4(Af3,E,A3);
    and G5(Bf0,E,B0);
    and G6(Bf1,E,B1);
    and G7(Bf2,E,B2);
    and G8(Bf3,E,B3);
endmodule