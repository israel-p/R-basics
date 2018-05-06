# 1º CURSO: Data Science R Basics
# Material de apoio baseado nas aulas e nos exercícios do datacamp.
# O curso/exercícios são baseado numa biblioteca (dslabs) e no datatype (murders )

##########  R BASICS ########## 

# Testando uma equação básica no R 
# Calcular soma dos primeiras 100 números inteiros.  
n<-100
n*(n+1)/2

#Soma das sequências
n <- 1000
x <- seq(1,n)
sum(x)

#Log
log2(16)

log10(sqrt(100))

# Raiz quadrada
sqrt(log2(16))

########## DATA TYPES ########## 

#Estrura de dado
library(dslabs)
data(murders) # carrega os dados
murders  # exibir o dado(objeto)
str(murders) # exibe estrutura do objeto

# Extrair a coluna do data frame 
names(murders)

# Carregar uma variável a partir de uma coluna (vetor) de um data frame
p <- murders$population  

# Outro modo de carregar a variável
o <- murders[["population"]]
identical(o, p) # função que testa se são iguais 'o' e 'p'

# Classe do objeto 
class(murders$region) # classe da variável região 

# tamanho de um objeto 
a= levels(murders$region) 
length(a) # determina o número de regiões incluida na variável. 

# recebendo um vetor como entrada e retornando a frequência de cada elemento único do vetor:
x <- c("a", "a", "b", "b", "b", "c")
table(x) 
table(murders$region)


########## VECTORS ##########

# vetor- série de valores, todos do mesmo tipo.
temp <- c(35,88,42,84,81,30)
temp

city= c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")
city


# Conectando vetores numéricos e de caracteres

cost <- c(50, 75, 90, 100, 150)
food <- c("pizza", "burgers", "salads", "cheese", "pasta")
names(cost) <- food
cost

# acessando um subconjunto dos dados:
cost[1] # vendo o primeiro item do vetor cost

# Vetores de subconjuntos
cost[3:5] # vendo os últimos 3 itens do vetor cost. 
city[1:3]



# acessando um subconjunto dos dados por meio de um vetor
temp <- c(35, 88, 42, 84, 81, 30)
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")
names(temp) <- city # definindo temp
temp[c(3,5)]  # elementos 3 e 5 
temp[c(5,3)]  # elementos 5 e 3 

# sequências
x= 12:73 # vetor com inteiros de 12 a 73
length(x)

# sequência a partir da função seq
seq(7,49,7)  #1º argumento: onde começa/ 2º: o valor máximo / 3º:intervalo, em default é 1
seq(7,49)
seq(1,99,2) 

a = seq(6,55,4/7) # ultimo argumento neste caso é uma fração
a
length(a)

# sequêcias que aumentam na mesma quantidade com tamanho pré-especificado
x <- seq(0, 100, length.out = 5) # incrementos de 5 em 5
x
class(x) #objeto da classe numéica


# número inteiro
class(3L) # basta acrescentar o 'L' após o número
# para fins práticos números inteiros e numéricos são indistinguíveis
# porém os inteiros ocupam menos espaço na memória do PC

# Coerção - NA(Not Available)
#Podemos evitar problemas com coerção em R mudando os caracteres para numéricos e vice-versa
as.numeric(x) # caracteres ---> numéricos
as.character(x) # numéricos ---> caracteres


########## SORTING ##########

#indice: c(3,4,8,10,32). Valor 3 possui o índice 1. Valor 4 possui o indíce 2... Valor 32 possui o índice 5
x=c(31,4,15,92,65)
x

## sort 
sort(x) # coloca os valores de x em ordem crescente 


##order: um vetor que  retorna os índices que classificam esse vetor.
index=order(x)  # variável index recebe os índices, respectivos a ordem crescente dos valores. 

## max e which.max
max(x) # retorna o valor máximo
which.max(x) #retorna o índice onde o número máximo reside

## min e which.min
min() # retorna o valor minímo
which.min(murders$total) #retorna o índice onde o número minímo reside

## rank
rank(x)
# gera um vetor. cujo primeiro valor nos indica onde o primeiro número do vetor x está no ranking(1º,2º...)
# se o primeiro valor do vetor x é o 3º maior, o vetor gerado de rank(X) nos dará o valor 3

## data frame
temp <- c(35, 88, 42, 84, 81, 30)
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")
city_temps <- data.frame(name = city, temperature = temp)
city_temps #data frame with city names and temperature 

# exemplo murders:
i_max= which.max(murders$total) #i_max foi definida para receber o index do maior total
i_max
murders$state[i_max] #i_max sendo usado para encontrar o estado com o maior valor total

## NA
library(dslabs)
data(na_example)
mean(na_example) #não é possível calcular, pois o dataset: na_example, contém vários "NA" no dado
ind=is.na(na_example) #criando index(ind) lógico, locais com NA (TRUE)
ind
sum(ind == TRUE) #contando quantos NA temos no dado

# Eliminando partes do vetor com NA usando um vetor com T e F
a=c(1,2,3,4,10)
a

b=c(T,F,F,F,F)
a[b] # somente aparecerá agora o primeiro elemento (TRUE)
a[!b] # exclamação inverte elementos do vetor b, de modo que agora não aparecerá o primeiro elemento(FALSE)


########## VECTOR ARITHMETICS ##########
 
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")
temp <- c(35, 88, 42, 84, 81, 30)
temp= (temp-32)*5/9 #  Fahrenheit -> Celsius 
temp
city_temps = data.frame(name = city, temperature = temp)
city_temps




########## INDEXING ##########

# logical operators:
# == (exatamente igual)
#!= (não é igual)
#! (negação)
# | (operação 'ou')
# & (operação 'e')


#Usar operações lógicas para indexar(classificar) vetores
murder_rate = murders$total/murders$population*100000  # número de assassinatos a cada 10^5 habitantes

index=murder_rate<0.71 #comparando o vetor com um único número
index
index1=murder_rate<=0.71
index1 
murders$state[index] #estados que atendem a condição do index (proporção de assassinatos menor que 0,71)

# combinando uso de comparações e index para selecionar parte do dado que atenda as condições
west= murders$region == "West"
safe= murder_rate <=1
index2=safe & west 
murders$state[index2]

#coerção em uma soma: TRUE->1 e FALSE->0
sum(index)

#funções de indexação :
#which- fornce as entradas de um vetor lógico que são verdadeiras.
x=c(F,T,F,T,T,F)
which(x) # o 2º,4º e 5º elementos são "TRuE"

index = which(murders$state == "Massachusetts") # O index receberá a o índice referente ao estado de Massachusetts
index
murder_rate[index] # com o índice referente ao estado, calcula-se a proporção de assassinatos referente a ele.

#match - procura entradas em um vetor e retorna o índice necessário para acessá-los.
index = match(c("New York", "Florida","Texas"),murders$state) 
index # mostra quais indíces do 2º vetor corresponde a cada uma das entradas de um 1º vetor
murders$state[index] # apenas confirmando a correspondência 


#%in% forma de saber se cada elemento de um 1º vetor está em um 2º vetor
x=c(2,3,5)
y=c(1,2,3,4)
x%in%y # x está presente em y? Caso positivo (TRUE), e é gerado um vetor do tamanho do primeiro vetor- x(T or F)

c("Boston","Dakota","Washington") %in% murders$state



########## BASIC DATA WRANGLING ##########

########## BASIC PLOTS ##########

########## PROGRAMMING BASICS ##########
 
