const entrada = require('readline-sync');

const pecasDefeituosas = []

const qtdPecas = entrada.questionInt("Informe quantas pecas com defeito foram encontradas: ");

for (let i = 0; i < qtdPecas; i++) {
    const numeroPeca = entrada.questionInt(`Informe o numero da serie da peca ${i + 1}: `);

    pecasDefeituosas.push(numeroPeca);
};

console.log("=== Relatorio de pecas ===");
console.log(`Total de pecas: ${pecasDefeituosas.length} - Numeros de serie: ${pecasDefeituosas}`);