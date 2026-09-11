const entrada = require('readline-sync');
const calculo = require('./calculosVenda');

const nome = entrada.question("Informe seu nome: ")
const valor = entrada.questionFloat("Informe o valor do produto: ");
const quantidade = entrada.questionFloat("Informe a quantidade: ");
const valorTotal = calculo.calcularTotal(valor, quantidade);

console.log(calculo.gerarCupom(nome,valorTotal.toFixed(2)));