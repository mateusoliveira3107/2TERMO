const entrada = require('readline-sync');

const nome = entrada.question("Informe o nome do material: ");
const quantidade = entrada.question("Informe a quantidade comprada: ");
const precoUnitario = entrada.question("Informe o preco unitario: ");

const valorTotal = quantidade * precoUnitario;

console.log("=== Resumo da Compra ===");
console.log(`Produto: ${nome}`);
console.log(`Valor total: R$${valorTotal.toFixed(2)}`);