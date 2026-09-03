const fs = require('fs');

const maquinas = [
  {"id": 1,"nome": "Torno CNC","horasUso": 1200},
  {"id": 2,"nome": "Fresadora","horasUso": 800},
  {"id": 3,"nome": "Prensa Hidraulica","horasUso": 1500},
  {"id": 4,"nome": "Corte a Laser","horasUso": 500},
];

function salvarDados() {
    const dadosJson = JSON.stringify(maquinas, null, 2);

    fs.writeFileSync('maquinas.json', dadosJson);
};

salvarDados();

const dadosJson = fs.readFileSync('maquinas.json', 'utf-8')
const maquinasJson = JSON.parse(dadosJson);
const maquinas_urgentes = maquinasJson.filter(m => m.horasUso > 1000);
console.log(maquinas_urgentes);

function salvarDadosManutencao() {
  const dadosJson2 = JSON.stringify(maquinas_urgentes, null, 2);

  fs.writeFileSync('manutencao_urgente.json', dadosJson2)
};

salvarDadosManutencao();
