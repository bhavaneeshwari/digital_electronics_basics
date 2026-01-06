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
