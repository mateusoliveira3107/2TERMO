// Importa a biblioteca readline-sync
const entrada = require('readline-sync');

console.log("---SISTEMA DE VENDAS PADARIA---");

//1. Entrada de dados pelo terminal

const nomeProduto = entrada.question("Qual o produto?");
const precoUnitario = entrada.questionFloat("Qual o preço unitário?");
const quantidade = entrada.questionInt("Quantas unidades foram vendidas?");

//3. Processa a conta

const total = precoUnitario * quantidade;

//4. Saída de dados:
console.log("\n--- Recibo de Venda ---");
console.log(`Produto: ${nomeProduto}`);
console.log(`Total a pagar: R$ ${total.toFixed(2)}`);