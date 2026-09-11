const entrada = require('readline-sync');
const sensor = require('./sensor');

const valor1 = entrada.questionFloat("Informe a temperatura: ");
const valor2 = entrada.questionFloat("Informe a umidade: ");

const verificacao1 = sensor.checarTemperatura(valor1);
const verificacao2 = sensor.checarUmidade(valor2);

console.log(`=== Relatório de Avisos ===`);
console.log(verificacao1);
console.log(verificacao2);