/*****************************************************
**  Verilog-HDL Training  Lab                       **
******************************************************
**  signal controller.    FSM                       **
*****************************************************/

module control( clk, rst, count_in, count_start, g_out, y_out, r_out );
    input           clk;
    input           rst;
    input  [2:0]    count_in;
    output          count_start;
    output          g_out;
    output          y_out;
    output          r_out;

    reg             count_start;
    reg             g_out;
    reg             y_out;
    reg             r_out;

    reg    [1:0]  state, next_state;


    `define        GREEN_TIMES      3'd6
    `define        YELLOW_TIMES     3'd2
    `define        RED_TIMES        3'd4

    parameter [1:0] INIT     = 2'b00,
                    GREEN    = 2'b01,
                    YELLOW   = 2'b10,
                    RED      = 2'b11;

    always@( posedge clk ) begin
        if( rst == 1'b0 ) begin
            state <= INIT;
        end
        else begin
            state <= next_state;
        end
    end

    always@( state, count_in ) begin
        count_start <= 1'b0;
        g_out <= 1'b0;
        y_out <= 1'b0;
        r_out <= 1'b0;
        case (state)
            INIT:    begin
                count_start <= 1'b1;
                next_state <= GREEN;
            end
            GREEN: begin
                g_out <= 1'b1;
                if( count_in == `GREEN_TIMES ) begin
                    count_start <= 1'b1;
                    next_state <= YELLOW;
                end
                else begin
                    next_state <= GREEN;
                end
            end
            YELLOW: begin
                y_out <= 1'b1;
                if( count_in == `YELLOW_TIMES ) begin
                    count_start <= 1'b1;
                    next_state <= RED;
                end
                else begin
                    next_state <= YELLOW;
                end
            end
            RED: begin
                r_out <= 1'b1;
                if( count_in == `RED_TIMES ) begin
                    count_start <= 1'b1;
                    next_state <= GREEN;
                end
                else begin
                    next_state <= RED;
                end
            end    
            default: begin
                next_state <= INIT;
            end
        endcase    // end of case
    end    // end of always
endmodule



