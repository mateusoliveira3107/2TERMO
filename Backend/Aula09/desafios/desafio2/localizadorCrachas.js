const fs = require('fs');
const entrada = require('readline-sync');

const funcionarios = [
  {"id": 1,"nome": "Ana","setor": "Mecanico"},
  {"id": 2,"nome": "Pedro","setor": "Eletrico"},
  {"id": 3,"nome": "Carlos","setor": "Usinagem"},
  {"id": 4,"nome": "Mateus","setor": "Programacao"},
  {"id": 5,"nome": "Joaquim","setor": "Logistica"}
];

function salvarDados(f) {
    const dadosTexto = JSON.stringify(f, null, 2);

    fs.writeFileSync('funcionarios.json', dadosTexto);
};

salvarDados(funcionarios);

try {
    const dadosJson = fs.readFileSync('funcionarios.json', 'utf-8');
    const funcionariosJson = JSON.parse(dadosJson);

    numero = entrada.questionInt("Informe o ID: ");

    const funcionario_por_id = funcionariosJson.find(function(p) {
        return p.id === numero;
    });

    if (funcionario_por_id) {
        console.log(`Nome do funcionario: ${funcionario_por_id.nome}`)
        console.log(`Setor do funcionario: ${funcionario_por_id.setor}`);
        const resposta = entrada.question("Informe para qual setor o funcionario vai mudar: ");
        funcionario_por_id.setor = resposta;
        salvarDados(funcionariosJson);
    } else {
        console.log("Acesso Negado: ID não encontrado");
    }
} catch (erro) {
    console.log("Erro ao acessar o banco de dados: " + erro.message);
}