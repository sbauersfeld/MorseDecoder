// EEM16 - Logic Design
// Design Assignment #3.3
// dassign3_3.v
// Verilog template
`include "building_blocks.v"
`include "lab_modules.v"
`include "constants3.vh"
`timescale 1ns / 1ps
// You may define any additional modules as necessary
// Do not delete or modify any of the modules provided

module net(clk, x3, x2, x1, x0, new, a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z, ready);
    input clk;
    input [7:0] x3, x2, x1, x0;
    input new;
    output [7:0] a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z;
    output ready;

    reg [39:0] rom [0:29]; // ROM that stores neuron weights

    // Initialize values in ROM
    initial $readmemb("./weights_rom", rom);

    wire [7:0] y0, y1, y2, y3;
    wire [7:0] h0, h1, h2, h3;
    wire ready_0, ready_1, ready_2, ready_3, ready_h;
    wire [25:0] ready_out;

    // Input layer of neurons (from 3.1)
    neuron l0n3(clk, rom[0][39:32], rom[0][31:24], rom[0][23:16], rom[0][15:8], rom[0][7:0], x3, x2, x1, x0, new, y3, ready_3);
    neuron l0n2(clk, rom[1][39:32], rom[1][31:24], rom[1][23:16], rom[1][15:8], rom[1][7:0], x3, x2, x1, x0, new, y2, ready_2);
    neuron l0n1(clk, rom[2][39:32], rom[2][31:24], rom[2][23:16], rom[2][15:8], rom[2][7:0], x3, x2, x1, x0, new, y1, ready_1);
    neuron l0n0(clk, rom[3][39:32], rom[3][31:24], rom[3][23:16], rom[3][15:8], rom[3][7:0], x3, x2, x1, x0, new, y0, ready_0);

    // Interlayer module (from 3.2)
    interlayer i2o(clk, new, y3, ready_3, y2, ready_2, y1, ready_1, y0, ready_0, h3, h2, h1, h0, ready_h);

    // Output layer of neurons (from 3.1)
    neuron  l1n0(clk,  rom[4][39:32],  rom[4][31:24],  rom[4][23:16],  rom[4][15:8],  rom[4][7:0], h3, h2, h1, h0, ready_h, a,  ready_out[0]);
    neuron  l1n1(clk,  rom[5][39:32],  rom[5][31:24],  rom[5][23:16],  rom[5][15:8],  rom[5][7:0], h3, h2, h1, h0, ready_h, b,  ready_out[1]);
    neuron  l1n2(clk,  rom[6][39:32],  rom[6][31:24],  rom[6][23:16],  rom[6][15:8],  rom[6][7:0], h3, h2, h1, h0, ready_h, c,  ready_out[2]);
    neuron  l1n3(clk,  rom[7][39:32],  rom[7][31:24],  rom[7][23:16],  rom[7][15:8],  rom[7][7:0], h3, h2, h1, h0, ready_h, d,  ready_out[3]);
    neuron  l1n4(clk,  rom[8][39:32],  rom[8][31:24],  rom[8][23:16],  rom[8][15:8],  rom[8][7:0], h3, h2, h1, h0, ready_h, e,  ready_out[4]);
    neuron  l1n5(clk,  rom[9][39:32],  rom[9][31:24],  rom[9][23:16],  rom[9][15:8],  rom[9][7:0], h3, h2, h1, h0, ready_h, f,  ready_out[5]);
    neuron  l1n6(clk, rom[10][39:32], rom[10][31:24], rom[10][23:16], rom[10][15:8], rom[10][7:0], h3, h2, h1, h0, ready_h, g,  ready_out[6]);
    neuron  l1n7(clk, rom[11][39:32], rom[11][31:24], rom[11][23:16], rom[11][15:8], rom[11][7:0], h3, h2, h1, h0, ready_h, h,  ready_out[7]);
    neuron  l1n8(clk, rom[12][39:32], rom[12][31:24], rom[12][23:16], rom[12][15:8], rom[12][7:0], h3, h2, h1, h0, ready_h, i,  ready_out[8]);
    neuron  l1n9(clk, rom[13][39:32], rom[13][31:24], rom[13][23:16], rom[13][15:8], rom[13][7:0], h3, h2, h1, h0, ready_h, j,  ready_out[9]);
    neuron l1n10(clk, rom[14][39:32], rom[14][31:24], rom[14][23:16], rom[14][15:8], rom[14][7:0], h3, h2, h1, h0, ready_h, k, ready_out[10]);
    neuron l1n11(clk, rom[15][39:32], rom[15][31:24], rom[15][23:16], rom[15][15:8], rom[15][7:0], h3, h2, h1, h0, ready_h, l, ready_out[11]);
    neuron l1n12(clk, rom[16][39:32], rom[16][31:24], rom[16][23:16], rom[16][15:8], rom[16][7:0], h3, h2, h1, h0, ready_h, m, ready_out[12]);
    neuron l1n13(clk, rom[17][39:32], rom[17][31:24], rom[17][23:16], rom[17][15:8], rom[17][7:0], h3, h2, h1, h0, ready_h, n, ready_out[13]);
    neuron l1n14(clk, rom[18][39:32], rom[18][31:24], rom[18][23:16], rom[18][15:8], rom[18][7:0], h3, h2, h1, h0, ready_h, o, ready_out[14]);
    neuron l1n15(clk, rom[19][39:32], rom[19][31:24], rom[19][23:16], rom[19][15:8], rom[19][7:0], h3, h2, h1, h0, ready_h, p, ready_out[15]);
    neuron l1n16(clk, rom[20][39:32], rom[20][31:24], rom[20][23:16], rom[20][15:8], rom[20][7:0], h3, h2, h1, h0, ready_h, q, ready_out[16]);
    neuron l1n17(clk, rom[21][39:32], rom[21][31:24], rom[21][23:16], rom[21][15:8], rom[21][7:0], h3, h2, h1, h0, ready_h, r, ready_out[17]);
    neuron l1n18(clk, rom[22][39:32], rom[22][31:24], rom[22][23:16], rom[22][15:8], rom[22][7:0], h3, h2, h1, h0, ready_h, s, ready_out[18]);
    neuron l1n19(clk, rom[23][39:32], rom[23][31:24], rom[23][23:16], rom[23][15:8], rom[23][7:0], h3, h2, h1, h0, ready_h, t, ready_out[19]);
    neuron l1n20(clk, rom[24][39:32], rom[24][31:24], rom[24][23:16], rom[24][15:8], rom[24][7:0], h3, h2, h1, h0, ready_h, u, ready_out[20]);
    neuron l1n21(clk, rom[25][39:32], rom[25][31:24], rom[25][23:16], rom[25][15:8], rom[25][7:0], h3, h2, h1, h0, ready_h, v, ready_out[21]);
    neuron l1n22(clk, rom[26][39:32], rom[26][31:24], rom[26][23:16], rom[26][15:8], rom[26][7:0], h3, h2, h1, h0, ready_h, w, ready_out[22]);
    neuron l1n23(clk, rom[27][39:32], rom[27][31:24], rom[27][23:16], rom[27][15:8], rom[27][7:0], h3, h2, h1, h0, ready_h, x, ready_out[23]);
    neuron l1n24(clk, rom[28][39:32], rom[28][31:24], rom[28][23:16], rom[28][15:8], rom[28][7:0], h3, h2, h1, h0, ready_h, y, ready_out[24]);
    neuron l1n25(clk, rom[29][39:32], rom[29][31:24], rom[29][23:16], rom[29][15:8], rom[29][7:0], h3, h2, h1, h0, ready_h, z, ready_out[25]);
    assign ready = &(ready_out);
endmodule

// 3.1a) Rectified linear unit
// out = max(0, in/4)
// 16 bit signed input
// 8 bit unsigned output
module relu(in, out);
    input [15:0] in;
    output [7:0] out;

    // your code here
  mux2 #(8) return_max(in[9:2] , 0, in[15], out);
  
endmodule

module count4(clk, reset, done);
  input clk, reset;
  output done;
  wire done1, gate;
  wire [1:0] newv, in, out;
  
  dreg #(2) counting(clk, in, out);
  mux4 isdone(0, 0, 0, 1, out, done1);
  
  assign newv = done1 ? out : out + 1;
  assign done = done1;
  
  assign gate = reset & done1;
  mux2 #(2) sel_in(newv, 0, gate, in);
endmodule

// 3.1b) Pipelined 5 input ripple-carry adder
// 16 bit signed inputs
// 1 bit input: valid (when the other inputs are useful numbers)
// 16 bit signed output (truncated)
// 1 bit output: ready (when the output is the sum of valid inputs)
module piped_adder(clk, a, b, c, d, e, valid, sum, ready);
    input clk, valid;
    input [15:0] a, b, c, d, e;
    output [15:0] sum;
    output ready;
  
    // your code here
  wire [15:0] newin_a, newout_a, newin_b, newout_b, newin_c, newout_c, newin_d, newout_d, newin_e, newout_e;
  
  wire [3:0] s0sum0, s0sum3, s1sum0, s2sum0, s3sum0;
  
  wire c1, c2, c3, s1c1, s1c2, s1c3, s2c1, s2c2, s2c3, s3c3, o1, o2, o3, gate, re1, re2, re3;
  
  //dreg _r1(clk, valid, re1);
  //dreg _r2(clk, re1, re2);
  //dreg _r3(clk, re2, re3);
  //dreg _r4(clk, re3, ready);
  count4 calc_done(clk, valid, ready);

  
  mux2 #(16) change_ina(newout_a, a, valid, newin_a);
  mux2 #(16) change_inb(newout_b, b, valid, newin_b);
  mux2 #(16) change_inc(newout_c, c, valid, newin_c);
  mux2 #(16) change_ind(newout_d, d, valid, newin_d);
  mux2 #(16) change_ine(newout_e, e, valid, newin_e);
  
  dreg #(16) gate_ina(clk, newin_a, newout_a);
  dreg #(16) gate_inb(clk, newin_b, newout_b);
  dreg #(16) gate_inc(clk, newin_c, newout_c);
  dreg #(16) gate_ind(clk, newin_d, newout_d);
  dreg #(16) gate_ine(clk, newin_e, newout_e);
  
  adder5carry _add0(newout_a[3:0], newout_b[3:0], newout_c[3:0], newout_d[3:0], newout_e[3:0], 0, 0, 0, c1, c2, c3, s0sum0);
  
  adder5carry _add1(newout_a[7:4], newout_b[7:4], newout_c[7:4], newout_d[7:4], newout_e[7:4], c1, c2, c3, s1c1, s1c2, s1c3, s1sum0);
  
  adder5carry _add2(newout_a[11:8], newout_b[11:8], newout_c[11:8], newout_d[11:8], newout_e[11:8], s1c1, s1c2, s1c3, s2c1, s2c2, s2c3, s2sum0);
  
  adder5carry _add3(newout_a[15:12], newout_b[15:12], newout_c[15:12], newout_d[15:12], newout_e[15:12], s2c1, s2c2, s2c3, o1, o2, o3, s3sum0);
  
  dreg #(4) s_1(clk, s0sum0, sum[3:0]);
  dreg #(4) s_2(clk, s1sum0, sum[7:4]);
  dreg #(4) s_3(clk, s2sum0, sum[11:8]);
  dreg #(4) s_4(clk, s3sum0, sum[15:12]);
  
endmodule


// 3.1c) Pipelined neuron
// 8 bit signed weights, bias (constant)
// 8 bit unsigned inputs 
// 1 bit input: new (when a set of inputs are available)
// 8 bit unsigned output 
// 1 bit output: ready (when the output is valid)
module neuron(clk, w1, w2, w3, w4, b, x1, x2, x3, x4, new, y, ready);
    input clk;
    input [7:0] w1, w2, w3, w4, b;  // signed 2s complement
    input [7:0] x1, x2, x3, x4;     // unsigned
    input new;
    output [7:0] y;                 // unsigned
    output ready;

    // your code here
  wire mdone1, mdone2, mdone3, mdone4;
  wire [15:0] prod1, prod2, prod3, prod4, sum;
  wire [7:0] y0;
  wire n_done, p_done, sdone, done;
  assign n_done = mdone1&mdone2&mdone3&mdone4;
  dreg switch_done(clk, n_done, p_done);
  assign done = ~p_done & n_done;
  
  multiply m1(clk, w1, x1, new, prod1, mdone1);
  multiply m2(clk, w2, x2, new, prod2, mdone2);
  multiply m3(clk, w3, x3, new, prod3, mdone3);
  multiply m4(clk, w4, x4, new, prod4, mdone4);
  
  piped_adder addms(clk, prod1, prod2, prod3, prod4, {{8{b[7]}},b}, done, sum, sdone);
  
  relu takemax(sum, y0);
  
  dreg #(8) sums(clk, y0, y);
  dreg finish(clk, sdone, ready);
  
endmodule

// 3.2a) Inter-layer module
// four sets of inputs: 8 bit value, 1 bit input ready
// one 1 bit input new (from input layer of neurons)
// four sets of 8 bits output
// one 1 bit output ready
module interlayer(clk, new, in1, ready1, in2, ready2, in3, ready3, in4, ready4, out1, out2, out3, out4, ready_out);
    input clk;
    input new;
    input [7:0] in1, in2, in3, in4;
    input ready1, ready2, ready3, ready4;
    output [7:0] out1, out2, out3, out4;
    output ready_out;

    // your code here
  wire r1, r2;
  wire [7:0] i1, i2, i3, i4;
  dreg #(8) _1(clk, i1, out1);
  dreg #(8) _2(clk, i2, out2);
  dreg #(8) _3(clk, i3, out3);
  dreg #(8) _4(clk, i4, out4);
  mux2 #(8) m1(in1, out1, ready1, i1);
  mux2 #(8) m2(in2, out2, ready2, i2);
  mux2 #(8) m3(in3, out3, ready3, i3);
  mux2 #(8) m4(in4, out4, ready4, i4);
  
  assign r1 = ready1 & ready2 & ready3 & ready4;
  dreg ready(clk, r1, r2);
  assign ready_out = ~r2 & r1;
  
  
endmodule

// 3.3a) Morse decoder
// 1 bit time-series input 
// 5 bit letter [a=0, ..., z=25] output
// 7 bit 7-segment display output
// 1 bit flag indicating done

module decoder(clk, in, letter, display, done);
  input clk;
  input in;
  output [4:0] letter;
  output [6:0] display;
  output done;

  // your code here
  wire [7:0] out1, out2, out3, out4, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, a1, b1, c1, d1, e1, f1, g1, h1, i1, j1, k1, l1, m1, n1, o1, p1, q1, r1, s1, t1, u1, v1, w1, x1, y1, z1, in1, in2, in3, in4;
  wire ddone, ndone, idone;
  
  deserializer init(clk, in, out1, out2, out3, out4, ddone);
  
  dreg #(8) _d1(clk, out1, in1);
  dreg #(8) d2(clk, out2, in2);
  dreg #(8) d3(clk, out3, in3);
  dreg #(8) d4(clk, out4, in4);
  dreg d5(clk, ddone, idone);
  
  net genletters(clk, in1, in2, in3, in4, idone, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, ndone);
  
  dreg d6(clk, ndone, done);
  
  maxindex calcprob(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, letter);
  
  display_rom _display1(letter, display);
endmodule