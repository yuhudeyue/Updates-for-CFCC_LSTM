function save_weight2(final_bias_input_gate,...
    final_bias_output_gate,...
    final_bias_forget_gate,...
    final_weight_input_x,...
    final_weight_input_h,...
    final_weight_inputgate_x,...
    final_weight_inputgate_c,...
    final_weight_forgetgate_x,...
    final_weight_forgetgate_c,...
    final_weight_outputgate_x,...
    final_weight_outputgate_c,...
    final_weight_preh_h,...
    final_h_state,final_cell_state,date1,date2)

filename = ['weight_' num2str(date1) '_' num2str(date2)];
time=datestr(now,'yyyymmddHHMMSS');
save (filename,...
    'final_bias_input_gate',...
    'final_bias_output_gate',...
    'final_bias_forget_gate',...
    'final_weight_input_x',...
    'final_weight_input_h',...
    'final_weight_inputgate_x',...
    'final_weight_inputgate_c',...
    'final_weight_forgetgate_x',...
    'final_weight_forgetgate_c',...
    'final_weight_outputgate_x',...
    'final_weight_outputgate_c',...
    'final_weight_preh_h',...
    'final_h_state',...
    'final_cell_state','time');

