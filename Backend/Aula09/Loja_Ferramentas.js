const fs = require('fs');

const produtos = [
    {id:1, nome: "Parafuso", qnt: 100},
    {id:2, nome: "Porca", qnt: 250},
    {id:3, nome: "Arruela", qnt: 50}
];

function salvarDados() {
    const dadosTexto = JSON.stringify(produtos, null, 2);

    fs.writeFileSync('estoque.json', dadosTexto);
    console.log("Dados salvos com sucesso no arquivo estoque.json!");
};

function verEstoqueBaixo() {
    console.log("\n--- Produtos com estoque baixo (menos de 100) ---");

    const baixoEstoque = produtos.filter(p => p.qnt < 100);
    console.log(baixoEstoque);
}
salvarDados();
verEstoqueBaixo();