// alu32.sv
`timescale 1ns/1ps
import alu_pkg::*;

module alu32 (
  input  logic [31:0] a,
  input  logic [31:0] b,
  input  alu_op_t     op,

  output logic [31:0] y,
  output logic        z, // zero
  output logic        n, // negative
  output logic        c, // carry
  output logic        v  // overflow
);

  logic [32:0] tmp;

  always @(*) begin
    // default
    y = 32'd0;
    c = 1'b0;
    v = 1'b0;

    case (op)
      ALU_ADD: begin
        tmp = {1'b0, a} + {1'b0, b};
        y   = tmp[31:0];
        c   = tmp[32];
        v   = (~(a[31] ^ b[31])) & (y[31] ^ a[31]);
      end

      ALU_SUB: begin
        tmp = {1'b0, a} - {1'b0, b};
        y   = tmp[31:0];
        c   = ~tmp[32]; // no borrow
        v   = (a[31] ^ b[31]) & (y[31] ^ a[31]);
      end

      ALU_AND: y = a & b;
      ALU_OR : y = a | b;
      ALU_XOR: y = a ^ b;
      ALU_NOT: y = ~a;
      ALU_SLT: y = ($signed(a) < $signed(b)) ? 32'd1 : 32'd0;
      ALU_SLL: y = a << b[4:0];
      ALU_SRL: y = a >> b[4:0];

      default: y = 32'd0;
    endcase
  end

  // flags
  always @(*) begin
    z = (y == 32'd0);
    n = y[31];
  end

endmodule
