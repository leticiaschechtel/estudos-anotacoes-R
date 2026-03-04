cidade <- c("salvador","recife","pernambuco","maceio","natal")
cidade
length(cidade)
help("length")
populacao = c(15000,20000,30000,17000,23000)
length(populacao)
sum(populacao)
max(populacao)
min(populacao)
numero.elementos.cidade=length(cidade)
media.populacao = sum(populacao)/numero.elementos.cidade
media.populacao
num1=(1:40)
num1
num2=seq(10,100,by=5)
num2
num3 = [num2>40]
num3
-------
dados = matrix(10:48, ncol = 1, byrow = FALSE)
dados
length(dados)

dados1 = matrix (1:25, ncol = 5)
dados1
dados2 = (2:26, ncol = 5)
dados2
data.frame(dados1,dados2)

lista1 <- list(A = 1:5, B = "SALVADOR", C = matrix(1:4, ncol = 4))
lista1
help("$")
