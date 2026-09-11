const entrada = require('readline-sync');

const nomes = [];

for (let i = 0; i < 5; i++) {
    const nome = entrada.question("Informe um nome: ");
    nomes.push(nome);
};

console.log("\nNomes Informados")
for (let i = 0; i < nomes.length; i++) {
    console.log(`${i + 1} - ${nomes[i]}`);
};