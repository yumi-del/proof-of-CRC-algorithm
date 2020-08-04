`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/31 22:29:44
// Design Name: 
// Module Name: CRC16
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


module CRC16(
    input wire i_clk,        //ʱ�ӣ�
    input wire i_rst_n,      //ͬ����λ��
    input wire i_din_valid,  //����������Ч��
    input wire [15:0]i_din,  //�������ݣ�
    output wire o_dout_valid ,//���CRCֵ��Ч��
    output wire [15:0]o_dout  //���CRC��
    );
reg [15:0] r_dout;
wire [15:0] d;
wire [15:0] c;
assign d = i_din;
assign c = r_dout;
always @(posedge i_clk) begin
    if (~i_rst_n)
        r_dout <= 16'hffff; //��ʼֵΪffff��
    else if (i_din_valid)
    begin //�����߼���
        r_dout[0]  = d[12] ^ d[11] ^ d[8] ^ d[4] ^ d[0] ^ c[0] ^ c[4] ^ c[8] ^ c[11] ^ c[12];
        r_dout[1]  = d[13] ^ d[12] ^ d[9] ^ d[5] ^ d[1] ^ c[1] ^ c[5] ^ c[9] ^ c[12] ^ c[13];
        r_dout[2]  = d[14] ^ d[13] ^ d[10] ^ d[6] ^ d[2] ^ c[2] ^ c[6] ^ c[10] ^ c[13] ^ c[14];
        r_dout[3]  = d[15] ^ d[14] ^ d[11] ^ d[7] ^ d[3] ^ c[3] ^ c[7] ^ c[11] ^ c[14] ^ c[15];
        r_dout[4]  = d[15] ^ d[12] ^ d[8] ^ d[4] ^ c[4] ^ c[8] ^ c[12] ^ c[15];
        r_dout[5]  = d[13] ^ d[12] ^ d[11] ^ d[9] ^ d[8] ^ d[5] ^ d[4] ^ d[0] ^ c[0] ^ c[4] ^ c[5] ^ c[8] ^ c[9] ^ c[11] ^ c[12] ^ c[13];
        r_dout[6]  = d[14] ^ d[13] ^ d[12] ^ d[10] ^ d[9] ^ d[6] ^ d[5] ^ d[1] ^ c[1] ^ c[5] ^ c[6] ^ c[9] ^ c[10] ^ c[12] ^ c[13] ^ c[14];
        r_dout[7]  = d[15] ^ d[14] ^ d[13] ^ d[11] ^ d[10] ^ d[7] ^ d[6] ^ d[2] ^ c[2] ^ c[6] ^ c[7] ^ c[10] ^ c[11] ^ c[13] ^ c[14] ^ c[15];
        r_dout[8]  = d[15] ^ d[14] ^ d[12] ^ d[11] ^ d[8] ^ d[7] ^ d[3] ^ c[3] ^ c[7] ^ c[8] ^ c[11] ^ c[12] ^ c[14] ^ c[15];
        r_dout[9]  = d[15] ^ d[13] ^ d[12] ^ d[9] ^ d[8] ^ d[4] ^ c[4] ^ c[8] ^ c[9] ^ c[12] ^ c[13] ^ c[15];
        r_dout[10] = d[14] ^ d[13] ^ d[10] ^ d[9] ^ d[5] ^ c[5] ^ c[9] ^ c[10] ^ c[13] ^ c[14];
        r_dout[11] = d[15] ^ d[14] ^ d[11] ^ d[10] ^ d[6] ^ c[6] ^ c[10] ^ c[11] ^ c[14] ^ c[15];
        r_dout[12] = d[15] ^ d[8] ^ d[7] ^ d[4] ^ d[0] ^ c[0] ^ c[4] ^ c[7] ^ c[8] ^ c[15];
        r_dout[13] = d[9] ^ d[8] ^ d[5] ^ d[1] ^ c[1] ^ c[5] ^ c[8] ^ c[9];
        r_dout[14] = d[10] ^ d[9] ^ d[6] ^ d[2] ^ c[2] ^ c[6] ^ c[9] ^ c[10];
        r_dout[15] = d[11] ^ d[10] ^ d[7] ^ d[3] ^ c[3] ^ c[7] ^ c[10] ^ c[11];
    end
   //else idle;
end
reg r_dout_valid = 0;
always @(posedge i_clk) //����������һ��ʱ�������CRC���㣬��һ��ʱ�������
begin
    r_dout_valid <= i_din_valid;
end

assign o_dout_valid = r_dout_valid;
assign o_dout = r_dout ;

endmodule
