const produto = {nome: "Teclado Mecânico", preço: 200.0, estoque: 15};

function aplicarDesconto(item, porcentagem) {
    item.preco -= item.preco * (porcentagem / 100);

    console.log(`O produto ${item.nome} agora custa R$${item.preco.toFixed(2)}`);
}

aplicarDesconto(produto, 10);
