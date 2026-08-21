function verificarPeso(leitura) {
    if (isNaN(leitura)) {
        return "Entrada Invalida! Digite apenas numeros.\n";
    } else if (leitura < 100 || leitura > 500) {
        return "Peso fora do padrao (100g - 500g)! Peca descartada.\n";
    } else {
        return `peca aprovada com ${leitura}g\n`;
    }
}

module.exports = {
    verificarPeso
}