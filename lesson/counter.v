/*****************************************************
**  Verilog-HDL Training  Lab                       **
******************************************************
**  0 to 7 counter for signal controller.           **
*****************************************************/

module count8( clk, rst, start, cout );
input clk;          //クロック
input rst;          //リセット
input start;
output [2:0] cout;
reg    [2:0] cout;

//回路は常に動いている状態なのでalways
//@は()内に変化があったら発火
//リセットは負論理
always @(posedge clk or negedge rst ) begin
    //リセットが0なら
    if( rst == 1'b0 ) begin
        //カウントを0にする
        cout <= 3'd0;
    end

    //スタートが1なら
    else if( start == 1'b1 ) begin
        //カウントを1にする
        cout <= 1'b1;
    end

    //上記以外
    else begin
        //カウントを1増やす
        cout <= cout + 3'd1;
    end
end
endmodule

