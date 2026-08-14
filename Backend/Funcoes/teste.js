const entrada = require ("readline-sync");

console.log("---- LISTA DE COMPRAS ----");
let produtos = [];
let resposta = true;

while (resposta === true) {
    resposta = entrada.keyInYNStrict("Adicionar  item?");

    if(resposta) {
        const produto = {
            nome: entrada.question("Nome do produto: "),
            preco: entrada.questionFloat("Preco unitario: "),
            quantidade: entrada.questionInt("Quantidade: "),
            
        };
        produtos.push(produto)
    };
};
if (produtos.length <= 0) {
    console.log("Nenhum item adicionado.")
} else {
    for (let i = 0; i < produtos.length; i++)
    console.log(`Produto: ${produtos[i]}`);
}
