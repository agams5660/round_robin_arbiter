`timescale 1ns/1ps

module arbiter_monitor(
    input clock,
    input reset,
    input [3:0] request,
    input [3:0] grant
);

always @(posedge clock)
begin
    if(!reset)
        $display("MONITOR: REQUEST=%b GRANT=%b", request, grant);
end

endmodule