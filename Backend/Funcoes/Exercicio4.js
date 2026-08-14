const entrada = quire("readline-sync");

function calcularDesconto (precoOriginal) {
    return precoOriginal * 0.85;
};

const produtos = ["Monitor", "Teclado", "Mouse"];
const precos = [800, 150, 80];

console.log("=== TABELA DE PRECOS COM DESCONTO (15%) ===");

for (let i = 0; i < produtos.length; i++) {
    let precoComDesconto = calcularDesconto(precos[i]);
    console.log(`${produtos[i]}: de R$${precos[i]} por R$${precoComDesconto.toFixed(2)}`)
};
