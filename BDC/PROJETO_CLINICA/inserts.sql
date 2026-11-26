INSERT INTO EMPRESA (telefone, cnpj, nome_empresa, razao_social, ativo) VALUES
('19987654321', '12345678000190', 'MetalTech', 'MetalTech Industrial LTDA', true),
('19976543210', '23456789000181', 'AutoParts', 'AutoParts Componentes Automotivos LTDA', true),
('19965432109', '34567890000172', 'ConstruMax', 'ConstruMax Engenharia e Construcoes LTDA', true),
('19954321098', '45678901000163', 'LogiBrasil', 'LogiBrasil Transportes LTDA', false);

INSERT INTO FUNCIONARIO (nome_funcionario, cpf, telefone, data_admissao, cargo, id_empresa) VALUES
('Rafael Henrique', '10000000001', '19981000001', '2022-03-15', 'Operador de Maquinas', 1),
('Beatriz Oliveira', '10000000002', '19981000002', '2023-08-01', 'Analista Administrativo', 1),
('Lucas Almeida', '10000000003', '19981000003', '2021-05-12', 'Soldador', 1),
('Mariana Costa', '10000000004', '19981000004', '2024-01-10', 'Auxiliar de Producao', 1),
('Gabriel Santos', '10000000005', '19981000005', '2020-06-20', 'Mecanico Industrial', 2),
('Juliana Ferreira', '10000000006', '19981000006', '2023-02-13', 'Supervisora de Producao', 2),
('Pedro Martins', '10000000007', '19981000007', '2024-04-18', 'Operador de Empilhadeira', 2),
('Camila Rodrigues', '10000000008', '19981000008', '2022-09-05', 'Inspetora de Qualidade', 2),
('Bruno Ribeiro', '10000000009', '19981000009', '2021-07-22', 'Pedreiro', 3),
('Fernanda Lima', '10000000010', '19981000010', '2023-11-08', 'Engenheira Civil', 3),
('Matheus Gomes', '10000000011', '19981000011', '2025-01-15', 'Eletricista', 3),
('Amanda Souza', '10000000012', '19981000012', '2024-06-03', 'Tecnica de Seguranca do Trabalho', 3),
('Diego Pereira', '10000000013', '19981000013', '2020-10-19', 'Motorista', 4),
('Felipe Barbosa', '10000000015', '19981000015', '2023-05-25', 'Conferente', 4);

INSERT INTO EXAME(nome_exame, tipo, valor) VALUES
('Avaliacao Clinica Ocupacional', 'Clinico', 90.00),
('Audiometria Tonal', 'Audiologico', 75.00),
('Espirometria', 'Pulmonar', 110.00),
('Acuidade Visual', 'Oftalmologico', 45.00),
('Hemograma Completo', 'Laboratorial', 55.00),
('Glicemia em Jejum', 'Laboratorial', 30.00),
('Eletrocardiograma', 'Cardiologico', 120.00),
('Eletroencefalograma', 'Neurologico', 180.00),
('Radiografia de Torax', 'Imagem', 150.00),
('Exame Toxicologico', 'Laboratorial', 220.00),
('Avaliacao Psicossocial', 'Psicologico', 160.00),
('Exame de Urina', 'Laboratorial', 35.00),
('Colesterol Total e Fracoes', 'Laboratorial', 65.00),
('Teste de Visao de Cores', 'Oftalmologico', 50.00);

INSERT INTO MEDICO (cpf, crm, nome_medico, telefone, ativo) VALUES
('20000000001', 'SP100001', 'Ricardo Mendes', '19982000001', true),
('20000000002', 'SP100002', 'Patricia Almeida', '19982000002', true),
('20000000003', 'SP100003', 'Eduardo Ribeiro', '19982000003', true),
('20000000004', 'SP100004', 'Renata Carvalho', '19982000004', true),
('20000000005', 'SP100005', 'Marcelo Fernandes', '19982000005', true),
('20000000006', 'SP100006', 'Cristina Martins', '19982000006', true),
('20000000007', 'SP100007', 'Andre Moreira', '19982000007', true),
('20000000008', 'SP100008', 'Daniela Gomes', '19982000008', true),
('20000000009', 'SP100009', 'Roberto Azevedo', '19982000009', false),
('20000000010', 'SP100010', 'Luciana Cardoso', '19982000010', false);

INSERT INTO ATENDIMENTO (descricao_atendimento, status_atendimento, data_inicio, data_termino, id_funcionario, id_medico) VALUES
('Atendimento periodico de operador de maquinas', 'concluido', '2026-11-03 08:00:00', '2026-11-03 08:45:00', 1, 1),
('Avaliacao ocupacional periodica', 'concluido', '2026-11-03 09:00:00', '2026-11-03 09:30:00', 2, 1),
('Avaliacao de exposicao a ruido ocupacional', 'concluido', '2026-11-04 10:00:00', '2026-11-04 11:00:00', 3, 2),
('Atendimento de retorno ao trabalho', 'concluido', '2026-11-05 08:30:00', '2026-11-05 09:15:00', 4, 3),
('Avaliacao periodica de mecanico industrial', 'concluido', '2026-11-06 13:00:00', '2026-11-06 14:00:00', 5, 4),
('Atendimento para mudanca de riscos ocupacionais', 'concluido', '2026-11-09 09:00:00', '2026-11-09 10:00:00', 6, 5),
('Avaliacao ocupacional para operacao de empilhadeira', 'andamento', '2026-11-26 08:00:00', NULL, 7, 6),
('Atendimento periodico de qualidade', 'andamento', '2026-11-26 08:30:00', NULL, 8, 7),
('Avaliacao de saude na construcao civil', 'nao_iniciado', NULL, NULL, 9, 8),
('Atendimento ocupacional periodico', 'nao_iniciado', NULL, NULL, 10, 2),
('Avaliacao para trabalho em altura', 'nao_iniciado', NULL, NULL, 11, 3),
('Atendimento preventivo de saude ocupacional', 'cancelado', NULL, NULL, 12, 4),
('Atendimento demissional de motorista', 'concluido', '2026-11-20 14:00:00', '2026-11-20 15:00:00', 13, 5),
('Atendimento demissional de auxiliar de logistica', 'cancelado', NULL, NULL, 8, 6),
('Avaliacao complementar de saude ocupacional', 'nao_iniciado', NULL, NULL, 1, 7);

INSERT INTO ATENDIMENTO_EXAME (id_exame, id_atendimento, status_exame) VALUES
(1, 1, 'concluido'),
(2, 1, 'concluido'),
(4, 2, 'concluido'),
(2, 3, 'concluido'),
(14, 4, 'concluido'),
(1, 5, 'concluido'),
(7, 5, 'concluido'),
(11, 6, 'concluido'),
(4, 7, 'andamento'),
(5, 8, 'andamento'),
(9, 9, 'nao_iniciado'),
(11, 11, 'nao_iniciado'),
(10, 13, 'concluido');