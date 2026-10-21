`timescale 1ns/1ps

module arbiter_driver(
    input clock,
    input [3:0] gen_request,
    input gen_valid,
    output reg [3:0] request
);

always @(posedge clock)
begin
    if(gen_valid)
        request <= gen_request;
    else
        request <= 0;
end

endmodule