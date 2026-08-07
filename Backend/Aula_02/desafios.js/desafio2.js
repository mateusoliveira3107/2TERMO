const entrada = require("readline-sync");
const valor_conta = entrada.questionFloat("Informe o valor total da conta: ");
const desconto = valor_conta * 10/100

if (valor_conta >= 100){
    const valor_total = valor_conta - desconto
    console.log(`Total a pagar: R$${valor_total.toFixed(2)}`);
    console.log(`Desconto aplicado: R$${desconto}`)
} else {
    console.log(`Total a pagar: R$${valor_conta.toFixed(2)}`);
}