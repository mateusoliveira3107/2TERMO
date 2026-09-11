function calcularTotal(preco, qtd) {
    return preco * qtd;
};

function gerarCupom (nome, valor) {
    return `Cliente: ${nome} - Total: R$${valor}`;
};

module.exports = {
    calcularTotal,
    gerarCupom
}