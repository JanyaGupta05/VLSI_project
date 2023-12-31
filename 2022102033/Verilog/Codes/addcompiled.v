
module adder(A0,A1,A2,A3,B0,B1,B2,B3,M,sum0,sum1,sum2,sum3,carryout);
  input A0,A1,A2,A3,B0,B1,B2,B3,M;
  output sum0,sum1,sum2,sum3,carryout;
  wire Bf0, Bf1, Bf2, Bf3,carrya1, carrya2, carrya3, carrya4;
  xor G1(Bf0,B0,M);
  xor G2(Bf1,B1,M);
  xor G3(Bf2,B2,M);
  xor G4(Bf3,B3,M);
  addblock call1(.A(A0),.B(Bf0),.M(M),.S(sum0),.C(carrya1));
  addblock G7(A1,Bf1,carrya1,sum1,carrya2);
  addblock G8(A2,Bf2,carrya2,sum2,carrya3);
  addblock G9(A3,Bf3,carrya3,sum3,carrya4);
  xor G5(carryout, carrya4,M);
endmodule
