# Qual o resultado da função abaixo. 
y <- 5
mult <- function(x, y){
  return (x*y)
}
mult(10)

# Qual o resultado da função abaixo. 
y <- 5
mult <- function(x){
  return (x*y)
}
mult(10)

# Escreva uma função chamada 'prisoes' que calcula a soma das prisões
# em estados americanos do dataset USArrests. A função 'prisoes' recebe
# dois argumentos: 'estados' e 'tiposPrisoes'. Dado esses argumentos, a
# função retorna o total de prisões. Se não existir nem o estado ou o tipo
# de prisão, então uma mensagem de erro deve ser retornada. O protótipo dessa
# função é: prisoes <- function(estados, tiposPrisoes){}. As seguintes mensagens
# precisam ser apresentadas caso o estado ou o tipo de prisão estejam inválidos:
# "Estado Inválido" ou "Tipo de Prisão Inválida". De posse dessa função, responda
# as questões abaixo.

prisoes <- function(estados, tiposPrisoes){
  sum(USArrests[estados, tiposPrisoes])
}

prisoes(estados="Oregon", tiposPrisoes = c("Rape", "Murder"))
prisoes(estados=c("Nevada", "Washington"),tiposPrisoes = c("UrbanPop", "Assault"))
prisoes(estados="Pernambuco", tiposPrisoes = c("Rape","Murder"))

# Qual é o total de prisões do código a seguir? 
prisoes(estados="Tennessee", tiposPrisoes=c("Rape","Murder"))

# Qual é o total de prisões do código a seguir? 
prisoes(estados=c("California ","Miami", "Arizona"), tiposPrisoes=("Assault"))

# Qual é o total de prisões do código a seguir? 
prisoes(estados=c("Pennsylvania","Mississippi", "Nebraska"), tiposPrisoes=c("Rape","UrbanPop","Assault"))

# Qual é o total de prisões do código a seguir? 
prisoes(estados=c("Vermont","Wisconsin", "Texas"), tiposPrisoes=c("Rape","Assalto"))

# Para responder as questões abaixo ver o documento " Detalhamento de Questões". Mais especificamente, Questão 'minhasNotas_1'.
minhasNotas_1 <- function(Exe_1=0, VA_1=0, Exe_2=0, Proj=0, VA_2=0, VA_3=0, Opt=1, threshold=7){
  Exe_1[is.na(Exe_1)] <- 0
  Exe_2[is.na(Exe_2)] <- 0
  VA_1[is.na(VA_1)] <- 0
  VA_2[is.na(VA_2)] <- 0
  VA_3[is.na(VA_3)] <- 0
  Proj[is.na(Proj)] <- 0
  va1 <- mean(Exe_1)*0.5+VA_1*0.5
  va2 <- mean(Exe_2)*0.2+ Proj*0.5+VA_2*0.3
  va3 <- VA_3
  grades = c(va1, va2, va3)
  range = seq(0, 10, by=0.1)
  switch(Opt,
         va1,
         va2,
         (max(grades)+max(grades[grades != max(grades)]))/2
  )
}
minhasNotas_1(Exe_1 = c(10, 7, NA), VA_1=7)
minhasNotas_1(Exe_2=c(7, 9, 10), Proj=7, VA_2=7, Opt=2)

# Qual o retorno da seguinte função? 
minhasNotas_1(Exe_1=c(10,9,5,1,5,10), VA_1=8, Exe_2=7, Proj=7, VA_2=7, VA_3=10, Opt=1, threshold=7)

#Qual o retorno da seguinte função? 
minhasNotas_1(Exe_1=NA, VA_1=8, Exe_2=c(10,1,5), Proj=10, VA_2=8, VA_3=10, Opt=2, threshold=8)

#Qual o retorno da seguinte função? 
minhasNotas_1(Exe_1=c(10,9,7,1,NA,NA), VA_1=NA, Exe_2=7, Proj=7, VA_2=7, VA_3=10, Opt=1, threshold=7)

# Qual o retorno da seguinte função? 
minhasNotas_1(Exe_1=NA, VA_1=8, Exe_2=NA, Proj=10, VA_2=8, VA_3=10, Opt=2, threshold=8)

# Qual o retorno da seguinte função? 
minhasNotas_1(Exe_1=c(5,8), VA_1=8, Exe_2=c(10,1,5), Proj=10, VA_2=8, VA_3=2, Opt=3, threshold=8)

# Qual o retorno da seguinte função?
minhasNotas_1(Exe_1=NA, VA_1=8, Exe_2=c(10,1,5), Proj=10, VA_2=8, VA_3=10, Opt=3, threshold=8)

# Qual o retorno da seguinte função? 
minhasNotas_1(Exe_1=c(5,8), VA_1=8, Exe_2=c(10,1,5), Proj=c(2,4), VA_2=8, VA_3=2, Opt=3, threshold=8)

# Qual o retorno da seguinte função? 
minhasNotas_1(Exe_1=10, VA_1=NA, Exe_2=7, Proj=7, VA_2=7, VA_3=10, Opt=1, threshold=7)


minhasNotas_2 <- function(Exe_1=0, VA_1=0, Exe_2=0, Proj=0, VA_2=0, VA_3=0, Opt=1,threshold="C"){
  Exe_1[is.na(Exe_1)] <- 0
  Exe_2[is.na(Exe_2)] <- 0
  VA_1[is.na(VA_1)] <- 0
  VA_2[is.na(VA_2)] <- 0
  VA_3[is.na(VA_3)] <- 0
  Proj[is.na(Proj)] <- 0
  va1 <- mean(Exe_1)*0.5+VA_1*0.5
  va2 <- mean(Exe_2)*0.2+ Proj*0.5+VA_2*0.3
  va3 <- VA_3
  grades = c(va1, va2, va3)
  range = seq(0, 10, by=0.1)
  result = switch(Opt,
         va1,
         va2,
         (max(grades)+max(grades[grades != max(grades)]))/2
  )
  if(result %in% seq(0, 5.9, by=0.1)) return("D")
  else if(result %in% seq(6, 7.4, by=0.1)) return ("C")
  else if(result %in% seq(7.5, 8.9, by=0.1)) return("B")
  else if(result %in% seq(9, 10, by=0.1)) return("A")
  else return(result)
}

# Qual o retorno da seguinte função? 
minhasNotas_2(Exe_1=c(8,9,NA), VA_1=5, Exe_2=9, Proj=5, VA_2=4, VA_3=1, Opt=1, threshold="C") 

# Qual o retorno da seguinte função? 
minhasNotas_2(Exe_1=c(8,9,10,9,9,8,6), VA_1=4, Exe_2=c(8,3,11,9,9,5), Proj=4, VA_2=4, VA_3=1, Opt=1, threshold="C")

# Qual o retorno da seguinte função?
minhasNotas_2(Exe_1=c(8,9,10,9,9,8,6), VA_1=7, Exe_2=c(8,3,10,9,9,5), Proj=8, VA_2=3, VA_3=1, Opt=3, threshold="B")

# Qual o retorno da seguinte função? 
minhasNotas_2(Exe_1=c(8,9,10,9,9,8,6), VA_1=7, Exe_2=c(8,3,10,9,9,5), Proj=8, VA_2=8, VA_3=1, Opt=2, threshold="B") 

# Qual o retorno da seguinte função? 
minhasNotas_2(Exe_1=c(8,9,10,9,9,8,6), VA_1=7, Exe_2=c(8,3,10,9,9,5), Proj=5, VA_2=5, VA_3=10, Opt=4, threshold="B")
