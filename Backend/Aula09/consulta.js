const fs = require('fs');
const entrada = require('readline-sync');

console.log("=== SISTEM DAA DE CONSULTA DE ESTOQUE ===\n");

try {
    const dadosTexto = fs.readFileSync('estoque.json', 'utf-8');
    const produtos = JSON.parse(dadosTexto);

    const num = entrada.question("Digite a quantidade de produtos: ");

    const produtos_classificados = produtos.filter(p => p.qnt < num);
    console.log(produtos_classificados);
    
    // if (resultado) {
    //     console.log("\nPRODUTO ENCONTRADO");
    //     console.log(`ID: ${resultado.id}`);
    //     console.log(`Nome: ${resultado.nome}`);
    //     console.log(`Quantidade em estoque: ${resultado.qnt}`);
    // } else {
    //     console.log("\nSinto muito. Produto não cadastrado no sistema");
    // }
} catch (erro) {
    confirm.log("Erro ao acessar o banco de dados: " + erro.message);
}