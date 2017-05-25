#Este script hace un análisis de componentes principales con SNPRelate
##Cargar paquetes y crear el archivo .gds
library(SNPRelate)
library(gdsfmt)
vcf.fn <- ("Bioinformatica.vcf")
snpgdsVCF2GDS(vcf.fn, "Bioinformatica.gds", method="biallelic.only", verbose = TRUE)
snpgdsSummary("Bioinformatica.gds")
BASE2 <- snpgdsOpen("Bioinformatica.gds")

# Hacer el PCA
pca<-snpgdsPCA(BASE2,autosome.only=FALSE, num.thread=2)
pc.percent <- pca$varprop*100
head(round(pc.percent, 2))

#Estimar los Eigenvalores
tab <- data.frame(sample.id = pca$sample.id,EV1 = pca$eigenvect[,1],    # the first eigenvector
 EV2 = pca$eigenvect[,2],    # the second eigenvector
 stringsAsFactors = FALSE)
head(tab)


# Plotear el PCA
plot(tab$EV2, tab$EV1, 
xlab= paste0("eigenvector 2 explaining ", round(pc.percent, 2)[2], "%"), # agregar % de varaición del componente al texto del eje
ylab= paste0("eigenvector 1 explaining ", round(pc.percent, 2)[1], "%"))

