`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.10.2025 23:15:40
// Design Name: 
// Module Name: falling_edge_tb
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

`timescale 1ns/1ps
module falling_edge_tb;

    reg clk;
    reg trigger;
    wire trigg_falling;

    // Instantiate the DUT (Device Under Test)
    falling_edge dut (
        .clk(clk),
        .trigger(trigger),
        .trigg_falling(trigg_falling)
    );

    // Clock generation: 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Toggle every 5ns ? 100MHz clock
    end

    // Stimulus generation
    initial begin
        // Initialize inputs
        trigger = 0;

        // Monitor signals
        $monitor("Time=%0t | clk=%b | trigger=%b | trigg_falling=%b", 
                 $time, clk, trigger, trigg_falling);

        // Apply test stimulus
        #10 trigger = 0;
        #10 trigger = 1;  
        #10 trigger = 1;  
        #10 trigger = 0;  // Falling edge
        #10 trigger = 1; 
        #10 trigger = 0;
        #10 $finish;
    end

endmodule
