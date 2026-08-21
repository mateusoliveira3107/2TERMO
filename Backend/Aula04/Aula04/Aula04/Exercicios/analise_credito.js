const entrada = require('readline-sync');

console.log("--- SISTEMA DE ANALISE DE CREDITO ---");

// Coleta de dados
const nome = entrada.question("Nome do cliente: ");
const idade = entrada.questionInt("Idade: ");
const renda = entrada.questionFloat("Renda Mensal: ");
const temImovel = entrada.keyInYNStrict("Possui imovel proprio? "); //

// A lógica Combinada
// (Idade >= 18) é obrigatório
// (Renda >= 2500 || temImovel === true) um dos dois tem que ser verdade
if (idade >= 18 && (renda >= 2500 || temImovel === true)) {
    console.log(`\nPARABENS, ${nome}! Seu credito FOI APROVADO`);
} else {
    console.log(`\nSinto muito${nome}, Seu credito FOI NEGADO`);
}
