/ alu.v - 8-Bit Arithmetic Logic Unit
module alu (
    input  wire [7:0] A,          // 8-bit Input A
    input  wire [7:0] B,          // 8-bit Input B
    input  wire [2:0] ALU_Sel,    // 3-bit Operation Select
    output reg  [7:0] ALU_Out,    // 8-bit ALU Result
    output reg        CarryOut,   // Carry Flag
    output wire       Zero,       // Zero Flag
    output reg        Overflow    // Overflow Flag
);

    // Assign Zero flag dynamically based on output
    assign Zero = (ALU_Out == 8'b0);

    always @(*) begin
        CarryOut = 1'b0;
        Overflow = 1'b0;
        case(ALU_Sel)
            3'b000: begin // Addition
                {CarryOut, ALU_Out} = A + B;
                // Signed overflow detection
                Overflow = ((A[7] == B[7]) && (ALU_Out[7] != A[7]));
            end
            3'b001: begin // Subtraction
                {CarryOut, ALU_Out} = A - B;
                // Signed overflow detection
                Overflow = ((A[7] != B[7]) && (ALU_Out[7] != A[7]));
            end
            3'b010: begin // Logical AND
                ALU_Out = A & B;
            end
            3'b011: begin // Logical OR
                ALU_Out = A | B;
            end
            3'b100: begin // Logical XOR
                ALU_Out = A ^ B;
            end
            3'b101: begin // Logical NOT (of input A)
                ALU_Out = ~A;
            end
            3'b110: begin // Logical Left Shift
                ALU_Out = A << 1;
                CarryOut = A[7]; // Leftmost bit shifts out into carry
            end
            3'b111: begin // Logical Right Shift
                ALU_Out = A >> 1;
                CarryOut = A[0]; // Rightmost bit shifts out into carry
            end
            default: ALU_Out = 8'h00;
        endcase
    end
endmodule
