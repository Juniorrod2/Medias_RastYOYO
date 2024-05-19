library(dplyr);library(tidyr)

planilha <- "DESEMPENHO_RAST"
dado <- DESEMPENHO_RAST

media <- assign(paste(planilha,"_Media",sep = ""),group_by(dado,POTENCIA_MAXIMA)%>%
                  summarise(across(`2-Hidroxiisovalerato`:`1-Metilnicotinamida`,median)))

assign(paste(planilha,"_log2",sep = ""),cbind(media[1],
                                              apply(media[-1],2,log2)))


planilha <- "DESEMPENHO_YOYO"
dado <- DESEMPENHO_YOYO

media <- assign(paste(planilha,"_Media",sep = ""),group_by(dado,DISTANCIA)%>%
  summarise(across(`2-Hidroxiisovalerato`:`1-Metilnicotinamida`,median)))

assign(paste(planilha,"_log2",sep = ""),cbind(media[1],
                                               apply(media[-1],2,log2)))
