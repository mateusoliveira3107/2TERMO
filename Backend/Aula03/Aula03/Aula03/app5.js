const pergunta = require('readline-sync');

console.log("----- Calculadora IMC -----");

const peso = pergunta.questionFloat("Informe seu peso em kg: ");
const altura = pergunta.questionFloat("Informe sua altura: ");

const imc = peso / (altura**2)

console.log(`Seu IMC (Índice de massa corporal): ${imc.toFixed(2)}`);