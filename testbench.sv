//--------------------------------------------------------------------
//		Timescale
//		Means that if you do #1 in the initial block of your
//		testbench, time is advanced by 1ns instead of 1ps
//--------------------------------------------------------------------
`timescale 1ns / 1ps

//--------------------------------------------------------------------
//		Design assignment #2, problem #1 sample testbench.
//--------------------------------------------------------------------
module dassign3_3_tb();

parameter length = 576;
parameter words = 3;

//----------------------------------------------------------------
//		Signal Declarations
//----------------------------------------------------------------

// clock
wire clk;

// morse rom
reg [0:length-1] signal[0:words-1];
reg [0:length-1] word;

// morse input
reg in;

// morse output
wire [4:0] letter;
wire [6:0] display;
wire done;

// variables for testing
reg [7:0] ascii;
reg printed=0;
integer     i,w;

//----------------------------------------------------------------
//		Instantiate modules 
//----------------------------------------------------------------
clock_gen     clock_gen(clk);
decoder       decoder(clk, in, letter, display, done);

//----------------------------------------------------------------
//		Test Stimulus
//----------------------------------------------------------------
initial begin
    // Export timing information
    // Warning: slow!
     $dumpfile("timing.vcd");
     $dumpvars;

    $readmemb("./signal_rom", signal);

    // Flush the pipeline
    for(i=8'b0; i<5; i=i+1) begin
      @(posedge clk); #1
      in=1;
      @(posedge clk); #1
      in=0;
    end
    for(i=8'b0; i<50; i=i+1) begin
      @(posedge clk); #1
      in=0;
    end

    // Parse morse code signal
    for(w=8'b0; w<words; w=w+1) begin
      word = signal[w];

      for(i=8'b0; i<length; i=i+1) begin
          // Wait for rising edge of clock
          @(posedge clk); 

          // Decoder indicates done
          if (done & !printed) begin
            ascii = letter+65;
            $display("%s", ascii);
            printed = 1;
          end else if (!done) begin
            printed = 0;
          end
          #1 in = word[i];
      end
    end

    $finish;
end
endmodule

// Clock generation.  Period set via parameter:
//   clock changes every half_period ticks
//   full clock period = 2*half_period
module clock_gen(clk);
    parameter half_period = 31; 
    output clk;
    reg    clk;

    initial clk = 1;
    always #half_period clk = ~clk;
endmodule
