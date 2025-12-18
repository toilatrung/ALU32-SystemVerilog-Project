// tb_alu32.sv
`timescale 1ns/1ps
import alu_pkg::*;

module tb_alu32;

  logic [31:0] a, b;
  logic [3:0]  op_raw;
  alu_op_t     op;

  logic [31:0] y;
  logic z, n, c, v;

  alu32 dut (
    .a(a), .b(b), .op(op),
    .y(y), .z(z), .n(n), .c(c), .v(v)
  );

  task check;
    input [31:0] exp;
    begin
      if (y !== exp) begin
        $display("ERROR: a=%h b=%h op=%0d y=%h exp=%h", a, b, op, y, exp);
        $finish;
      end
    end
  endtask

  initial begin
    // Waveform dump (VCD)
    $dumpfile("tb_alu32.vcd");
    $dumpvars(0, tb_alu32);

    // ADD
    a = 10; b = 20; op = ALU_ADD; #1;
    check(30);

    // SUB
    a = 50; b = 8; op = ALU_SUB; #1;
    check(42);

    // AND
    a = 32'hF0F0; b = 32'h0FF0; op = ALU_AND; #1;
    check(32'h00F0);

    // OR
    op = ALU_OR; #1;
    check(32'hFFF0);

    // XOR
    op = ALU_XOR; #1;
    check(32'hFF00);

    // SLT
    a = -5; b = 3; op = ALU_SLT; #1;
    check(32'd1);

    // RANDOM TEST
    repeat (100) begin
      a = $random;
      b = $random;
      op_raw = $random % 9;
      op = alu_op_t'(op_raw);
      #1;
    end

    $display("ALL TESTS PASSED.");
    $finish;
  end

endmodule
