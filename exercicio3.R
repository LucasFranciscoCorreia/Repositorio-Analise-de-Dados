# Suponha que você tenha um vetor x <- 1:4 e y <- 2:3.
# O que é produzido pela expressão x * y?

x <- 1:4
y <- 2:3
x*y

# Dada a tabela no link abaixo que representa uma competição entre Maria e Joana, 
# determine quem foi a vencedora. Dica: primeiro padronize os dados e depois calcule
# a média dos valores padronizados.
# https://docs.google.com/drawings/d/1_szurYna3gDzTB3ht9AQlWChbq_KLcCMPNJ22J1ydZI/edit?usp=sharing

abdominais.maria <- 42
abdominais.joana <- 38
abdominais.media <- 30
abdominais.desviopadrao <- 6

salto.maria <- 102
salto.joana <- 173
salto.media <- 155
salto.desviopadrao <- 23

suspensao.maria <- 38
suspensao.joana <- 71
suspensao.media <- 50
suspensao.desviopadrao <- 8

correr.maria <- 
correr <- c(1829,274,2149,1554)
conhecimento <- c(75,12,97,70)

abdominais.n <- (abdominais - mean(abdominais))/sd(abdominais)
salto.n <- (salto - mean(salto))/sd(salto)
suspensao.n <- (suspensao - mean(suspensao))/sd(suspensao)
correr.n <- (correr - mean(correr))/sd(correr)
conhecimento.n <- (conhecimento - mean(conhecimento))/sd(conhecimento)

conhecimento.n + correr.n  +suspensao.n + salto.n  + abdominais.n 
# Para responder as questões abaixo, faça download do arquivo disponível em 
# https://www.dropbox.com/s/6t7b44acy7yfczu/vetor.RData?dl=1 e mova-o para o 
# seu diretório. Em seguida leia-o com o comando load(“vetor.RData”) . O vetor01 
# possui 15.000 observações referentes às notas dos candidatos do concurso público
# para auxiliar administrativo da Prefeitura de São Longuinho. Os dados foram 
# disponibilizados pela empresa organizadora do concurso. As notas variam de 0 a
# 10 e os candidatos que não realizaram a prova estão com NA nos respectivos campos.
# De posse dos dados, responda as perguntas abaixo.

load("vetor.RData")

# Qual foi a média das notas ?

mean(vetor01, na.rm = T)

# Qual foi a mediana das notas ?

median(vetor01, na.rm=T)

# Qual o desvio padrão das notas ?

sd(vetor01, na.rm=T)

# Qual foi a quantidade de faltosos ?

length(vetor01[is.na(vetor01)])

# Qual foi percentual de faltosos ? 

length(vetor01[is.na(vetor01)])/length(vetor01)

# Quantos candidatos obtiveram notas maiores do que 7.00 e menores do que 8.00 ?

length(vetor02[vetor02 > 7.0 & vetor02 < 8.0])

# Quantos candidatos obtiveram notas maiores do que 9.00 ou menores do que 1.00?

length(vetor02[vetor02 > 9.0 | vetor02 < 1.0])

# Quais os comandos removem os valores ausentes (NA) do vetor01 e guarda o resultado no próprio vetor01 ?

vetor02 <- vetor01[!is.na(vetor01)]
vetor01[!is.na(vetor01)] -> vetor02
vetor02 <- vetor01[-which(is.na(vetor01))]
