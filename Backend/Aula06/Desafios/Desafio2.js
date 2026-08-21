// Gerador de Parcelas

const entrada = require("readline-sync");

const valor = entrada.questionFloat("Informe o valor total do produto: ");
const parcelas = entrada.questionInt("Informe a quantidade de parcelas [maximo 12]: ");
const valor_parcela = valor/parcelas;
if (parcelas > 12) {
    console.log("Quantidade Inválida.")
} else {
    for (let i = 1; i <= parcelas; i++) {
        console.log(`Parcela ${i}: R$${valor_parcela.toFixed(2)}`);
    }
}
