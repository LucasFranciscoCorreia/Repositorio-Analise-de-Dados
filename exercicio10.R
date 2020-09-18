# Instale e carregue o pacote dplyr. Em seguida use o seguinte comando para carregar os dados que irá trabalhar: 
# df=data.frame(Theoph). Note que Wt: é o peso do sujeito (kg); Dose: é a dose de teofilina administrada por via 
# oral ao indivíduo (mg / kg); Time: é o tempo desde a administração do medicamento quando a amostra foi coletada 
# (h); e conc: é concentração de teofilina na amostra(mg / L). Responda as questões abaixo usando exclusivamente o 
# pacote dplyr. Note que ao submeter a resposta remova todos os espaços em branco. Também use um dos padrões a seguir:
# filter(dataset,<<>>) ou dataset%>%filter(<<>>).
install.packages("dplyr")
library("dplyr")
df=data.frame(Theoph)

# Qual o comando seleciona apenas a coluna Dose de df ?
select(df, Dose)

# Qual o comando apresenta os dados para as doses maiores que 5 mg/kg ? 
filter(df, Dose>5)

# Qual o comando seleciona as linhas de 10-20 ?Dica: use o "slice".
slice(df, 10:20)

# Qual comando apresenta os dados para as doses maiores que 5 e cujo o tempo desde a administração do medicamento (Time)
# é maior que a média do mesmo? Use apenas um único comando. 

filter(df, Dose > 5, Time > mean(Time))
mean(df$Time)

# Qual comando organizar df por peso (decrescente) ?
arrange(df, desc(Wt))

# Qual comando organizar df por peso (crescente) e tempo (decrescente) ? 
arrange(df, Wt, desc(Time))

# Qual comando cria uma nova coluna chamada "tendencia" que é igual à Time-mean(Time)?
mutate(df, tendencia = Time-mean(Time))

# Qual comando apresenta a maior concentração de teofilina ? Não use nenhum nome para a coluna resultante
select(filter(df, conc==max(conc)), conc)

# Para os exercícios abaixo, usaremos dois conjuntos de dados relacionados aos tempos de atraso de vôos do Bureau of 
# Transportation Statistics dos EUA (X673598238_T_ONTIME_REPORTING e L_UNIQUE_CARRIERS.csv_). Para carregar os dados 
# é importante que vocês usem os seguintes argumentos: quote="\"", sep = "," . Note que a extensão ".csv_" está correta.
# O data frame do arquivo (X673598238_T_ONTIME_REPORTING)  possui apenas informações da companhia aérea por código. No 
# entanto, queremos saber os nomes das companhias aéreas. Assim, faça o merge dos datasets "X673598238_T_ONTIME_REPORTING" 
# e "L_UNIQUE_CARRIERS.csv_" através das colunas "OP_UNIQUE_CARRIER" e "Code". Em seguida, responda as questões abaixo.

download.file("https://uc79c23a10fc7cf332317eef1a53.dl.dropboxusercontent.com/cd/0/get/A_ndf-onc3WhW9AIqC8sdiajzBB8yB4P0l7jVcnZ2Ei1bWkyx0RTh_NIpfnKO0yQcdUyC8Jc7PxxVvHSFbl_szlub2WsEsrN3M9nxj5jFAvmzw/file?_download_id=484065415366092438607039657581199856982107313519119957052097774&_notify_domain=www.dropbox.com&dl=1", destfile = "673598238_T_ONTIME_REPORTING.csv")
download.file("https://uc32ca2a12e092106cf558013f30.dl.dropboxusercontent.com/cd/0/get/A_mEK_GeYD619IVQcloSk3L3kh_R_oTdNzg16_dxUvuxEQPcSoN9SYRdvx4lX3ONg50mJnSPACJJeW9JXFi8PTrHS_ObOBOpYMrQ0IcsiXieqA/file?_download_id=264177915856895303001032561300176516741638576063596567683840783247&_notify_domain=www.dropbox.com&dl=1", destfile = "L_UNIQUE_CARRIERS.csv_")
df1 <- read.csv("673598238_T_ONTIME_REPORTING.csv", quote = "\"", sep=",")
df2 <- read.csv("L_UNIQUE_CARRIERS.csv_", quote = "\"", sep=",")

install.packages("tidyr")
library("tidyr")

df3 <- merge(df1, df2, by.x = "OP_UNIQUE_CARRIER", by.y= "Code")

# Qual companhia teve o maior atraso ? 
select(filter(df3, DEP_DELAY_NEW == max(DEP_DELAY_NEW, na.rm = T)),Description)

# Qual companhia atrasa mais na média ?
filter(df3 %>% group_by(Description) %>% summarise(DEP_DELAY_NEW = mean(DEP_DELAY_NEW, na.rm = T)),DEP_DELAY_NEW==max(DEP_DELAY_NEW))

# Qual companhia atrasa menos na média ?
filter(df3 %>% group_by(Description) %>% summarise(DEP_DELAY_NEW = mean(DEP_DELAY_NEW, na.rm = T)),DEP_DELAY_NEW==min(DEP_DELAY_NEW))

# Qual companhia teve a maior proporção de atrasos ?
filter(df3 %>% group_by(Description) %>% summarise(DEP_DELAY_NEW = sum(DEP_DELAY_NEW, na.rm = T)/sum(df3$DEP_DELAY_NEW, na.rm = T)),DEP_DELAY_NEW==max(DEP_DELAY_NEW))

# Você está encarregado de analisar um conjunto de dados que contém casos de tuberculose (TB) relatados entre 1995 e 2013, 
# ordenados por país, idade e sexo. O recurso mais exclusivo desses dados é o seu sistema de codificação. As colunas de três
# a vinte e três codificam quatro partes separadas de informações em seus nomes de coluna: (i) As três primeiras letras de 
# cada coluna indicam se a coluna contém casos novos ou antigos de TB. (ii) As próximas duas letras descrevem os tipos de 
# casos que estão sendo contados. (iii) A sexta letra descreve o sexo dos pacientes com tuberculose. Os números restantes 
# descrevem a faixa etária dos pacientes com TB. Carregue o conjunto de dados de http://stat405.had.co.nz/data/tb.csv como 
# um novo dataframe chamado TB. Observe que o conjunto de dados TB é desordenado de várias maneiras. Primeiramente, mova os
# valores das colunas 3 até 23 para uma única coluna chamada de “Informacao”. Dica use o gather (). Divida os conteúdos da 
# variável “informacao” em cada sublinhado(”_”). Dica use o separate () e chame as colunas resultantes de "caso", "tipo” e
# "sexofaixa”. Por fim, divida a variável que contém o sexo e a faixa etária ("sexofaixa”) de modo a criar uma coluna de 
# "sexo" e uma coluna de "faixa". De posse do data frame resultante, responda as questões abaixo.

TB <- read.csv("http://stat405.had.co.nz/data/tb.csv")
TB <- TB %>% gather(key="informação", value="valor", -c(1:2))
TB <- TB %>% separate(col="informação", into=c("caso","tipo","sexofaixa"), sep="_")
TB <- TB %>% separate(col="sexofaixa", into=c("sexo","faixa"), sep=1)

# Qual foi a quantidade de casos para a Tailândia (TH) de pessoas do sexo Masculino?
sum((TB %>% filter(iso2=="TH", sexo=="m"))$valor, na.rm = T)

# Qual a proporção de casos para os estados unidos (US) ? Não considerar valores NAs
sum((TB %>% filter(iso2=="US"))$valor, na.rm = T)/sum(TB$valor, na.rm = T)

# Qual a quantidade de casos para a faixa etária 2534 do sexo feminino?
sum((TB %>% filter(sexo=="f", faixa=="2534"))$valor, na.rm = T)

# Qual foi a quantidade de casos para a década de 2000 ? A década de 2000, também referida como anos 2000, 
# compreende o período de tempo entre 1 de janeiro de 2000 e 31 de dezembro de 2009.
sum((TB %>% filter(year %in% c(2000:2009)))$valor, na.rm = T)


























