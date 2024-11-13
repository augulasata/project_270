module pwm #(
    parameter int CTRVAL = 256,
    parameter int CTRLEN = $clog2(CTRVAL)
)
(
    input logic clk, rst, enable,
    input logic [CTRLEN-1:0] duty_cycle,
    output logic [CTRLEN-1:0] counter,
    output logic pwm_out
);

// logic [CTRLEN-1:0] temp;

always_ff @(posedge clk, posedge rst) begin
    if (rst)
        counter <= 0;
    else if (enable) 
        //counter <= (counter == (CTRVAL -1)) ? 0 : counter + 1;
    // if (counter == 255)
    //     counter <= 0;
    // else 
        counter <= counter + 1;

end

always_comb begin
    if (rst)
        pwm_out = 0;
    else
        pwm_out = (counter <= duty_cycle);
end

// always_comb begin
//     temp[0] = ~counter[0];
//     temp[1] = counter[1] ^ counter[0];
//     temp[2] = counter[2] ^ (&counter[1:0]);
//     temp[3] = counter[3] ^ (&counter[2:0]);
//     temp[4] = counter[4] ^ (&counter[3:0]);
//     temp[5] = counter[5] ^ (&counter[4:0]);
//     temp[6] = counter[6] ^ (&counter[5:0]);
//     temp[7] = counter[7] ^ (&counter[6:0]);
// end

endmodule