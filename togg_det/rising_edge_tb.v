`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.10.2025 22:44:52
// Design Name: 
// Module Name: rising_edge_tb
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
module rising_edge_tb;

    reg clk;
    reg trigger;
    wire trigg_rising;

    // Instantiate the DUT (Device Under Test)
    rising_edge dut (
        .clk(clk),
        .trigger(trigger),
        .trigg_rising(trigg_rising)
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
        $monitor("Time=%0t | clk=%b | trigger=%b | trigg_rising=%b", 
                 $time, clk, trigger, trigg_rising);

        // Apply test stimulus
        #10 trigger = 0;
        #10 trigger = 1;  // Rising edge here ? output should go high for one cycle
        #10 trigger = 1;  // No new rising edge
        #10 trigger = 0;  // Falling edge
        #10 trigger = 1;  // Rising edge again ? output high again
        #10 trigger = 0;
        #10 $finish;
    end

endmodule

