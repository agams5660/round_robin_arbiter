`timescale 1ns/1ps

module arbiter_generator(
    input clock,
    output reg reset,
    output reg [3:0] request,
    output reg valid
);

integer i;

initial
begin
    reset = 1;
    request = 0;
    valid = 0;

    @(negedge clock);
    @(negedge clock);
    reset = 0;

    for(i = 0; i < 16; i = i + 1)
    begin
        case(i)
            0: request = 4'b0001;
            1: request = 4'b0010;
            2: request = 4'b0100;
            3: request = 4'b1000;
            4: request = 4'b1111;
            5: request = 4'b1111;
            6: request = 4'b1111;
            7: request = 4'b1111;
            8: request = 4'b0101;
            9: request = 4'b1010;
            10: request = 4'b1111;
            11: request = 4'b0011;
            12: request = 4'b1100;
            13: request = 4'b0110;
            14: request = 4'b1001;
            15: request = 4'b0000;
        endcase

        valid = 1;
        @(negedge clock);
    end

    request = 0;
    valid = 0;
end

endmodule