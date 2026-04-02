-- Lista de Contatos: Precisamos de uma lista com o nome de todos os pacientes 
-- e seus respectivos telefones, ordenados alfabeticamente.

select nome_paciente, telefone_paciente 
from paciente 
order by nome_paciente;

-- Faturamento Total: Qual o valor total arrecadado pela clínica até hoje?
select sum(valor_consulta)
from consulta c 

-- Agenda do Dia: Liste o nome do paciente, o nome do médico e a hora da consulta para todos os atendimentos. 
-- (Dica: Você precisará de 2 JOINs).
select nome_paciente, nome_medico, hora_consulta
from consulta c 
inner join medico m on c.fk_crm_medico = m.crm_medico 
inner join paciente p on c.fk_cpf_paciente = p.cpf_paciente

-- Pacientes Ausentes: Liste o nome de todos os pacientes cadastrados que ainda não realizaram nenhuma consulta. 
-- (Dica: Use LEFT JOIN e procure por NULL).
select nome_paciente, p.telefone_paciente
from paciente p
left join consulta c 
on p.cpf_paciente = c.fk_cpf_paciente
where c.data_consulta is null;

-- Especialidades Populares: Qual a especialidade médica que mais realizou consultas na clínica? 
SELECT m.especialidade_medico, COUNT(*) AS total_consultas
FROM medico m
INNER JOIN consulta c 
  ON c.fk_crm_medico = m.crm_medico
GROUP BY m.especialidade_medico
ORDER BY total_consultas DESC
LIMIT 1;
