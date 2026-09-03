const fs = require('fs');
const entrada = require('readline-sync');

const maquinas = [
  {"id": 1,"nome": "Torno CNC","horasUso": 1200},
  {"id": 2,"nome": "Fresadora","horasUSo": 800},
  {"id": 3,"nome": "Prensa Hidraulica","horasUso": 1500},
  {"id": 4,"nome": "Corte a Laser","horasUso": 500},
];

function salvarDados() {
    const dadosTexto = JSON.stringify(maquinas, null, 2);

    fs.writeFileSync('maquinas.json', dadosTexto);
};

salvarDados();

