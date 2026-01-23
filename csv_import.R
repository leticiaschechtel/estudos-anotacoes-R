# Importar os dados
dados <- read.csv("/cloud/project/estudos-anotacoes-R/dados_fin.csv", sep = ";", header = TRUE)

# Visualizar as primeiras linhas
head(dados)

# Verificar a estrutura dos dados
str(dados)
-------
# Converter a coluna Data para o formato Date
dados$Data <- as.Date(dados$Data, format = "%d/%m/%Y")

# Substituir vírgulas por pontos em Dummy_Valor e converter para numérico
dados$Dummy_Valor <- as.numeric(gsub(",", ".", dados$Dummy_Valor))

# Verificar alterações
str(dados)
head(dados)

------
  # Verificar se há valores faltantes
  colSums(is.na(dados))

# Se necessário, substituir NA nas colunas Receitas e Despesas por 0
dados$Receitas[is.na(dados$Receitas)] <- 0
dados$Despesas[is.na(dados$Despesas)] <- 0

# Verificar novamente
colSums(is.na(dados))
