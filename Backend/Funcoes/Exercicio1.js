const entrada = require("readline-sync");

function calcularMedia(n1, n2) {
    return (n1 + n2) / 2
}

const num1 = entrada.questionInt("Digite um numero: ");
const num2 = entrada.questionInt("Digite outro numero: ");
const resultado = calcularMedia(num1, num2);

console.log(`A média calculada foi: ${resultado}`);
