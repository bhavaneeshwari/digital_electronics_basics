# TOGGLE DETECTOR 
 ### RISING EDGE DETECTOR  
 
### VERILOG CODE : 
```v
    module rising_edge (
    input clk,
    input trigger,
    output trigg_rising
);
    reg trigg_prev;

    always @(posedge clk)
        trigg_prev <= trigger;  // Always store previous trigger state

    assign trigg_rising = (~trigg_prev) & trigger;  // Detect 0→1 transition
endmodule
```
              
### TESTBENCH:
```v
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
        forever #5 clk = ~clk;  // Toggle every 5ns → 100MHz clock
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
        #10 trigger = 1;  // Rising edge here → output should go high for one cycle
        #10 trigger = 1;  // No new rising edge
        #10 trigger = 0;  // Falling edge
        #10 trigger = 1;  // Rising edge again → output high again
        #10 trigger = 0;
        #10 $finish;
    end


endmodule
```
<img width="904" height="641" alt="image" src="https://github.com/user-attachments/assets/0adc3f24-1a8d-4f0e-bc92-9377a2d13305" />

# FALLING EDGE DETECTOR 
## VERILOG CODE : 
```v
module falling_edge (
    input clk,
    input trigger,
    output trigg_falling
);
    reg trigg_prev;

    always @(posedge clk)
        trigg_prev <= trigger;  // Always store previous trigger state

    assign trigg_falling = trigg_prev & (~trigger);  // Detect 1→0 transition
endmodule
```

### TESTBENCH:
```v
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
        forever #5 clk = ~clk;  // Toggle every 5ns → 100MHz clock
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
```
<img width="891" height="557" alt="image" src="https://github.com/user-attachments/assets/7d06d353-3dba-4fe2-8d26-e0d9b52dacc2" />

# TOGGLE DETECTOR 
### VERILOG CODE : 
```v
module togg_det (
    input   clk,
    input   trigg,
    output togg_d
);

    reg togg_prev;

    always @(posedge clk) 
       // Output 1 for one clock when trigg toggles
        togg_prev <= trigg;             // Store current state for next cycle
        assign togg_d = trigg ^ togg_prev;
    
  
endmodule

```

## ELABORATED DESIGN:

<img width="830" height="406" alt="image" src="https://github.com/user-attachments/assets/1be8f141-7d90-470b-8731-e4031d2ae9d6" />



### Second design : 
```v
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
```
<img width="1497" height="774" alt="image" src="https://github.com/user-attachments/assets/c842d049-3909-40ef-826c-36d51a4b8b42" />
<img width="1140" height="518" alt="image" src="https://github.com/user-attachments/assets/1aaa9771-d630-4242-8431-c778a86c2083" />
