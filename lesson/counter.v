/*****************************************************
**  Verilog-HDL Training  Lab                       **
******************************************************
**  0 to 7 counter for signal controller.           **
*****************************************************/

module count8( clk, rst, start, cout );
input clk;
input rst;
input start;
output [2:0] cout;
reg    [2:0] cout;

always @(posedge clk or negedge rst ) begin
    if( rst == 1'b0 ) begin
        cout <= 3'd0;
    end
    else if( start == 1'b1 ) begin
        cout <= 1'b1;
    end
    else begin
        cout <= cout + 3'd1;
    end
end
endmodule

