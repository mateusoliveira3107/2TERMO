function calcularBase(km) {
    return km * 2.10;
}

function calcularSeguro(valorCarga) {
    return valorCarga * (1/100);
}

function verificarPrazo(km) {
    if (km < 100) {
        return "1 dia util";
    } else {
        return "3 a 5 dias uteis";
    }
}

module.exports = {
    calcularBase,
    calcularSeguro,
    verificarPrazo
}