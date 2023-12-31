module compare(AgB,AeB,AlB,A0,A1,A2,A3,B0,B1,B2,B3);
    output AgB,AeB,AlB;
    input A0,A1,A2,A3,B0,B1,B2,B3;
    wire t0,t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12;
    and G1(t0,A3,~B3);
    xnor G2(t1,A3,B3);
    and G3(t2,A2,~B2,t1);
    xnor G4(t3,A2,B2);
    and G5(t4,t3,t1,~B1,A1);
    xnor G6(t5,A1,B1);
    and G7(t6,t1,t3,t5,A0,~B0);
    or G8(AgB,t0,t2,t4,t6);

    and G9(t8,~A3,B3);
    // xnor G10(t9,A3,B3);
    and G10(t9,~A2,B2,t1);
    // xnor G4(t3,A2,B2);
    and G11(t10,t3,t1,B1,~A1);
    // xnor G6(t5,A1,B1);
    and G12(t11,t1,t3,t5,~A0,B0);
    or G13(AlB,t8,t9,t10,t11);

    xnor G14(t12,A0,B0);
    and G15(AeB,t1,t3,t5,t12);
endmodule
    

    
