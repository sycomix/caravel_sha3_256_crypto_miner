/* Generated by Yosys 0.9+3621 (git sha1 84e9fa7, gcc 8.3.1 -fPIC -Os) */

module user_project_wrapper(user_clock2, wb_clk_i, wb_rst_i, wbs_ack_o, wbs_cyc_i, wbs_stb_i, wbs_we_i, vccd1, vssd1, vccd2, vssd2, vdda1, vssa1, vdda2, vssa2, analog_io, io_in, io_oeb, io_out, la_data_in, la_data_out, la_oen, wbs_adr_i, wbs_dat_i, wbs_dat_o, wbs_sel_i);
  wire _NC1;
  wire _NC10;
  wire _NC11;
  wire _NC12;
  wire _NC13;
  wire _NC14;
  wire _NC15;
  wire _NC16;
  wire _NC17;
  wire _NC18;
  wire _NC19;
  wire _NC2;
  wire _NC20;
  wire _NC21;
  wire _NC22;
  wire _NC23;
  wire _NC24;
  wire _NC25;
  wire _NC26;
  wire _NC27;
  wire _NC28;
  wire _NC29;
  wire _NC3;
  wire _NC30;
  wire _NC31;
  wire _NC4;
  wire _NC5;
  wire _NC6;
  wire _NC7;
  wire _NC8;
  wire _NC9;
  inout [30:0] analog_io;
  input [37:0] io_in;
  output [37:0] io_oeb;
  output [37:0] io_out;
  input [127:0] la_data_in;
  output [127:0] la_data_out;
  input [127:0] la_oen;
  input user_clock2;
  input vccd1;
  input vccd2;
  input vdda1;
  input vdda2;
  input vssa1;
  input vssa2;
  input vssd1;
  input vssd2;
  input wb_clk_i;
  input wb_rst_i;
  output wbs_ack_o;
  input [31:0] wbs_adr_i;
  input wbs_cyc_i;
  input [31:0] wbs_dat_i;
  output [31:0] wbs_dat_o;
  input [3:0] wbs_sel_i;
  input wbs_stb_i;
  input wbs_we_i;
  user_proj_example mprj (
    .VGND(vssd1),
    .VPWR(vccd1),
    .analog_io({ _NC1, _NC2, _NC3, _NC4, _NC5, _NC6, _NC7, _NC8, _NC9, _NC10, _NC11, _NC12, _NC13, _NC14, _NC15, _NC16, _NC17, _NC18, _NC19, _NC20, _NC21, _NC22, _NC23, _NC24, _NC25, _NC26, _NC27, _NC28, _NC29, _NC30, _NC31 }),
    .io_in(io_in),
    .io_oeb(io_oeb),
    .io_out(io_out),
    .la_data_in(la_data_in),
    .la_data_out(la_data_out),
    .la_oen(la_oen),
    .wb_clk_i(wb_clk_i),
    .wb_rst_i(wb_rst_i),
    .wbs_ack_o(wbs_ack_o),
    .wbs_adr_i(wbs_adr_i),
    .wbs_cyc_i(wbs_cyc_i),
    .wbs_dat_i(wbs_dat_i),
    .wbs_dat_o(wbs_dat_o),
    .wbs_sel_i(wbs_sel_i),
    .wbs_stb_i(wbs_stb_i),
    .wbs_we_i(wbs_we_i)
  );
endmodule
