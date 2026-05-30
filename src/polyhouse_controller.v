`default_nettype none
module tt_um_polyhouse_controller (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire       ena,
    input  wire       clk,
    input  wire       rst_n
);
    wire soil_dry;
    wire temp_high;
    wire humidity_high;
    wire manual_mode;
    wire abnormal;

    assign soil_dry      = ui_in[0];
    assign temp_high     = ui_in[1];
    assign humidity_high = ui_in[2];
    assign manual_mode   = ui_in[3];

    assign abnormal = soil_dry | temp_high | humidity_high;

    assign uo_out[0] = ena & soil_dry;       // Pump ON
    assign uo_out[1] = ena & temp_high;      // Fan ON
    assign uo_out[2] = ena & humidity_high;  // Mist ON
    assign uo_out[3] = ena & abnormal;       // Risk Alert
    assign uo_out[4] = ena & ~abnormal;      // Healthy Status
    assign uo_out[5] = ena & manual_mode;    // Manual Status
    assign uo_out[6] = 1'b0;
    assign uo_out[7] = 1'b0;

    assign uio_out = 8'b00000000;
    assign uio_oe  = 8'b00000000;

    wire unused;
    assign unused = &{uio_in, clk, rst_n, 1'b0};

endmodule
