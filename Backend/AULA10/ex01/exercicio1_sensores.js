const fs = require('fs');

const objetos = [
    {codigo: 1001, tipo: "Temperatura", leituraAtual: 55.6, status: "Operando"},
    {codigo: 1002, tipo: "Pressão", leituraAtual: 6, status: "Operando"},
    {codigo: 1003, tipo: "Temperatura", leituraAtual: 255.9, status: "Alerta"},
];

const textoObjetos = JSON.stringify(objetos, null, 2);

fs.writeFileSync('sensores.json', textoObjetos);