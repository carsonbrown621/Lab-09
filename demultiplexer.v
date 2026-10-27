module demultiplexer #(
    parameter WIDTH = 8
)(
    input [WIDTH-1:0] data,
    input [1:0] sel,
    output reg [WIDTH-1:0] A,
    output reg [WIDTH-1:0] B,
    output reg [WIDTH-1:0] C,
    output reg [WIDTH-1:0] D
);

    always @(*) begin
        case(sel)
            2'b00: {D, C, B, A} <= {{WIDTH{1'b0}}, {WIDTH{1'b0}}, {WIDTH{1'b0}}, data};
            2'b01: {D, C, B, A} <= {{WIDTH{1'b0}}, {WIDTH{1'b0}}, data, {WIDTH{1'b0}}};
            2'b10: {D, C, B, A} <= {{WIDTH{1'b0}}, data, {WIDTH{1'b0}}, {WIDTH{1'b0}}};
            2'b11: {D, C, B, A} <= {data, {WIDTH{1'b0}}, {WIDTH{1'b0}}, {WIDTH{1'b0}}};
        endcase
    end

endmodule