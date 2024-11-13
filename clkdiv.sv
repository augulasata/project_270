module clkdiv #(
    parameter BITLEN = 8
) (
    input logic clk, rst, 
    input logic [BITLEN-1:0] lim,
    output logic hzX
);

  logic [BITLEN-1:0] Q; // The State Variables
  //logic [BITLEN-1:0] next_Q; // next-state values
  // logic flash;

  // always_ff @(posedge clk, posedge rst) begin
  //   if (rst)
  //   flash <= 0;
  //   else 
  //   flash <= (Q == lim);
  // end

  // always_ff @(posedge flash, posedge rst) begin
  //  if (rst)
  //  hzX <= 0;
  //  else 
  //  hzX <= ~hzX;
   
  // end

always_ff @ (posedge clk, posedge rst) begin // state variables
 if (rst) begin
  Q <= 0;
  hzX <= 0;
  end
 else begin
  Q <= Q  + 1;
  if(Q == lim) begin
    Q <= 0;
    hzX <= ~hzX;
    end 
 end 
 end
//  always_comb begin
//   if(Q == lim) // conditional statement
//       next_Q = 0;
//   else begin
//   next_Q[0] = ~Q[0];
//   next_Q[1] = Q[1] ^ Q[0];
//   next_Q[2] = Q[2] ^ (&Q[1:0]);
//   next_Q[3] = Q[3] ^ (&Q[2:0]);
//   next_Q[4] = Q[4] ^ (&Q[3:0]);
//   next_Q[5] = Q[5] ^ (&Q[4:0]);
//   next_Q[6] = Q[6] ^ (&Q[5:0]);
//   next_Q[7] = Q[7] ^ (&Q[6:0]);
// end
// end

endmodule