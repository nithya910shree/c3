
module clk261hz(
    input clk_50MHz,
    input reset_button,
    output clk_0
    );
    
    reg [25:0] ctr_reg = 0;                
    reg clk_out_reg = 0;
    
    always @(posedge clk_50MHz or posedge reset_button)
        if(reset_button) begin
            ctr_reg <= 0;
            clk_out_reg <= 0;
        end
		  else
            if(ctr_reg == 50000000) begin  
                ctr_reg <= 0;
                clk_out_reg <= ~clk_out_reg;
            end
            else
                ctr_reg <= ctr_reg + 1;
    
    assign clk_0 = clk_out_reg;
    
endmodule
