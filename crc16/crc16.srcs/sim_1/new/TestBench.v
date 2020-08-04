`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/31 23:33:54
// Design Name: 
// Module Name: TestBench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TestBench();
   reg clk;
   reg i_valid;
   reg [31:0]din;
   wire LED;
   
   Proof test(
   .clk(clk),
   .i_valid(i_valid),
   .din(din),
   .LED(LED)
   );
   initial
     begin
       clk=0;
       i_valid=0;
       #100;
       i_valid=1;
       din=32'h00111f1f;
       #20;
       i_valid=0;
       #100;
       i_valid=1;
       din=32'h00110000;
       #20;
       i_valid=0;
     end
always #10 clk=~clk;
endmodule
