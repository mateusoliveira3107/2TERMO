function checarTemperatura(valor) {
    if (valor > 40) {
        return "ALERTA: Caldeira Superaquecida";
    } else {
        return "Temperatura Normal"
    }
};

function checarUmidade(valor) {
    if (valor < 20) {
        return "ALERTA: Ar muito seco";
    } else {
        return "Umidade Normal"
    }
};

module.exports = {
    checarUmidade,
    checarTemperatura
}