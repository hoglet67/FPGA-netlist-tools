// Top-level test SoC for z80 core, RAM, peripherals, clocks
//
// Copyright (c) 2010 Peter Monta

module main();
   wire eclk /*verilator public*/;
   wire ereset /*verilator public*/;
   
`ifndef verilator
   clk_reset_gen _clk_reset_gen(eclk, ereset);
`endif
   
   wire [15:0] ab /*verilator public*/;
   wire [7:0]  db_i;
   wire [7:0]  db_o;
   wire [7:0]  db_t;
   wire        _reset, _wait, _int, _nmi, _busrq;   
   wire        _m1, _rd, _wr, _mreq, _iorq, _rfsh, _halt, _busak;
   wire        clk;
   
   assign _wait = 1;
   assign _int = 1;
   assign _nmi = 1;
   assign _busrq = 1;

   clocks_6502 _clocks(eclk, ereset, _reset, clk);

   chip_z80 _chip_z80(eclk, ereset,
                      ab[0], ab[1], ab[2], ab[3], ab[4], ab[5], ab[6], ab[7], ab[8], ab[9], ab[10], ab[11], ab[12], ab[13], ab[14], ab[15],
                      db_i[0], db_o[0], db_t[0], db_i[1], db_o[1], db_t[1], db_i[2], db_o[2], db_t[2], db_i[3], db_o[3], db_t[3], 
                      db_i[4], db_o[4], db_t[4], db_i[5], db_o[5], db_t[5], db_i[6], db_o[6], db_t[6], db_i[7], db_o[7], db_t[7],
                      _reset, _wait, _int, _nmi, _busrq,
                      _m1, _rd, _wr, _mreq, _iorq, _rfsh, _halt, _busak,
                      clk);
   
   ram_6502 _ram(eclk, ereset, clk, ab, db_i, db_o, _wr);

`ifndef verilator
   initial begin
      $dumpfile("test_z80.lxt");
      $dumpvars(0,main);
      #`MAXTICKS;
      $finish();
   end
`endif

endmodule

`ifndef verilator
module clk_reset_gen(output reg clk, reset);
   initial begin
      reset = 1;
      #1000;
      reset = 0;
   end
   
   initial begin
      clk = 0;
      forever #5 clk = ~clk;
   end
   
endmodule
`endif
