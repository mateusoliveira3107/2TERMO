const entrada = require('readline-sync');
const logistica = require('./calculadoraFrete');

console.log("=== Sistema Expresso Industrial ===");

const produto = entrada.question("Produto a ser transportado: ");
const km = entrada.questionFloat("Distancia da entrega [KM]: ");
const valorCarga = entrada.questionFloat("Valor total da carga: R$ ");

const freteBase = logistica.calcularBase(km);
const seguro = logistica.calcularSeguro(valorCarga);
const prazo = logistica.verificarPrazo(km);
const totalGeral = freteBase + seguro;

console.log(`----- RELATORIO DE POSTAGEM -----`);
console.log(`Produto: ${produto}`);
console.log(`Prazo de entrega: ${prazo}`);
console.log(`Frete Base: R$ ${freteBase.toFixed(2)}`);
console.log(`Seguro: R$ ${seguro.toFixed(2)}`);
console.log(`TOTAL: R$ ${totalGeral.toFixed(2)}`);
console.log(`-`.repeat(25))
