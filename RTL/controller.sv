`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2020 11:07:58 PM
// Design Name: 
// Module Name: controller
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

module controller(input  logic [5:0] op, funct,
                  input  logic       zero,
                  output logic       memtoreg, memwrite,
                  output logic       pcsrc, 
                  output logic[1:0]  alusrc,
                  output logic       regdst, regwrite,
                  output logic       jump,
                  output logic [2:0] alucontrol,
                  output logic       bneFlag);

  logic [1:0] aluop;
  logic       branch;
   maindec md(op, memtoreg, memwrite, branch,
              alusrc, regdst, regwrite, jump, aluop, bneFlag);
   aludec  ad(funct, aluop, alucontrol);
 
   assign pcsrc = branch & zero;
endmodule
