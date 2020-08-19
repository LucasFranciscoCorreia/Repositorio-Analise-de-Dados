# Dado que temos a seguinte soma: 10^2 + 11^2 + ... + 20^2, 
# qual a expressão correspondente em R. *

r <- (10:20)^2
r <- sum((10:20)^2)

# Atribua o valor 133 para X e o valor 36 para Y. 
# Em sequência, adicione a soma de X e Y a Z. 
# Depois, calcule a raiz quadrada de Z e o logaritmo natural do resultado da raiz quadrada. 
# Por fim, arredonde o resultado para zero dígitos. 
# Qual o valor resultante ? Note que a resposta é um número inteiro. *

X <- 133
Y <- 36
Z <- X+Y
sqrt(Z)
log(sqrt(Z))
round(log(sqrt(Z)), digits = 1)

# Pesquise a respeito da “sequência de Fibonacci” e 
# obtenha os cinco primeiros números dessa sequência. 
# Qual o logarítimo natural da soma desses cinco números? 
# (Observação: use a função round() para arredondar a resposta 
# de modo que ela tenha apenas três casas decimais) *
fib <- function(x) {
  if(x<2) x
  else fib(x-1)+fib(x-2)
}

sumfib <- function(x){
  sum <- 0
  for(i in 1:x){
    sum <- sum + fib(i)
  }
  return(sum)
}

sumfib(5)
round(log(sumfib(5)), digits=3)

# Dada a função f(x) = sin(x) + x. 
# Calcule o valor da derivada de primeira ordem de f(x) quando x=2. 
# (Observação: use a função round() para arredondar a resposta de 
# modo que ela tenha apenas três casas decimais) *

f = expression(sin(x)+x)
dr <- D(f, "x")
x <- 2
round(eval(dr), digits = 3)

# Calcule o factorial de 10. Com o resultado em mãos, 
# calcule o logaritmo de base 10 desse resultado. 
# (Observação: use a função round() para arredondar a 
# resposta de modo que ela tenha apenas duas casas decimais)

x <- factorial(10)      
y <- log10(x)
round(y, digits = 2)

# Suponha que a velocidade da luz seja c = 300000000 m/s. 
# A equação da equivalência massa-energia de Einstein é dada 
# como E=m*c^2, sendo ‘m’ a massa e ‘c’ a velocidade da luz. 
# Calcule o logarítmo natural do valor da energia originada 
# de um objeto de 10Kg. (Observação: use a função round() 
# para arredondar a resposta de modo que ela tenha apenas 
# duas casas decimais) *

c <- 300000000
m <- 10
r <- m*c^2
round(log(r), digits = 2)


# Crie um vetor de dados com o seguinte comando da linguagem R: 
# v<-c(2,5,7,8,9) . Agora tome o seguinte polinômio 
# f(x) = x^3 + x^2 + x. Calcule a média dos valores gerados pela 
# função f(x) quando você substituir a variável ‘x’ do polinômio pelo vetor ‘v’.

v <- c(2,5,7,8,9)

f <- function(x){
  x^3+x^2+x
}

ave(f(v))
