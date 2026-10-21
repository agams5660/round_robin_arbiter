`timescale 1ns/1ps

module tb_arbiter;

initial
begin
    $dumpfile("sim/arbiter.vcd");
    $dumpvars(0, tb_arbiter);

    #200;

    $display("ARBITER SIMULATION COMPLETED");
    $finish;
end

arbiter_environment ENV();

endmodule