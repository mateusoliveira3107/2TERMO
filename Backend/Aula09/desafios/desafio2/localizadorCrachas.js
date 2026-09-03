const fs = require('fs');
const entrada = require('readline-sync');

const funcionarios = [
  {"id": 1,"nome": "Ana","setor": "Mecanico"},
  {"id": 2,"nome": "Pedro","setor": "Eletrico"},
  {"id": 3,"nome": "Carlos","setor": "Usinagem"},
  {"id": 4,"nome": "Mateus","setor": "Programacao"},
  {"id": 5,"nome": "Joaquim","setor": "Logistica"}
];

function salvarDados() {
    const dadosTexto = JSON.stringify(funcionarios, null, 2);

    fs.writeFileSync('funcionarios.json', dadosTexto);
};

salvarDados()

try {
    const dadosJson = fs.readFileSync('funcionarios.json', 'utf-8');
    const funcionarios = JSON.parse(dadosJson);

    numero = entrada.questionInt("Informe o ID: ");

    const funcionario_por_id = funcionarios.find(p => p.id === numero);
    console.log(`Setor do funcionario: ${funcionario_por_id.setor}`);
} catch (erro) {
    confirm.log("Erro ao acessar o banco de dados: " + erro.message);
}