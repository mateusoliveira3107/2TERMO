const fs = require('fs');

console.log("=== SISTEMA DE REGISTRO DE MÁQUINAS ===");

const maquinasIndustriais = [
    {id: 101, nome: "Torno Mecanico Universal", setor: "Usinagem", operacional: true},
    {id: 102, nome: "Fresadora Ferramenteira", setor: "Usinagem", operacional: false},
    {id: 103, nome: "Prensa Hidruulica 50T", setor: "Estamparia", operacional: true}
]

const maquinasIndustriaisJSON = JSON.stringify(maquinasIndustriais, null, 2);

fs.writeFileSync('maquinas_industriais.json', maquinasIndustriaisJSON);

console.log("Gravacao concluida com sucesso! Verifique o arquivo gravado na pasta.");