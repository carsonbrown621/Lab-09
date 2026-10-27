`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2026 09:29:49 PM
// Design Name: 
// Module Name: memory_system
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module memory_system(
    input [7:0] data,
    input store,
    input [1:0] addr,
    output [7:0] memory
    );

    wire [7:0] data_bus [3:0];   // data routed to each byte
    wire [3:0] store_bus;        // store routed to each byte
    wire [7:0] mem_bus  [3:0];   // value held in each byte

    // Demux 1 data -> selected byte
    demultiplexer #(.WIDTH(8)) data_demux(
        .data(data),
        .sel(addr),
        .A(data_bus[0]), .B(data_bus[1]), .C(data_bus[2]), .D(data_bus[3])
    );

    // Demux 2 store (btnC) -> selected byte
    demultiplexer #(.WIDTH(1)) store_demux(
        .data(store),
        .sel(addr),
        .A(store_bus[0]), .B(store_bus[1]), .C(store_bus[2]), .D(store_bus[3])
    );

    // Four bytes of memory
    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin
            byte_memory mem_byte(
                .data(data_bus[i]),
                .store(store_bus[i]),
                .memory(mem_bus[i])
            );
        end
    endgenerate

    // Mux: selected byte -> LEDs
    multiplexer out_mux(
        .A(mem_bus[0]), .B(mem_bus[1]), .C(mem_bus[2]), .D(mem_bus[3]),
        .sel(addr),
        .Y(memory)
    );

endmodule