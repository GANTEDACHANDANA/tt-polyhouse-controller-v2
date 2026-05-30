// TinyTapeout / Wokwi compatible simplified Polyhouse Automation Controller
// This is the CORE decision logic of the FPGA Polyhouse project.
// Inputs are simulated as digital sensor status signals.
// Outputs drive LEDs in Wokwi or output pins in TinyTapeout.

module chip (
    input  [7:0] ui_in,
    output [7:0] uo_out
);

    wire soil_dry;
    wire temp_high;
    wire humidity_high;
    wire manual_mode;

    assign soil_dry      = ui_in[0];
    assign temp_high     = ui_in[1];
    assign humidity_high = ui_in[2];
    assign manual_mode   = ui_in[3];

    // Output mapping
    // uo_out[0] = Pump ON when soil is dry
    // uo_out[1] = Fan ON when temperature is high
    // uo_out[2] = Mist ON when humidity is high/abnormal
    // uo_out[3] = Risk alert when any sensor condition is abnormal
    // uo_out[4] = Healthy condition indicator
    // uo_out[5] = Manual mode indicator
    // uo_out[6] = Reserved
    // uo_out[7] = Reserved

    assign uo_out[0] = soil_dry;
    assign uo_out[1] = temp_high;
    assign uo_out[2] = humidity_high;
    assign uo_out[3] = soil_dry | temp_high | humidity_high;
    assign uo_out[4] = ~(soil_dry | temp_high | humidity_high);
    assign uo_out[5] = manual_mode;
    assign uo_out[6] = 1'b0;
    assign uo_out[7] = 1'b0;

endmodule
