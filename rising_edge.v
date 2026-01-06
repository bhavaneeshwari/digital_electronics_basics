`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.10.2025 22:40:00
// Design Name: 
// Module Name: rising_edge
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
module rising_edge (
    input clk,
    input trigger,
    output trigg_rising
);
    reg trigg_prev;

    always @(posedge clk)
        trigg_prev <= trigger;  // Always store previous trigger state

    assign trigg_rising = (~trigg_prev) & trigger;  // Detect 0?1 transition
endmodule

