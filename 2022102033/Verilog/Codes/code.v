`include "decoder.v"
`include "enable.v"
`include "comparator.v"
`include "and.v"
`include "addsub.v"
`include "addcompiled.v"
`timescale 1ns / 1ns
module final;
  reg S0, S1, A0, A1, A2, A3, B0, B1, B2, B3;
  wire O0, O1, O2, O3, D0, D1, D2, D3, Af0, Af1, Af2, Af3, Bf0, Bf1, Bf2, Bf3,Af10, Af11, Af12, Af13, Bf10, Bf11, Bf12, Bf13,Af20, Af21, Af22, Af23, Bf20, Bf21, Bf22, Bf23,Af30, Af31, Af32, Af33, Bf30, B3f1, Bf32, Bf33, AgB, AeB, AlB;
  decode call1(.S0(S0),.S1(S1),.D0(D0),.D1(D1),.D2(D2),.D3(D3));
  wire suma0, suma1, suma2, suma3, carryf;
  enab call2(.E(D0),.A0(A0),.A1(A1),.A2(A2),.A3(A3),.B0(B0),.B1(B1),.B2(B2),.B3(B3),.Af0(Af0),.Af1(Af1),.Af2(Af2),.Af3(Af3),.Bf0(Bf0),.Bf1(Bf1),.Bf2(Bf2),.Bf3(Bf3) );

  adder call16(.A0(Af0),.A1(Af1),.A2(Af2),.A3(Af3),.B0(Bf0),.B1(Bf1),.B2(Bf2),.B3(Bf3),.M(S0),.sum0(suma0),.sum1(suma1),.sum2(suma2),.sum3(suma3),.carryout(carryf));
  // enab call4(.E(D1),.A0(A0),.A1(A1),.A2(A2),.A3(A3),.B0(B0),.B1(B1),.B2(B2),.B3(B3),.Af0(Af0),.Af1(Af1),.Af2(Af2),.Af3(Af3),.Bf0(Bf0),.Bf1(Bf1),.Bf2(Bf2),.Bf3(Bf3) );
  wire sums0, sums1, sums2, sums3,  carrysf;
  enab call4(.E(D1),.A0(A0),.A1(A1),.A2(A2),.A3(A3),.B0(B0),.B1(B1),.B2(B2),.B3(B3),.Af0(Af10),.Af1(Af11),.Af2(Af12),.Af3(Af13),.Bf0(Bf10),.Bf1(Bf11),.Bf2(Bf12),.Bf3(Bf13) );
  adder call15(.A0(Af10),.A1(Af11),.A2(Af12),.A3(Af13),.B0(Bf10),.B1(Bf11),.B2(Bf12),.B3(Bf13),.M(S0),.sum0(sums0),.sum1(sums1),.sum2(sums2),.sum3(sums3),.carryout(carrysf));
  
   enab call6(.E(D2),.A0(A0),.A1(A1),.A2(A2),.A3(A3),.B0(B0),.B1(B1),.B2(B2),.B3(B3),.Af0(Af20),.Af1(Af21),.Af2(Af22),.Af3(Af23),.Bf0(Bf20),.Bf1(Bf21),.Bf2(Bf22),.Bf3(Bf23) );
   compare call3(.A0(Af20),.A1(Af21),.A2(Af22),.A3(Af23),.B0(Bf20),.B1(Bf21),.B2(Bf22),.B3(Bf23),.AgB(AgB),.AlB(AlB),.AeB(AeB));
   
   enab call8(.E(D3),.A0(A0),.A1(A1),.A2(A2),.A3(A3),.B0(B0),.B1(B1),.B2(B2),.B3(B3),.Af0(Af30),.Af1(Af31),.Af2(Af32),.Af3(Af33),.Bf0(Bf30),.Bf1(Bf31),.Bf2(Bf32),.Bf3(Bf33) );
  andmod call9(.O0(O0), .O1(O1), .O2(O2), .O3(O3), .A0(Af30),.A1(Af31),.A2(Af32),.A3(Af33),.B0(Bf30),.B1(Bf31),.B2(Bf32),.B3(Bf33));

  always @* begin
    

    $monitor(" S1 = %b, S0 = %b\n A0 = %b, A1 = %b, A2 = %b, A3 = %b\n B0 = %b, B1 = %b, B2 = %b, B3 = %b\n sum = %b %b %b %b %b\n difference = %b %b %b %b %b\n AgB = %b, AlB = %b, AeB = %b\n O0 = %b, O1 = %b, O2 = %b, O3 = %b\n",S1, S0, A0, A1, A2, A3, B0, B1, B2, B3, carryf, suma3, suma2, suma1, suma0, carrysf, sums3, sums2, sums1, sums0, AgB, AlB, AeB, O0, O1, O2, O3);
  end

  initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0,final);
    $monitor($time,"S0=%b, S1=%b, A3=%b, A2=%b, A1=%b, A0=%b, B3=%b, B2=%b, B1=%b, B0=%b", S0,S1,A3,A2,A1,A0,B3,B2,B1,B0);
    $monitor($time,"carryf= %b, s3= %b, s2= %b s1= %b s0= %b",carryf, suma3, suma2, suma1, suma0);
    $monitor($time,"carryf= %b, s3= %b, s2= %b s1= %b s0= %b",carrysf, sums3, sums2, sums1, sums0);
    $monitor($time,"AlB= %b, AgB= %b, AeB= %b ",AlB, AgB, AeB);
    $monitor($time," o3= %b, o2= %b o1= %b o0= %b",O3,O2,O1,O0);
    S0=0; S1=1;
    A0 = 0; A1 = 0; A2 = 0; A3 = 0; B0 = 0; B1 = 0; B2 = 0; B3 = 0;
    #5 A0 = 0; A1 = 0; A2 = 0; A3 = 0; B0 = 0; B1 = 0; B2 = 0; B3 = 1;
    #5 A0 = 0; A1 = 0; A2 = 0; A3 = 1; B0 = 0; B1 = 0; B2 = 0; B3 = 0;
    #5 $finish;
  end
endmodule
