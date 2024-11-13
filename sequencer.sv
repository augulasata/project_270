module sequencer(input logic clk, input logic rst, input logic srst, input logic go_right, input logic go_left, output logic [7:0]seq_out);

logic [7:0]next;

always_comb
begin

    if (srst)
        next = 8'h80;
    else if(go_left)
        next = (seq_out << 1) | (seq_out >> 7);
    else if(go_right)
        next = (seq_out << 7) | (seq_out >> 1);
    else
        next = seq_out;

end

always_ff @ (posedge clk, posedge rst)
begin  
    if(rst)
        seq_out <= 8'h80;
    else
        seq_out <= next;
end
        

endmodule