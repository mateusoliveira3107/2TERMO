const produto = {nome: "Teclado Mecânico", preço: 200.0, estoque: 15};

function aplicarDesconto(itemporcentagem){
    itemporcentagem.preco -= itemporcentagem.preco * (porcentagem/100);
    console.log(`O produto ${item.nome} agora custa R$`)
}