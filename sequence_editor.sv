module sequence_editor(input logic clk, input logic rst, input logic [1:0]mode, input logic [2:0]set_time_idx, input logic [3:0]tgl_play_smpl, 
output logic [3:0]seq_smpl_1, output logic [3:0]seq_smpl_2, output logic [3:0]seq_smpl_3, output logic [3:0]seq_smpl_4, output logic [3:0]seq_smpl_5,
output logic [3:0]seq_smpl_6, output logic [3:0]seq_smpl_7, output logic [3:0]seq_smpl_8);

// reg[3:0] holder[7:0];
// reg[3:0] temp[7:0];
// always_comb
// begin
//     holder[0] = seq_smpl_1;
//     holder[1] = seq_smpl_2;
//     holder[2] = seq_smpl_3;
//     holder[3] = seq_smpl_4;
//     holder[4] = seq_smpl_5;
//     holder[5] = seq_smpl_6;
//     holder[6] = seq_smpl_7;
//     holder[7] = seq_smpl_8;

//     if(rst)
//     begin
//         seq_smpl_1 = 0;
//         seq_smpl_2 = 0;
//         seq_smpl_3 = 0;
//         seq_smpl_4 = 0;
//         seq_smpl_5 = 0;
//         seq_smpl_6 = 0;
//         seq_smpl_7 = 0;
//         seq_smpl_8 = 0;

//     end
//     else
//     begin
//     seq_smpl_1 = temp[0];
//     seq_smpl_2 = temp[1];
//     seq_smpl_3 = temp[2];
//     seq_smpl_4 = temp[3];
//     seq_smpl_5 = temp[4];
//     seq_smpl_6 = temp[5];
//     seq_smpl_7 = temp[6];
//     seq_smpl_8 = temp[7];
//     end
    
// end

always_ff @ (posedge clk)
begin
    if (rst) begin
        seq_smpl_1 <= 0;
        seq_smpl_2 <= 0;
        seq_smpl_3 <= 0;
        seq_smpl_4 <= 0;
        seq_smpl_5 <= 0;
        seq_smpl_6 <= 0;
        seq_smpl_7 <= 0;
        seq_smpl_8 <= 0;
    end

    else if(mode == '0) begin
        seq_smpl_1 <= (set_time_idx == 0) ? seq_smpl_1 ^ tgl_play_smpl : seq_smpl_1;
        seq_smpl_2 <= (set_time_idx == 1) ? seq_smpl_2 ^ tgl_play_smpl : seq_smpl_2;
        seq_smpl_3 <= (set_time_idx == 2) ? seq_smpl_3 ^ tgl_play_smpl : seq_smpl_3;
        seq_smpl_4 <= (set_time_idx == 3) ? seq_smpl_4 ^ tgl_play_smpl : seq_smpl_4;
        seq_smpl_5 <= (set_time_idx == 4) ? seq_smpl_5 ^ tgl_play_smpl : seq_smpl_5;
        seq_smpl_6 <= (set_time_idx == 5) ? seq_smpl_6 ^ tgl_play_smpl : seq_smpl_6;
        seq_smpl_7 <= (set_time_idx == 6) ? seq_smpl_7 ^ tgl_play_smpl : seq_smpl_7;
        seq_smpl_8 <= (set_time_idx == 7) ? seq_smpl_8 ^ tgl_play_smpl : seq_smpl_8;
    end
end 

endmodule
