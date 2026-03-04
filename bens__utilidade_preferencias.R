# 1. Criar dados de exemplo
set.seed(123)
n <- 100
capital <- runif(n, 10, 100)
trabalho <- runif(n, 10, 100)
# Produção com tecnologia A=1, alpha=0.4, beta=0.6, plus erro
producao <- 1 * (capital^0.4) * (trabalho^0.6) * exp(rnorm(n, 0, 0.1))

# 2. Transformar para logaritmo
ln_Y <- log(producao)
ln_K <- log(capital)
ln_L <- log(trabalho)

# 3. Estimar o modelo via Mínimos Quadrados Ordinários (OLS)
modelo <- lm(ln_Y ~ ln_K + ln_L)

# 4. Ver resultados
summary(modelo)
# O intercepto é ln(A), os coeficientes de ln_K e ln_L são alpha e beta
