const entrada = require('readline-sync');
const fs = require('fs');

let ferramentas = []

console.log("===".repeat(18))

const qntdFerramentas = entrada.questionInt("Informe a quantidade de ferramentas a serem registradas: ");

for (let i = 0; i < qntdFerramentas; i++) {
    const nome = entrada.question(`\nInforme o nome da ferramenta ${i + 1}: `);
    const quantidade = entrada.questionInt("Informe a quantidade: ");
    const custoUnitario = entrada.questionFloat("Informe o valor unitario: ");

    const ferramenta = {nome: nome, quantidade: quantidade, custo_unitario: custoUnitario}

    ferramentas.push(ferramenta);
}

const textoFerramentas = JSON.stringify(ferramentas, null, 2);

fs.writeFileSync('ferramentas.json', textoFerramentas);

console.log("\nItens Registrados Com Sucesso!");
console.log(`\nITENS:`);
for (let ferramenta of ferramentas) {
    console.log(`- ${ferramenta.nome}`)
}