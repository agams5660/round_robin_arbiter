`timescale 1ns/1ps

module arbiter_scoreboard(
    input clock,
    input reset,
    input [3:0] request,
    input [3:0] grant
);

reg [3:0] sampled_request;

always @(posedge clock)
begin
    if(reset)
        sampled_request = 0;
    else
    begin
        sampled_request = request;

        #1;

        if((^sampled_request === 1'bx) || (^grant === 1'bx))
            $display("SCOREBOARD: FAIL - UNKNOWN SIGNAL");

        else if((grant & (grant - 1'b1)) != 0)
            $display("SCOREBOARD: FAIL - MULTIPLE GRANTS");

        else if((grant & sampled_request) != grant)
            $display("SCOREBOARD: FAIL - INVALID GRANT");

        else if(sampled_request != 0 && grant == 0)
            $display("SCOREBOARD: FAIL - REQUEST NOT GRANTED");

        else
            $display("SCOREBOARD: PASS REQUEST=%b GRANT=%b",
                     sampled_request, grant);
    end
end

endmodule