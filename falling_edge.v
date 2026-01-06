`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.10.2025 23:14:41
// Design Name: 
// Module Name: falling_edge
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
////////////////////////////////////////////////////////////////////////////////
module falling_edge (
    input clk,
    input trigger,
    output trigg_falling
);
    reg trigg_prev;

    always @(posedge clk)
        trigg_prev <= trigger;  // Always store previous trigger state

    assign trigg_falling = trigg_prev & (~trigger);  // Detect 1?0 transition
endmodule

