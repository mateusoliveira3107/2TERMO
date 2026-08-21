function calcularKwh (potencia, horas) {
    return (potencia * horas) / 1000
}

function calcularCusto (totalKwh, precoKwh) {
    return totalKwh * precoKwh
}

function classificarConsumo (totalKwh) {
    if (totalKwh < 100) {
        return "Consumo Baixo";
    } else {
        return "Consumo Elevado";
    }
}
module.exports = {
    calcularKwh,
    calcularCusto,
    classificarConsumo
}