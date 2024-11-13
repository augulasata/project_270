module scankey(
  //ports
  input logic clk,
  input logic rst,
  input logic [19:0] in,
  output logic [4:0] out,
  output logic strobe
);

  logic [1:0] delay;
  
  always_ff @ (posedge clk, posedge rst) begin
  if(rst)
  delay <= 0;
  else
  delay <= (delay << 1) | {1'b0, |in[19:0]};
  end
  
//encoder
  assign out[4] = |in[19:16];
  assign out[3] = |in[15:8];
  assign out[2] = |in[15:12] | |in[7:4];
  assign out[1] = |in[19:18] | |in[15:14] | |in[11:10] | |in[7:6] | |in[3:2];
  assign out[0] = in[19]| in[17] | in[15] | in[13] | in[11] | in[9] | in[7] | in[5] | in[3] | in[1];
  assign strobe = delay[1];
  
  endmodule