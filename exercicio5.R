# Crie os vetores a seguir: ‘mouse.color' com os valores: ‘purple’, ‘red’, ‘yellow’,‘brown’;
# ‘mouse.weight’ com os valores 23, 21, 18, 26. Crie um data frame chamado de ‘mouse.info’ 
# com esses vetores, formando 4 linhas e 2 colunas. Nomeie a primeira coluna para ‘colour’ 
# e a segunda para ‘weight’. De posse desse data frame, responda as perguntas abaixo. 
# OBS.: Ao submeter o comando, retire todos os espaço em branco.

mouse.color <- c("purple", "red", "yellow", "brown")
mouse.weight <- c(23, 22, 18, 26)
mouse.info <- data.frame("Color" = mouse.color, "Weight" = mouse.weight, stringsAsFactors = F)

# Qual comando imprima a estrutura do data frame no console ?

str(mouse.info)

# Qual comando imprima apenas a linha 3 no console ?

mouse.info[3,]

# Qual comando imprima apenas a coluna 1 no console ?
mouse.info[, 1]

# Qual comando imprima o item na linha 4 da coluna 1 ? 
mouse.info[4,1]

# Para as questões abaixo use o dataset airquality já incluído no RStudio.

# Qual foi o valor mínimo de ozônio no mês de maio ?
list <- airquality[complete.cases(airquality),]
list <- list[list$Month==5,]
min(list$Ozone)

# Extraia o subconjunto do data frame em que os valores de Ozônio estão acima
# de 25 e os valores da temperatura (Temp) estão abaixo de 90. Qual é a média
# do Solar.R nesse subconjunto? 

list <- airquality[airquality$Ozone > 25 & airquality$Temp < 90,]
list <- list[complete.cases(list),]
mean(list$Solar.R, na.rm = T)

# Qual a quantidade de casos completos no dataset airquality ? Ou seja, a 
# quantidade de observação (linhas) sem NAs.








