`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/08/01 00:46:53
// Design Name: 
// Module Name: Proof
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


module Proof(
   input wire clk,        //时钟；
   input wire [31:0]din,  //总输入；
   input wire i_valid,    //输入数据有效；
   output reg LED
    );
    wire [15:0]data;       //数据部分；
    wire [15:0]crc;        //校验码部分；
    wire [15:0]crc1;
    reg [15:0]test;
    wire sign;
  
    assign data=din[31:16];//分配；
    assign crc=din[15:0];
    
    CRC16 CRC2(
    .i_clk(clk),
    .i_rst_n(i_valid),
    .i_din_valid(i_valid),
    .i_din(data),
    .o_dout_valid(sign),
    .o_dout(crc1)
    );
    
    always @ (posedge sign)
    begin
      test[0]=crc[0]^crc1[0];
      test[1]=crc[1]^crc1[1];
      test[2]=crc[2]^crc1[2];
      test[3]=crc[3]^crc1[3];
      test[4]=crc[4]^crc1[4];
      test[5]=crc[5]^crc1[5];
      test[6]=crc[6]^crc1[6];
      test[7]=crc[7]^crc1[7];
      test[8]=crc[8]^crc1[8];
      test[9]=crc[9]^crc1[9];
      test[10]=crc[10]^crc1[10];
      test[11]=crc[11]^crc1[11];
      test[12]=crc[12]^crc1[12];
      test[13]=crc[13]^crc1[13];
      test[14]=crc[14]^crc1[14];
      test[15]=crc[15]^crc1[15];
    end
 always @(posedge clk)
      begin 
       if(test==15'h0000) LED=1;
       else LED=0;
      end
endmodule
