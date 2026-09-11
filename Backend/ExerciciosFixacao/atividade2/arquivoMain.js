// Faltou colocar ./ no caminho do arquivo
const geo = require('./geometria');

const l = 10;

// Faltou chamar a variável "geo"
console.log(geo.calcularAreaQuadrado(l.toFixed(2)));