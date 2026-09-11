function calcularMaoDeObra(horas) {
    const valorHora = 80.00;
    return horas * valorHora;
};

function calcularTotal(valorPecas, maoDeObra) {
    return valorPecas + maoDeObra;
};

function verificarGarantia(meses) {
    if (meses <= 6) {
        return "EM GARANTIA";
    } else {
        return "FORA DA GARANTIA";
    };
};

module.exports = {
    calcularMaoDeObra,
    calcularTotal,
    verificarGarantia
}