module prienc8to3 (input logic [7:0] in, output logic [2:0] out);

assign out =
in[7] == 1 ? 3'd7:
in[6] == 1 ? 3'd6:
in[5] == 1 ? 3'd5:
in[4] == 1 ? 3'd4:
in[3] == 1 ? 3'd3:
in[2] == 1 ? 3'd2:
in[1] == 1 ? 3'd1:
in[0] == 1 ? 3'd0:
3'd0;

endmodule