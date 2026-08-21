const produto = {
    nome: "Teclado Mecânico",
    preco: 150.00,
    estoque: 25,
    emOferta: true
};
console.log(`Produto: ${produto.nome}`);
console.log(`Preço: ${produto.preco.toFixed(2)}`);
console.log(`Produto: ${produto.nome} | preco: R$${produto.preco} | estoque: ${produto.estoque} | em oferta: ${produto.emOferta} `);
