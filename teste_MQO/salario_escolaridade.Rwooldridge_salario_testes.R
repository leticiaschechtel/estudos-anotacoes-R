Este exemplo usará a base wage1 do Wooldridge. 
O cenário é estimar o retorno da educação sobre o salário.'


#### 1. Carregar os pacotes ####
"Pacotes são como caixas de ferramentas que alguém já criou"
library(wooldridge)         # Onde estão os dados do livro
library(ggplot2)            # Para fazer gráficos bonitos
library(stargazer)          # Para tabelas acadêmicas 

#### 2. Carregar os dados ####
data("wage1")
View(wage1)
'These are data from the 1976 Current Population Survey, 
collected by Henry Farber when he and I were colleagues 
at MIT in 1988.
Barry Murphy, of the University of Portsmouth in the UK, 
has pointed out that for several observations the values
for exper and tenure are in logical conflict.  
In particular, for some workers the number of years with 
current employer (tenure) is greater than overall 
work experience (exper).  At least some of these conflicts 
are due to the definition of exper as “potential” work 
experience, but probably not all.  Nevertheless, I am using 
the data set as it was supplied to me.'

#### 3. Visualizar os dados ####
"Antes de calcular qualquer coisa, vamos ver a dispersão dos dados.
Existe uma relação visível entre estudar mais e ganhar mais?"

ggplot(wage1, aes(x = educ, y = wage)) +
  geom_point(color = "blue", alpha = 0.5) + # Plota os pontos
  labs(title = "Relação entre Salário e Educação",
       x = "Anos de Educação",
       y = "Salário por Hora (US$)") +
  theme_minimal()

#### 4. Regressão ####
'Modelo: Salário = Beta0 + Beta1 * Educação + erro'

modelo_simples <- lm(wage ~ educ, data = wage1)

'Pronto. O computador já fez o cálculo de derivadas parciais e 
minimização de erros.
Vamos ver o resultado?'

summary(modelo_simples)

'Para organizar as informações em uma tabela acadêmica'
stargazer(modelo_simples, 
          type = "text", 
          title = "Resultados da Regressão")

#### 5. Visualizar o resultado ####
"Para fechar, vamos desenhar essa linha que calculamos 
em cima do gráfico."

ggplot(wage1, aes(x = educ, y = wage)) +
  geom_point(color = "gray") +
  geom_smooth(method = "lm", color = "red", se = FALSE) + # Adiciona a reta de regressão
  labs(title = "A Reta de Regressão: Retorno da Educação",
       subtitle = "A linha vermelha é a nossa previsão econométrica",
       x = "Anos de Educação",
       y = "Salário") +
  theme_minimal()


#### 6. Econometria como um Filtro ####

modelo1 <- lm(wage ~ educ, data=wage1)
'Interpretação: Parece que cada ano de estudo dá 
54 centavos a mais.'
modelo2 <- lm(wage ~ educ + exper, data=wage1)
'O coeficiente de educ cai para 0.644.
Por quê? 
Porque aqueles 10 centavos de diferença não eram 
mérito da educação, eram mérito da experiência, 
mas a educação estava levando o crédito indevidamente. 
Agora, com a regressão múltipla, nós limpamos o efeito e 
sabemos a verdade: o retorno real da educação, descontada
a experiência, é 0.644.'

stargazer(modelo1, modelo2, 
          type = "text",                      # Mude para "html" ou "latex" se for exportar
          title = "Resultados da Regressão: Efeito da Educação no Salário",
          dep.var.labels = "Salário (Wage)",  # Nome da variável dependente
          covariate.labels = c("Anos de Educação", "Anos de Experiência"), # Nomes das explicativas
          out.header = FALSE,                 # Remove cabeçalhos extras
          keep.stat = c("n", "rsq", "adj.rsq", "f")) # Escolhe quais estatísticas mostrar
