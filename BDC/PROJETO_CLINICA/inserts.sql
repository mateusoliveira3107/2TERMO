USE clinica;

INSERT INTO empresa (telefone, cnpj, nome_empresa, razao_social, ativo) VALUES 
('11987654321', '12345678000190', 'TechNova Soluções', 'TechNova Tecnologia e Sistemas', true),
('2134567890', '98765432000110', 'Padaria Pão Quente', 'Comércio de Alimentos Pão Quente', true),
('4132109876', '78912345000156', 'Auto Peças Veloz', 'Veloz Distribuidora de Peças Automotivas', false),
('51988887777', '32165498000178', 'Clínica Bem Estar', 'Centro Médico e Odontológico Bem Estar', true);
select * from empresa;


INSERT INTO funcionario (nome_funcionario, cpf, telefone, data_admissao, cargo, id_empresa) VALUES
('Rafael Henrique', '12345678901', '11987654321', '2023-03-15', 'Desenvolvedor de Sistemas', 1),
('Beatriz Oliveira', '23456789012', '19991234567', '2022-08-01', 'Analista de TI', 1),
('Marcos Vinicius', '34567890123', '21988887777', '2024-01-10', 'Gerente de Vendas', 3),
('Juliana Costa', '45678901234', '31999996666', '2021-11-20', 'Recepcionista', 4),
('Pedro Rodrigues', '56789012345', '11977775555', '2023-06-05', 'Padeiro', 2),
('Camila Ribeiro', '67890123456', '19986664444', '2024-05-12', 'Atendente de Padaria', 2);
select * from funcionario;


INSERT INTO medico (cpf, crm, nome_medico, telefone, ativo) VALUES
('78901234567', '123456-SP', 'Dr. Roberto Mendes Silva', '11981234567', true),
('89012345678', '654321-SP', 'Dra. Camila Nogueira Ferreira', '19992345678', true),
('90123456789', '987654-RJ', 'Dr. Ricardo Vasconcelos Pinto', '21983456789', false);
select * from medico;


INSERT INTO exame (nome_exame, tipo, valor) VALUES
('Hemograma Completo', 'Laboratorial', 45.00),
('Audiometria Tonal', 'Ocupacional', 60.00),
('Acuidade Visual', 'Ocupacional', 35.00),
('Eletrocardiograma (ECG)', 'Cardiológico', 85.50),
('Raio-X de Tórax', 'Imagem', 110.00);
select * from exame;


INSERT INTO atendimento (descricao_atendimento, status_atendimento, data_termino, data_inicio, id_funcionario, id_medico) VALUES
('Exame admissional completo com avaliação clínica.', 'concluido', '2026-11-10 10:30:00', '2026-11-10 09:45:00', 1, 1),
('Exame periódico anual e verificação de pressão arterial.', 'cancelado', null, null, 2, 2),
('Avaliação médica de retorno ao trabalho após afastamento.', 'concluido', '2026-11-15 11:20:00', '2026-11-15 10:40:00', 3, 1),
('Atendimento clínico ocupacional em andamento.', 'andamento', null, '2026-11-18 17:30:00', 4, 2),
('Exame de mudança de função para cargo de coordenação.', 'nao_iniciado', null, null, 5, 1);
select * from atendimento;


INSERT INTO atendimento_exame (id_exame, id_atendimento, status_exame) VALUES
(3, 1, 'concluido'),
(1, 2, 'cancelado'),
(3, 2, 'cancelado'),
(4, 3, 'concluido'),
(5, 3, 'concluido'),
(1, 4, 'concluido'),
(2, 4, 'andamento'),
(1, 5, 'nao_iniciado'),
(4, 5, 'nao_iniciado'),
(2, 5, 'cancelado');
select * from atendimento_exame;