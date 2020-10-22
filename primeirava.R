install.packages("tidyr")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("AER")
install.packages("readr")

library("tidyr")
library("dplyr")
library("ggplot2")
library("AER")
library("readr")

# Um alquimista tem um vetor de string com nomes de substâncias (palavras mágicas) 
# e um número após o nome que representa uma proporção em percentagem (‘%’): 
# strg <- c("Voda 30", "bylinky 25", "ZEM 23", "zlAto 22"). Em apenas uma linha de 
# comando, usando as funções tolower() e paste(), escreva um código que deixe todas
# as palavras em letras minúsculas e com o sinal ‘%’ após o número. Note que não pode
# haver espaço entre o número e a unidade de medida. Além disso, remova todos os espaços
# em branco do comando antes de submeter o mesmo. 
strg <- c("Voda 30", "bylinky 25", "ZEM 23", "zlAto 22")

paste(tolower(strg), "%", sep="")

# Qual(is) da(s) opçao(ões) abaixo correspondem a regexp "^([0-9][[:punct:]][a-z])"
grep(pattern="^([0-9][[:punct:]][a-z])", c("5!eAZ", "!6!rrrrDFGT", "R99Tf34!RR", "123?aSd"), value=T)

# Carregue o arquivo de texto que contém um trecho do romance “Gambler” de Fyodor 
# Dostoyevsky. Após isso, submeta quantos caracteres tem nesse texto. Mas note que 
# é importante importar o arquivo de texto como uma string de caractere única. Para 
# isso use "read_file" do pacote "readr".
Gambler <- read_file("gambler.txt")
nchar(Gambler)

# Submeta a regex que extrai todos os domínios que começam com http ou https do vetor
# a seguir: c ("www.dogman.com", "http://rotterdam.com", "https://facebook.com", "httpx://sims.com")
domain <- c("www.dogman.com", "http://rotterdam.com", "https://facebook.com", "httpx://sims.com", "fungame.http")
domain[grep(pattern = "https?:", domain)]

# Escreva uma função chamada 'ranqueamento' que gera o ranqueamento do dataset Forbes2000 
# de acordo com o valor de mercado (marketvalue). Esse ranqueamento pode ser tanto por 
# categoria quanto geral. A função 'ranqueamento ' recebe três argumentos: 'ranque', 
# 'categoria' e 'opcao'. Se a 'opcao' 1 for escolhida, o ranqueamento geral deverá ser 
# feito. Por outro lado, se a 'opcao' 2 for escolhida, o ranqueamento por categoria deverá
# ser realizado. Dado esses argumentos, a função retorna o nome da empresa, a categoria e 
# o ranque. O protótipo dessa função é:  
# ranqueamento  <- function( ranque,  categoria=NULL, opcao){}. Adicionalmente, se o raking
# ou a categoria não existir uma mensagem de erro deverá ser apresentada. De posse dessa função,
# responda as questões abaixo.
ds <- read.csv("Forbes2000_V2.csv")
ds <- ds[,2:8]
ranqueamento <- function(ranque, categoria=NULL, opcao){
  switch(opcao, 
         arrange(ds, desc(ds$marketvalue))[ranque,],
         filter(arrange(ds, desc(ds$marketvalue)), arrange(ds, desc(ds$marketvalue))$category %in% categoria)[ranque,]
         )
}
ranqueamento(ranque=1,categoria="Conglomerates", opcao=2)

# Qual o nome da empresa do seguinte código ranqueamento(ranque=1234, opcao=1) ?
ranqueamento(ranque=1234, opcao=1)

# Qual a categoria da empresa do seguinte código ?ranqueamento(ranque=198, opcao=1)
ranqueamento(ranque=198, opcao=1)

# Qual o nome da empresa do seguinte código ?
#ranqueamento(ranque=45, categoria="Technology hardware & equipment", opcao=2) 
ranqueamento(ranque=45, categoria="Technology hardware & equipment", opcao=2) 

# Qual o nome da empresa do seguinte código ranqueamento(ranque=7, categoria="Bancos", opcao=2) 
ranqueamento(ranque=7, categoria="Bancos", opcao=2) 

# Verifique o dataset diamonds que pode ser encontrado no pacote ggplot2. Você pode 
# obter uma descrição dos dados digitando ?diamonds ou help(diamonds) no console. 
# Note que para visualizar os dados você precisa instalar e carregar o pacote ggplot2. 
# Também carregue o pacote dplyr. Após isso, responda as perguntas abaixo.

diamonds <- diamonds
diamonds$cut <- as.character(diamonds$cut)

# Qual o preço médio (price) dos diamantes cujo o corte (cut) é "Very Good"
# e o quilate (carat) é maior que 0.7.
mean(filter(diamonds, diamonds$cut=="Very Good")$price, na.rm = T)

# Qual a cor (color ) do diamante que possui o menor preço (price) com mais de 0.5 quilates (carat)
ds <- filter(diamonds, diamonds$carat > 0.5)
ds <- arrange(ds, ds$price)
head(ds)

# Qual a proporção de Diamantes cujo o corte (cut) é "Premium" ?
premium = diamonds %>% filter(diamonds$cut=="Premium")
count(premium)/count(diamonds)

# Instale e carregue o pacote AER e execute o comando data("Fertility") que 
# carregará o dataset Fertility no seu RStudio. Esse dataset apresenta informações
# do censo americano de 1980 de mulheres casadas entre 21 e 35 anos com dois ou mais 
# filhos. Resolva as questões abaixo. No entanto, primeiro verifique o dataset
# Fertility digitando "?Fertility" ou "help(Fertility)" no console.
data("Fertility")

# Digite o código que seleciona as linhas de 35 a 50 das variáveis idade (age) e
# trabalho (work). Remova todos os espaços em branco, não altere o nome do dataset
# e use o dplyr.
slice(select(Fertility, age, work), c(35:50))

# Qual a proporção de mulheres passaram a ter um terceiro filho (morekids) com
# mais de 30 semanas trabalhadas (work)?

ds <- Fertility %>% filter(morekids=="yes", work >30)
count(ds)/count(Fertility)

# Filtre o subconjunto de mulheres entre 22 e 24 anos e determine à proporção que
# tiveram menino como primogênito (gender1). Note que 22 e 24 deve ser incluído.

ds <- Fertility %>% filter(age >= 22, age <= 24)
ds2 <- ds %>% filter(gender1=="male")
count(ds2)/count(ds)

# Faça o download dos arquivos de dados Catfish.csv e Treatment.csv do Google 
# classroom e importe-os para o R. Catfish.csv contém medições de peso (variáveis
# de março e abril) de duas espécies de bagres que são comumente usadas na aquicultura.
# Ambas as espécies foram criadas sob diferentes tratamentos de temperatura e alimentos,
# os quais são especificados em Treatment.csv. Obtenha uma visão geral da estrutura dos
# dados usando as funções str () e head (). Após isso, realize os seguintes tratamentos: 
# (a) converta o dataframe do arquivo Catfish.csv em um formato longo, de modo que as 
# medições de peso para março e abril sejam combinadas em uma coluna denominada Weight. 
# (b) Una as colunas Genus e Species em uma variável chamada Species. O resultado deve 
# ficar assim: Silirus.glanis. (c) faça a combinação dos dados de Treatment.csv e 
# Catfish.csv e salve o objeto resultante numa variável chamada de Catfish_Treatment. 
# A mesclarem deve ser feita através da coluna Tank. Em posse do novo Catfish_Treatment, 
# responda as perguntas abaixo.
Catfish <- read.csv("Catfish.csv")
Treatment <- read.csv("Treatment.csv")

df <- merge(x=Catfish, y=Treatment, by.x = "Tank", by.y = "Tank")

df <- mutate(df,Weight=March+April)

Catfish_Treatment <- mutate(df, Species=paste(Genus, ".", Species, ".", sep = ""))



# Qual o peso médio dos bagres do sexo masculino considerando o mês de Abril e o tratamento 2? 
ds <- Catfish_Treatment %>% filter(Sex=="Male", Food=="Treatment2")
mean(ds$April)

# Use a função "ifelse" para adicionar os elementos de uma nova coluna chamada de 
# "AcimaMedia" ao dataset Catfish_Treatment. Essa coluna, que deve ser adicionada ao
# data frame, é uma coluna lógica, indicando "V" se o peso do bagre é maior que a 
# média dos pesos. Caos contrário, atribua "F". Note que você deve tirar todos os
# espaços em branco e a coluna "AcimaMedia" deve ser atribuída ao data frame através
# do operador "$". Além disso, as colunas do data frame devem ser acessadas pelo nome
# e usem aspas simples. 
Catfish_Treatment$AcimaMedia <- ifelse(Catfish_Treatment$Weight>mean(Catfish_Treatment$Weight), "V", "F")
Catfish_Treatment %>%
  group_by(Tank)%>%
  summarise(
    AcimaMedia = sum(AcimaMedia=="V"))

# Com base na coluna que foi adicionada na questão anterior, responda: Qual tank 
# possui mais bagres com o peso acima da média?

ds <- Catfish_Treatment %>% filter(AcimaMedia =="V")
summary(ds)

# Dada a tabela no link abaixo que representa uma competição entre Maria, Teresa, 
# Francisca e Joaquina, determine quem foi a vencedora. 
# https://docs.google.com/drawings/d/1-8biPvM3H8RaFFgLWttnnCuntSZ8lyKz8zvodemd5XY/edit?usp=sharing *

mean <- c(30, 155, 50, 1829, 75)
sd <- c(6, 23, 8, 274, 12)
maria <- c(42, 70, 40, 1500, 97)        
teresa <- 
abdominais <-c(42,38,50,40)

sd_salto <- 23
salto <-c(70,173,150,140)

sd_suspensao <- 8
suspensao <- c(40,71,40,80)

sd_correr <- 274
correr <- c(1500,1554,1900,2093)

sd_conhecimento <- 12
conhecimento <- c(97,70,40,100)

abdominais.n <- (abdominais - mean_abdominais)/sd_abdominais
salto.n <- (salto - mean_salto)/sd_salto
suspensao.n <- (suspensao - mean_suspensao)/sd_suspensao
correr.n <- (correr - mean_correr)/sd_correr
conhecimento.n <- (conhecimento - mean_conhecimento)/sd_conhecimento
conhecimento.n + correr.n  +suspensao.n + salto.n  + abdominais.n 






