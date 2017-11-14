##Para hacer comentarios se necesita usar el símbolo "#" o seleccionar lo que se quiere poner como 
##comentario y oprimir Ctrl+Shift+c

por ejemplo

##Se pueden obtener resultados con solo poner operaciones matemáticas
5*4
9-3
20/2

##También se pueden asignar valores a objetos
peso_kg<-50
#para asignar valores se puede usar el símbolo "<-" o "=", ambos cumplen la misma función

#los objetos pueden tener diferentes nombres, puede ser una letra o una palabra; sin embargo
#no se puede iniciar con un número.
2x<-5
x2<-5

##Cuando aplicamos valores a objetos no va a corrernos un resultado, por lo que se puede poner el 
##objeto entre parentesis para que lo corra de una vez
peso_kg<-50
(peso_kg<-50)
peso_kg

##Una vez que peso_kg tenga un valor asignado se pueden hacer diferentes operaciones con el 
2.2*peso_kg

##Es posible redefinir el objeto 
peso_kg<-57
2.2*peso_kg

##Podemos crear un nuevo objeto con el que ya teniamos antes 
peso_lb<-2.2*peso_kg
peso_lb

##EJERCICIO##
#¿Cúal es el valor de los siguientes objetos?

masa<-47
edad<-80
masa<-2*masa
edad<-edad-20
indice_masa<-masa/edad

##Funciones y argumentos

sqrt() #raiz cuadrada
round() #redondear 

a<-9
b<-sqrt(a)
c<-7.9836538
round(c)
round(c, digits = 3)
round(c,3)

#si no se sabe los argumentos de una función se puede usar 
args(round)

#o también 
?round

##Podemos crear objetos que contengan mÃ¡s de un valor. Para esto se usan vectores 
##Se definen de la siguiente manera 
peso= c(30,49,55,76)
peso
animales= c("gato", "perro", "gallina")
animales

##Una vez que tengo mis vectores definidos puedo usar algunas funciones. 
length(peso) ##me da el numero de objetos

class(peso)   ##numericos o carateres 
class(animales)

str(peso)  #descripciÃ³n 
str(animales)

##si necesitamos aÃ±adir un valor a nuestro vector
peso=c(45,peso)
peso

##Si necesito extraer un lugar o valor especifico del vector
animales[2]
peso[c(1,3)]

##Si quiero repetir algunos los mismos objetos dentro del vector
animales2=animales[c(1,2,3,1,2,3)]
animales2


##Elegir entradas con TRUE Y FALSE
peso1=peso[c(TRUE,FALSE,TRUE,TRUE,FALSE)]
length(peso1)
##Elegir valores mayores 
peso>50
peso[peso > 50 ]
peso

peso2=peso[peso > 50 ]
peso2

##Podemos combinar varias condiciones
peso[peso<40 | peso > 50] 

peso[peso<=30 & peso = 21] ##me da error
peso[peso<=30 & peso == 21] ##se cumplan al mismo tiempo
peso[peso<=40 & peso ==30]

animales[animales == "rata" | animales == "gallina"]
animales

##Si un nuestro vector tenemos valores nulos o faltantes de informaciÃ³n 
numeros= c(2, 4, 4, NA, 6)
#Si queremos hacer algun cÃ¡lculo con el vector
mean(numeros) #calcular la media 

##Puedo decirle a R que no me tome en cuenta los valores faltantes 
numeros2= na.omit(numeros)
mean(numeros2)

mean(numeros, na.rm = TRUE)

numeros[complete.cases(numeros)]

mean(numeros[complete.cases(numeros)])

###COMENZANDO CON DATOS####

#Data.frame es la estructura usada para la mayoría de las estructuras de tabulación de datos. 
#Se usa para obtener estadísticas y graficar. 

#Se puede generar a mano o utilizar funciones como: 
1.read.csv()
2.read.table()

#Un data.frame es la representación de datos en un formato de tablas donde las columnas son vectores y todos los vectores tienen el mismo largoy el mismo tipo de datos, por ejemplo: 
#Una vez que se tiene un data.frame se puede ver mediante la función str()

#Ejercicio:
#Defina un vector que contenga los datos:
 
name <- c("Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune")
type <- c("Terrestrial planet", "Terrestrial planet", "Terrestrial planet", 
          "Terrestrial planet", "Gas giant", "Gas giant", "Gas giant", "Gas giant")
diameter <- c(0.382, 0.949, 1, 0.532, 11.209, 9.449, 4.007, 3.883)
rotation <- c(58.64, -243.02, 1, 1.03, 0.41, 0.43, -0.72, 0.67)
rings <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)

#Crear un data drame apartir de los vectores
planets_df <-data.frame(name, type,diameter,rotation,rings)

#Observar de forma elegante lo que contiene
str(planets_df)

#Inspeccionando un data frame

#Así como la función de str, hay otras formas de inspeccionarlo. 
#Para ver el tamaño o la longitud. 

#Me permite ver las filas en el primer elemento y las columnas en el segundo elemento
dim(planets_df) 

#Me indica la cantidad de filas. 
nrow(planets_df)

#Me indica el número de columnas. 
ncol(planets_df) 

#Contenido
#Muestra las 6 primeras filas  
head(planets_df) 

#Muestra las últimas 6 filas 
tail(planets_df) 

#Nombres
#Muestra el nombre de las columnas. 
names(planets_df) 

#Muestra el nombre de las filas 
rownames(planets_df) 

#Resumen 

#Summary:
#Muestra las estadísticas de cada columna. 
summary(planets_df)

#Subconjuntos 

#Ya sabemos que un data frame contiene filas y columnas, pero si queremos extraer algo en especifico necesitamos darle coordenadas de lo que queremos extraer. Las filas van primero, seguidas de las columnas. Hay muchas formas de espcificarlo esas coordenadas, entre ellas estan:
  
planets_df[1, 1]   #El primer elemento en la primer columna   
planets_df[1, 2]   # El primer elemento en la segunda columna 
planets_df[, 1]    #La primer columna 
planets_df[1]      #La primer fila  
planets_df[1:3, 4] #Los primeros tres elementos en la columna cuatro   
planets_df[3, ]    #El tercer elemento de todas las columnas 

#De igual forma se pueden excluir elementos. 

planets_df[,-1]          # Todos los datos dentro de dataframe menos la primer columna.  column
planets_df[-c(1:3),]     # Todos los elementos dentro de dataframe menos las filas del 1 a 3. 

#Factores: 
  Los factores usualmente son usados para representar caregorias de datos. Los factores pueden estar ordenados o desordenados, son necesarios para graficar y obtener estaditicas. 

#Se puede convertir un vector no númerico a factor, Por ejemplo:
sex <- factor(c("male", "female", "female", "male"))

#Y se pueden ver sus niveles para categorizarlo

levels(sex)
nlevels(sex)

#En algunas ocaciones el orden de los elementos dentro de un vector que fue convertido en factor no importa pero en este caso vamos a asignarle nombre a los elementos dentro de él según el orden que indica el vector. 
sex <- factor(sex, levels = c("male", "female"))

#También se puede convertir un factor en caracter, usando as.character(x):
as.character(sex) 

#¿Qué hacer cuando se tiene factores donde los niveles son números (ejemplo: años)?
  
#La función as.numeric(x) devuelve los valores de índice del factor, no sus niveles, 
#por lo que dará como resultado un conjunto de números completamente nuevo (y no deseado en este caso). 

###Solucion: Convertir los factores en caracteres y luego en numeros

f <- factor(c(1990, 1983, 1977, 1998, 1990))
as.numeric(f)               # No lo hagas!!
as.numeric(as.character(f)) # Funciona..
as.numeric(levels(f))[f]    # Forma recomendada

###Factores de cambio de nombre:
  
#Si se quiere observar el número de observaciones representadas por cada nivel de factor:
 
##barplot de la cantidad de planetas terrestres y gigantes gaseosos
plot(planets_df$type)

#Si se quiere cambiar el nombre a algun nivel de la variable factor:

tipo_planeta <- planets_df$type
levels(tipo_planeta)

levels(tipo_planeta)[1] <- "Gigantes Gaseosos"
levels(tipo_planeta)

#Intentemos cambiar el nombre "Terrestrial planet"

###StringsAsFactors=FALSE
#Al construir o importar una base de datos, las columnas que contienen caracteres (es decir, texto) 
#se fuerzan (convierten) en tipo factor. Dependiendo de lo que quiera hacer con los datos, puede mantener estas columnas como caracter. 
#Para hacerlo, read.csv() y read.table() tienen un argumento llamado stringsAsFactors que se puede configurar  con el argumento FALSE, para luego convertir en tipo factor solo las columnas que lo requieran.

#Descargar el siguiente archivo de datos
getwd()
download.file("https://ndownloader.figshare.com/files/2292169" , "portal_data_joined.csv")

#Cargar los datos
surveys <- read.csv("portal_data_joined.csv")

#Observemos lo que contiene
head(surveys)

#Comparemos la diferencia entre leer los datos como "factor" y leer los datos como "caracter"
surveys <- read.csv("portal_data_joined.csv ", stringsAsFactors = TRUE)
str(surveys)

surveys <- read.csv("portal_data_joined.csv", stringsAsFactors = FALSE)
str(surveys)

###Fechas de formato
#La mejor práctica para tratar con los datos de fecha es garantizar que cada componente de su fecha 
#se almacene como una variable separada. 
str(surveys)

#Cargar la librería lubridate, para utilizar la función ymd()
library(lubridate)

#Crear un vector de caracteres con año, mes y día
paste(surveys$year, surveys$month, surveys$day, sep = "-")

#Este vector de caracteres se puede usar como argumento para ymd():
ymd(paste(surveys$year, surveys$month, surveys$day, sep = "-"))

#El vector POSIXct (es una clase de datos reconocidos por R como una fecha o fecha y hora) 
#resultante se puede agregar a surveys como una nueva columna llamada date:
surveys$date <- ymd(paste(surveys$year, surveys$month, surveys$day, sep = "-"))
str(surveys)

### WARNING MESSAGE###

#Identificar las filas en nuestro marco de datos que están fallando. 
#Primero, creemos un vector que contenga nuestras fechas como un vector de caracteres:
surveys_dates <- paste(surveys$year, surveys$month, surveys$day, sep = "-")
head(surveys_dates)

#Usar la función is.na() en el marco de datos para localizar los elementos que no pudieron analizarse:
surveys_dates[is.na(surveys$date)]
