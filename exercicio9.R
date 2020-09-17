# Carregue o dataset do link abaixo. Esse dataset contém informações do peso do coração e corporal de 97 gatos adultos que
# foram usados para experimentos com a droga "digitalis". Com posse desses dados responda as perguntas abaixo. Qual foi a 
# média do peso dos gatos (Bwt) ? https://www.dropbox.com/s/w4xv9urbowbig3s/catsM.csv?dl=0 

ds <- as.data.frame(read.csv("catsM.csv"))
mean(ds$Bwt)

# Para as questões abaixo considere o dataset "Caracol_data_checked.csv". Note que para você obter esse dataset você precisa 
# executar todos os passos apresentado na aula de Manipulação Básica.
fileURL <- "https://dropbox.com/s/c6nhu4v7yq9pyto/Snail_feeding.csv?dl=1"
download.file(fileURL, destfile = "Snail_feeding.csv")
ds <- as.data.frame(read.csv("Snail_feeding.csv"))

ds <- ds[, 1:7]
levels(ds$Sex)[2] <- "female"
levels(ds$Sex)[3] <- "male"
levels(ds$Sex)[3] <- "male"

ds$Distance <- as.character(ds$Distance)
ds$Distance <-as.numeric(ds$Distance)

ds[682, "Distance"] <- 0.58
ds[755, "Distance"] <- 0.356452

index <- which(duplicated(ds))
ds <- ds[-index]

ds[8, 6] <- 1.62

# Qual a média da profundidade (depth) dos caracóis marinhos
mean(ds$Depth)

# Qual foi a maior distância coletada para o Caracol Marinho Pequeno e Feminino ?
list <- ds[ds$Size=="small" & ds$Sex=="female",]
max(list$Distance)

# Para as questões abaixo carregue os dados do dataset Sparrows.csv.
download.file("https://ucd7f6ef4a7ad86a98595a4e0b8b.dl.dropboxusercontent.com/cd/0/get/A_luLitfZU7SN_j-Ko3JBfC24cGN2XUHSxcyoFVhA8PJhx25MyI_5AWvNRrnxnLGxM_69gY-oxrdeCRgFERF4lSat7oo1rRewlJdgzgl1-GxEA/file?_download_id=829430997891748241574722777370177945990359453940909443682452418423&_notify_domain=www.dropbox.com&dl=1", destfile = "sparrow.csv")
sparrow <- read.csv("sparrow.csv")
levels(sparrow$Sex)[1] <- "Female"
levels(sparrow$Sex)[2] <- "Female"
levels(sparrow$Sex)[3] <- "Male"

# O arquivo de dados Sparrows.csv contém medidas de asa, tarso, cabeça e bico de duas espécies de pardal. 
# Use read.table(file = "Sparrows.csv", header = TRUE) para carregar os dados para um objeto chamado Sparrows. 
# Depois, use a função View () para exibir os dados. Note que algo deu errado! Todas as variáveis foram combinadas
# em uma grande coluna. Qual foi o problema ?
sparrow <- read.table(file = "sparrow.csv", header = TRUE, sep = ",")
View(sparrow)

# Qual o tamanho mínimo e máximo da cabeça da especie "SSTS" ? *
list <- sparrow[sparrow$Species=="SSTS",]
min(list$Head)
max(list$Head)

# Durante a entrada de dados, três linhas foram inseridas duas vezes. Quais são essas linhas duplicadas?
which(duplicated(sparrow))

# Exiba os níveis do fator Sex. Veja que os níveis estão bagunçados. Altere de modo que a variável sexo 
# contenha apenas os níveis "Male" e "Female". Por exemplo, "Femal" deve ser "Female". Após isso, determine 
# qual é a media do tarso dos pardais femininos e masculinos.
mean(sparrow[sparrow$Sex=="Male",]$Tarsus)
mean(sparrow[sparrow$Sex=="Female",]$Tarsus)

# Digite o comando que verifica quais linhas na variável Wing contém NAs. Use a função which. OBS.: Remova todos os espaços em branco. 
which(is.na(sparrow$Wing))

# Substitua todos os NAs da questão anterior pelos valores 59, 56.5 e 57 (nessa ordem). Qual a média das asas dos pardais ?
sparrow$Wing[64] <- 59
sparrow$Wing[250] <- 56.5
sparrow$Wing[806] <- 57

mean(sparrow$Wing)

# Qual o comando ordena o data frame pelas colunas Wing e Head e crie um novo objeto chamado de Sparrows_Ordenado ?
Sparrows_Ordenado <- sparrow[order(sparrow$Wing, sparrow$Head),]












