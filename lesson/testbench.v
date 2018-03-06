
/*****************************************************
**  Verilog-HDL Training  Lab                       **
******************************************************
**  testbench for signal controller.      			**
*****************************************************/

module testbench() ;
    reg          clock ;
    reg          reset ;

    wire [2:0]   w_count;
    reg  [2:0]   r_count;

    wire         w_start;
    reg          r_start;

    wire         w_green;
    wire         w_yellow;
    wire         w_red;

    integer seq_ct;

    count8         count( .clk(clock), .rst(reset), .start(w_start), .cout(w_count) );
    control        ctrl( .clk(clock), .rst(reset), .count_in(w_count), .count_start(w_start), .g_out(w_green), .y_out(w_yellow), .r_out(w_red) );

    initial begin
        clock = 1 ;
        forever begin
            #50 clock = ~clock ;
        end
    end

    initial begin
        $dumpfile("trace.vcd") ;
        $dumpvars ;
    end

    initial begin
		seq_ct = 0;
        reset = 1;
        @(posedge clock) ;
        reset = 0;
        @(posedge clock) ;
        reset = 1 ;
        @(posedge clock) ;

       	forever begin 
        	$display( "%0t : green= %d  yellow= %d red=%d",$time, w_green, w_yellow, w_red);
            @(posedge clock) ;
            seq_ct = seq_ct + 1;
            if( seq_ct == 37 ) begin
		    	$finish ;
            end
       	end
    end
endmodule
