const entrada = require('readline-sync');

const energia = require('./calculoEnergia');

const nomeMaquina = entrada.question("Nome da Maquina: ");
const potenciaWatts = entrada.questionInt("Potencia em Watts: ");
const horasUsoMensal = entrada.questionInt("Horas de uso no mes: ");
const precoKwh = entrada.questionFloat("Preco do Kwh: ");

const totalKwh = energia.calcularKwh(potenciaWatts, horasUsoMensal);
const custo = energia.calcularCusto(totalKwh, precoKwh);
const classificacao = energia.classificarConsumo(totalKwh);

console.log("===- Relatorio de Eficiencia ====");
console.log(`Nome da maquina: ${nomeMaquina.toUpperCase()}`);
console.log(`Custo Total: R$${custo.toFixed(2)}`);
console.log(`Consumo Total: ${totalKwh.toFixed(2)} Kwh`);
console.log(`Classificacao: ${classificacao}`);
console.log("=".repeat(33));