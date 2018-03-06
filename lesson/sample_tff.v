/*****************************************************
**  Verilog-HDL Training  Lab                       **
******************************************************
**  tff. 							                **
**                                                  **
*****************************************************/
module SAMPLE_TFF( CLK, RST, Q ) ;
input    CLK;
input	RST;
output   Q;
reg      Q;

always @(posedge CLK or negedge RST ) begin
    if( RST == 1'b0 ) begin
        Q <= 1'b0;
    end
    else begin
        Q <= ~Q ;
    end
end
endmodule

