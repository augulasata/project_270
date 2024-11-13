  module sample #(
      parameter SAMPLE_FILE = "../audio/kick.mem",
      parameter SAMPLE_LEN = 4000
  )
  (
      input clk, rst, enable,
      output logic [7:0] out
  );
  logic temp;
  logic [11:0]next_Q;
  logic [11:0]Q;
  logic [7:0] audio_mem [4095:0];
  initial $readmemh(SAMPLE_FILE, audio_mem, 0, SAMPLE_LEN);

  always_ff @ (posedge clk, posedge rst)
  begin
    if(rst)
    begin
        Q <= 'd0;
        temp <= 'd0;
        out <= 0;
    end
    else
    begin
        temp <= enable;
        out <= audio_mem[Q];
        if (enable & temp) begin
            if (Q == SAMPLE_LEN)
                Q <= 0;
            Q <= next_Q;
        end 
        else if (temp & !enable)
            Q <= 0;
        else 
            Q <= Q;
    end
  end
  always_comb begin
    // if(temp & enable)
    // begin
        if(Q == SAMPLE_LEN)
            next_Q = '0;
        else
        begin
            next_Q[0] = ~Q[0];
            next_Q[1] = Q[1] ^ Q[0];
            next_Q[2] = Q[2] ^ (&Q[1:0]);
            next_Q[3] = Q[3] ^ (&Q[2:0]);
            next_Q[4] = Q[4] ^ (&Q[3:0]);
            next_Q[5] = Q[5] ^ (&Q[4:0]);
            next_Q[6] = Q[6] ^ (&Q[5:0]);
            next_Q[7] = Q[7] ^ (&Q[6:0]);
            next_Q[8] = Q[8] ^ (&Q[7:0]);
            next_Q[9] = Q[9] ^ (&Q[8:0]);
            next_Q[10] = Q[10] ^ (&Q[9:0]);
            next_Q[11] = Q[11] ^ (&Q[10:0]);

        end
    // end
    // else if(enable == 0 & temp)
    //     next_Q = '0;
    // else
    //     next_Q = Q;
  end

  endmodule 