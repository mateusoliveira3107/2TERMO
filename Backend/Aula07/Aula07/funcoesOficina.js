function calcularOrcamento(precoPeca, horasTrabalho) {
    const valorHora = 85.00;
    const TotalMaoDeObra = horasTrabalho * valorHora
    return precoPeca + TotalMaoDeObra
}

function verificarGarantia(meses) {
    if (meses <= 3) {
        return "Dentro de Garantia";
    } else {
        return "Garantia Expirada";
    }
}

module.exports = {
    calcularOrcamento,
    verificarGarantia
}