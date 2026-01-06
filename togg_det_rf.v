`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.10.2025 11:56:56
// Design Name: 
// Module Name: togg_det_rf
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


module togg_det_rf(
 input clk,
    input trigger,
    output toggle_pulse
    );
    wire rising_pulse,falling_pulse;
    
    rising_edge u_rising (
        .clk(clk),
        .trigger(trigger),
        .trigg_rising(rising_pulse)
    );
    falling_edge u_falling (
        .clk(clk),
        .trigger(trigger),
        .trigg_falling(falling_pulse)
    );
    
    assign toggle_pulse = rising_pulse | falling_pulse;
endmodule
