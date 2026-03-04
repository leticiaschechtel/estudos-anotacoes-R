# Estimação de salário e escolaridade 

  library(wooldridge)
  library(ggplot2)
  library(stargazer)

  data(wage1)  
head(wage1)

### Descubra o numero de observações e variaveis 
dim(wage1)

#### O $ fala a coluna que se busca 

### Media da educacao 
media_educacao <- mean(wage1$educ)

#### Media dos salarios
media_salario <- mean(wage1$wage)
print(paste("Salario medio por hora: $", round(media_salario, 2)))

#### Media por genero
  media_por_genero <- tapply(wage1$wage, wage1$female, mean)

#### AES são os eixos do gráficos
  ggplot(wage1, aes(x = educ, y = wage))  
    geom_point(color = "blue", alpha = 0,5)  
    
### 4. Regressão

### Stargazer demonstra uma tabela que vai direto ao artigo
### A função mais
#### O numero de *** demonstra a significância da variável

    
