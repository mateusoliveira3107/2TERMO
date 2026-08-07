const entrada = require("readline-sync");
const gasolina = entrada.questionFloat("Informe o preco do litro da gasolina: ");
const alcool = entrada.questionFloat("Informe o preco do litro alcool: ");
const valor = alcool/gasolina

if (valor < 0.7) {
    console.log("Abasteça com ÁLCOOL.");
} else {
    console.log("Abasteça com GASOLINA.");
}