module controller (input logic clk, input logic rst, input logic set_edit, input logic set_raw, input logic set_play, output logic [1:0] mode);

typedef enum logic [1:0] { EDIT=2'd0, PLAY=2'd1, RAW=2'd2 } sysmode_t;

always_ff @ (posedge clk, posedge rst)
begin
    if (rst)
	    mode <= EDIT;
    else if (set_edit)
	    mode <= EDIT;
    else if(set_play)
	    mode <= PLAY;
    else if(set_raw)
	    mode <= RAW;
end
endmodule