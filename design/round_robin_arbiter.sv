`timescale 1ns/1ps

module round_robin_arbiter #(
    parameter N = 4
)(
    input logic clock,
    input logic reset,
    input logic [N-1:0] request,
    output logic [N-1:0] grant
);

integer i;
integer index;
integer last_grant;
logic found;

always_ff @(posedge clock)
begin
    if(reset)
    begin
        grant <= 0;
        last_grant <= N-1;
    end
    else
    begin
        grant <= 0;
        found = 0;

        for(i = 1; i <= N; i = i + 1)
        begin
            index = (last_grant + i) % N;

            if(!found && request[index])
            begin
                grant[index] <= 1'b1;
                last_grant <= index;
                found = 1;
            end
        end
    end
end

endmodule