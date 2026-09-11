const entrada = require('readline-sync')
const conversor = require('./conversor');

const valorDolar = entrada.questionFloat("Insira um valor em dolar: R$");

const valorReal = conversor.converterPraReal(valorDolar);

console.log(`Valor em real: R$${valorReal.toFixed(2)}`)