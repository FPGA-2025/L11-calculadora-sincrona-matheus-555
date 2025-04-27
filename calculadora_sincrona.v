module calculadora_sincrona(
    input [7:0] entrada,
    input [2:0] codigo,
    input clk,
    input rst,
    output reg [7:0] saida
);
    
    //insira seu código aqui
    parameter MOSTRAR_ENTRADA = 3'b000;
    parameter SOMAR           = 3'b001;
    parameter SUBTRAIR        = 3'b010;
    parameter MOSTRAR_AC      = 3'b011;

    reg [7:0] acc;

    always @(posedge rst or posedge clk) begin
        if (rst) begin
            acc   = 8'b0;
            saida = 8'b0;
        end
        else begin
            case (codigo)
                MOSTRAR_ENTRADA: saida = entrada;
                SOMAR: begin
                    acc = acc + entrada;
                    saida = 0; 
                end                            
                SUBTRAIR: begin
                    acc = acc - entrada;
                    saida = 0;
                end
                MOSTRAR_AC: saida = acc;
            endcase
        end
    end
endmodule