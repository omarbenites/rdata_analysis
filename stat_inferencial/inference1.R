
# Statisticla Inference- Trosset ------------------------------------------
#Empirical Distribution: A distribution based on the sample (a observation based approach)

#Ej1: Sea un dado que es lanzado n=20 veces, obteniendo
x <- c(1, 6, 3, 2, 2, 3, 5, 3, 6, 4, 3, 2, 5, 3, 2, 2, 3, 2, 4, 2) #sample (discrete)
n <- 20
hist(x)
n_x <- table(x) #number of elements of each value of the sample
# 1 2 3 4 5 6 
# 1 7 6 2 2 2 

#sea Pn, una funcion de distribucion probabilidad discreta (basada en la muestra)
pn <- n_x/n
# 1    2    3    4    5    6 
# 0.05 0.35 0.30 0.10 0.10 0.10 

# Si NO usaramos la probabilidad asociada a la muestra (Empirica), es decir si usaramos una poblacion
# completa (o true probability), cada lanzamiento asociado a una cara del dado tendria una probabilidad:
p_pob <- 1/6 #la probabilidad de cada cara del dado sin usar muestra

# Conclusión: Vemos que existen diferencias en la probabilidad asociada a la poblacion
# y la probabilidad asociada a la muestra(el rango varia de 0.05 a 0.35), siendo un claro ejemplo de la variabilidad  
# o variacion en la muestra.


# Estimation of the sample mean
# La media de poblacion (caras del dado) esta dado por:
u_pop <- sum(c(1,2,3,4,5,6))/6
#3.5

# La media muestral, esta dada por:
u_sample <- sum(x)/n
#3.15


# Estimacion de la media (vista como Variable Aleatoria X1, X2, X3, ...,Xn uppercase) 

# Supongamos que P (distribucion poblacional) sea una distribucion asimetrica Chi-Cuadrado
# con 3 grados de libertad. Por colorario 5.1  (Ver Trosset pagina 187.), el valores
# esperado de Y es igual a los grados de libertad. E[Y]=n

# Consideremos una muestra de 5 observaciones con 3 grados libertad, y que repitamos
# 3 veces el experimento

xc1 <- rchisq(n = 5, df = 3) 
mean(xc1)

xc2 <- rchisq(n = 5, df = 3) 
mean(xc2)

xc3 <- rchisq(n = 5, df = 3) 
mean(xc3)

# Se observa que la media de las muestras de la D.chi cuadrado, cuando tenemos n=5,
# X1, X2,...,X5 y la variacion es muy alta.
# Realizamos una simulacion 1000 veces

p5 <- vector(mode = "numeric", 1000)
for(i in 1:1000){
  p5[i] <- mean(rchisq(n=5, df=3))
}
#Grafico de histograma
hist(p5)
#grafico de densidad
plot(density(p5), xlab = "Observed values of de the sample mean", "estimation density")


# Hagamos una simulacion para un tamano de muestra n=80 (X1, X2,...,X80 v.a) y df=3.
# La simulacion sera de 1000 veces

p80 <- vector(mode = "numeric", 1000)
for(i in 1:1000){
  p80[i] <- mean(rchisq(n=80, df=3))
}
hist(p80)
plot(density(p80), xlab = "observed values of the sample mean",ylab = "estimation density")


# Teorema central de limite

# Considere una variable estandirizada de la forma: Z = (X-u)/sigma
# Notese que la estandirizacion no cambia la forma de la distribucion
# Sea una distribucion de Bernoulli (un caso de la dist. binomial)
xber <- rbinom(n = 100,size = 1,prob = 1/2)
hist(xber)
#standarizamos. En la D.Bernoulli tenemos que u=p=0.5
z <- (xber- 0.5)/0.5
hist(z) #se observa que se mantiene la misma forma de la distribucion. EN este caso
# con colas en el -1 y 1

#ver este link
#http://jliszka.github.io/2013/08/26/a-programmers-guide-to-the-central-limit-theorem.html






