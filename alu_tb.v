// alu_tb.v - Testbench for 8-Bit ALU
`timescale 1ns / 1ps

module alu_tb;
    // Inputs
    reg [7:0] A;
    reg [7:0] B;
    reg [2:0] ALU_Sel;

    // Outputs
    wire [7:0] ALU_Out;
    wire CarryOut;
    wire Zero;
    wire Overflow;

    // Instantiate the Unit Under Test (UUT)
    alu uut (
        .A(A), 
        .B(B), 
        .ALU_Sel(ALU_Sel), 
        .ALU_Out(ALU_Out), 
        .CarryOut(CarryOut), 
        .Zero(Zero), 
        .Overflow(Overflow)
    );

    initial begin
        // Required commands to generate waves in EDA Playground
        $dumpfile("dump.vcd");
        $dumpvars(1, alu_tb);

        // Display Header for logs
        $display("Time\t A \t B \t Sel \t Out \t C \t Z \t V");
        $monitor("%0d\t %d \t %d \t %b \t %d \t %b \t %b \t %b", $time, A, B, ALU_Sel, ALU_Out, CarryOut, Zero, Overflow);

        // --- Edge Case 1: 255 + 1 (Triggers CarryOut) ---
        A = 8'd255; B = 8'd1; ALU_Sel = 3'b000; #10;
        
        // --- Edge Case 2: 0 - 1 (Underflow / Under-the-hood Carry) ---
        A = 8'd0; B = 8'd1; ALU_Sel = 3'b001; #10;
        
        // --- Edge Case 3: 127 + 1 (Signed Overflow) ---
        A = 8'd127; B = 8'd1; ALU_Sel = 3'b000; #10;
        
        // --- Edge Case 4: 0 AND 255 ---
        A = 8'd0; B = 8'd255; ALU_Sel = 3'b010; #10;
        
        // --- Edge Case 5: Shifting 10000000 left ---
        A = 8'b10000000; B = 8'd0; ALU_Sel = 3'b110; #10;

        $finish;
    end
endmodule

