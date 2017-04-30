## Sebastian Arenas
## Perform R homework  in teocintle

########### Get data  ###############

# 1 Este comando carga un df llamado fullmat para el archivo maizteocintle_SNP50k_meta_extend.txt
fullmat<-read.delim("../meta/maizteocintle_SNP50k_meta_extended.txt")

# 2 Este comando dice que tipo de objeto creamos anteriormente
class(fullmat)

# 3 Este comando mira los primeros 6 renglones del df
head(fullmat)

# 4 Este comando dice cuantas muestras tenemos
nrow(fullmat)

# 5 Este comando cuenta el numero de estados
length(unique(fullmat$Estado))

# 6 Este comando dice cuantas muestras se tomaron antes de 1980 
sum(fullmat$A.o._de_colecta<1980, na.rm = TRUE)

# 7 Este comando dice cuantas muestras hay de cada raza
table(fullmat$Raza)

# 8 Este comando dice el promedio de cada raza
mean(fullmat$Altitud)

# 9 Este comando dice a que Altitud maxima y minima
range(fullmat$Altitud)

# 10 Comando que crea una nueva df de datos con las muestras de la raza Olotillo
Olotillo<-subset(fullmat, Raza == "Olotillo")

# 11 Comando que crea una nueva df de datos con las muestras de las razas: Reventador, Jala y Ancho
ancho<-subset(fullmat, Raza == "Ancho")
jala<-subset(fullmat, Raza == "Jala")
reventador<-subset(fullmat, Raza == "Reventador")
submat<-rbind(ancho,jala,reventador)

# 12 Crear un nuevo archivo .cvs
write.csv(submat, '../meta/submat.csv')


