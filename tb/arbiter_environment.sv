`timescale 1ns/1ps

module arbiter_environment;

reg clock;

wire reset;
wire [3:0] gen_request;
wire gen_valid;
wire [3:0] request;
wire [3:0] grant;

initial
    clock = 0;

always
    #5 clock = ~clock;

arbiter_generator GEN(
    .clock(clock),
    .reset(reset),
    .request(gen_request),
    .valid(gen_valid)
);

arbiter_driver DRV(
    .clock(clock),
    .gen_request(gen_request),
    .gen_valid(gen_valid),
    .request(request)
);

round_robin_arbiter DUT(
    .clock(clock),
    .reset(reset),
    .request(request),
    .grant(grant)
);

arbiter_monitor MON(
    .clock(clock),
    .reset(reset),
    .request(request),
    .grant(grant)
);

arbiter_scoreboard SCB(
    .clock(clock),
    .reset(reset),
    .request(request),
    .grant(grant)
);

endmodule