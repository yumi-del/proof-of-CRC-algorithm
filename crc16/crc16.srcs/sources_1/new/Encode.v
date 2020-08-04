`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/08/01 00:18:27
// Design Name: 
// Module Name: Encode
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


module Encode(
    input wire clk,        //时钟；
    input wire rst,        //同步复位；
    input wire i_valid,    //输入数据有效；
    input wire [15:0]din,  //输入数据；
    output wire LED,       //输出CRC值有效；
    output wire [31:0]dout //输出CRC；
    );
    wire [15:0]crc;
    CRC16 CRC1(
    .i_clk(clk),
    .i_rst_n(rst),
    .i_din_valid(i_valid),
    .i_din(din),
    .o_dout_valid(LED),
    .o_dout(crc)
    );
    assign dout={din , crc};
    
endmodule
