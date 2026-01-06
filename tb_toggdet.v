`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.10.2025 20:52:41
// Design Name: 
// Module Name: tb_toggdet
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
module tb_toggdet;

    reg clk, trigger;
    wire toggle_pulse;

    // Instantiate DUT
    togg_det uut (
        .clk(clk),
        .trigger(trigger),
        .toggle_pulse(toggle_pulse)
    );

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        trigger = 0;

        // Monitor signals
        $monitor("Time=%0t | trigg=%b | togg_d=%b", $time, trigger, toggle_pulse);

        #12 trigger = 1;  // Toggle
        #20 trigger = 0;  // Toggle
        #20 trigger = 1;  // Toggle
        #20 trigger= 1;  // No toggle
        #20 trigger = 0;  // Toggle

        #20 $finish;
    end

endmodule

