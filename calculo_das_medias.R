library(dplyr);library(tidyr)

planilha <- "DESEMPENHO_RAST"
dado <- DESEMPENHO_RAST

media <- assign(paste(planilha,"_Media",sep = ""),group_by(dado,POTENCIA_MAXIMA)%>%
                  summarise(across(`2-Hidroxiisovalerato`:`1-Metilnicotinamida`,median)))

assign(paste(planilha,"_log2",sep = ""),cbind(media[1],
                                              apply(media[-1],2,log2)))


planilha <- "DESEMPENHO_YOYO_DISTANCIA"
dado <- DESEMPENHO_YOYO

media <- assign(paste(planilha,"_Media",sep = ""),group_by(dado,DISTANCIA)%>%
  summarise(across(`2-Hidroxiisovalerato`:`1-Metilnicotinamida`,median)))

assign(paste(planilha,"_log2",sep = ""),cbind(media[1],
                                               apply(media[-1],2,log2)))

planilha <- "DESEMPENHO_YOYO_VO2"
dado <- DESEMPENHO_YOYO

media <- assign(paste(planilha,"_Media",sep = ""),group_by(dado,VO2)%>%
                  summarise(across(`2-Hidroxiisovalerato`:`1-Metilnicotinamida`,median)))

assign(paste(planilha,"_log2",sep = ""),cbind(media[1],
                                              apply(media[-1],2,log2)))


planilha <- "TODAS_AS_ATLETAS"
dado <- TODAS_AS_ATLETAS_PRE_E_POS

media <- assign(paste(planilha,"_Media",sep = ""),group_by(dado,class)%>%
                  summarise(across(`2-Hidroxiisovalerato`:`1-Metilnicotinamida`,median)))

assign(paste(planilha,"_log2",sep = ""),cbind(media[1],
                                              apply(media[-1],2,log2)))

planilha <- "TODAS_AS_ATLETAS_SO_POS"
dado <- TODAS_AS_ATLETAS_SO_POS

media <- assign(paste(planilha,"_Media",sep = ""),group_by(dado,Group)%>%
                  summarise(across(`2-Hidroxiisovalerato`:`1-Metilnicotinamida`,median)))

assign(paste(planilha,"_log2",sep = ""),cbind(media[1],
                                              apply(media[-1],2,log2)))


planilha <- "Min60_PRE_POS"
dado <- X60_MINUTOS_PRE_E_POS

media <- assign(paste(planilha,"_Media",sep = ""),group_by(dado,Group)%>%
                  summarise(across(`2-Hidroxiisovalerato`:`1-Metilnicotinamida`,median)))

log2 <- assign(paste(planilha,"_log2",sep = ""),cbind(media[1],
                                              apply(media[-1],2,log2)))

planilha <- "Min60_POS"
dado <- X_60_SO_POS

media <- assign(paste(planilha,"_Media",sep = ""),group_by(dado,Group)%>%
                  summarise(across(`2-Hidroxiisovalerato`:`1-Metilnicotinamida`,median)))

assign(paste(planilha,"_log2",sep = ""),cbind(media[1],
                                              apply(media[-1],2,log2)))

planilha <- "DESEMPENHO_60_YOYO"
dado <- DESEMPENHO_60_YOYO

media <- assign(paste(planilha,"_Media",sep = ""),group_by(dado,DISTANCIA)%>%
                  summarise(across(`2-Hidroxiisovalerato`:`1-Metilnicotinamida`,median)))

assign(paste(planilha,"_log2",sep = ""),cbind(media[1],
                                              apply(media[-1],2,log2)))

planilha <- "DESEMPENHO_60_YOYO_VO2"
dado <- DESEMPENHO_60_YOYO

media <- assign(paste(planilha,"_Media",sep = ""),group_by(dado,VO2)%>%
                  summarise(across(`2-Hidroxiisovalerato`:`1-Metilnicotinamida`,median)))

assign(paste(planilha,"_log2",sep = ""),cbind(media[1],
                                              apply(media[-1],2,log2)))

planilha <- "DESEMPENHO_60_RAST"
dado <- DESEMPENHO_RAST_60

media <- assign(paste(planilha,"_Media",sep = ""),group_by(dado,POTENCIA_MAXIMA)%>%
                  summarise(across(`2-Hidroxiisovalerato`:`1-Metilnicotinamida`,median)))

assign(paste(planilha,"_log2",sep = ""),cbind(media[1],
                                              apply(media[-1],2,log2)))

YoyoRast_data <- list("DESEMPENHO_RAST_Media"=DESEMPENHO_RAST_Media,"DESEMPENHO_RAST_log2"=DESEMPENHO_RAST_log2,
                      "DESEMPENHO_YOYO_DISTANCIA_Media"=DESEMPENHO_YOYO_DISTANCIA_Media,"DESEMPENHO_YOYO_DISTANCIA_log2"=DESEMPENHO_YOYO_DISTANCIA_log2,
                      "DESEMPENHO_YOYO_VO2_Media"=DESEMPENHO_YOYO_VO2_Media,"DESEMPENHO_YOYO_VO2_log2"=DESEMPENHO_YOYO_VO2_log2,
                      "TODAS_AS_ATLETAS_Media"=TODAS_AS_ATLETAS_Media,"TODAS_AS_ATLETAS_log2"=TODAS_AS_ATLETAS_log2,
                      "TODAS_AS_ATLETAS_SO_POS_Media"=TODAS_AS_ATLETAS_SO_POS_Media,"TODAS_AS_ATLETAS_SO_POS_log2"=TODAS_AS_ATLETAS_SO_POS_log2,
                      "Min60_PRE_POS_Media"=Min60_PRE_POS_Media,"Min60_PRE_POS_log2"=Min60_PRE_POS_log2,
                      "Min60_POS_Media"=Min60_POS_Media,"Min60_POS_log2"=Min60_POS_log2,
                      "DESEMPENHO_60_RAST_Media"=DESEMPENHO_60_RAST_Media,"DESEMPENHO_60_RAST_log2"=DESEMPENHO_60_RAST_log2,
                      "DESEMPENHO_60_YOYO_Media"=DESEMPENHO_60_YOYO_Media,"DESEMPENHO_60_YOYO_log2"=DESEMPENHO_60_YOYO_log2,
                      "DESEMPENHO_60_YOYO_VO2_Media"=DESEMPENHO_60_YOYO_VO2_Media,"DESEMPENHO_60_YOYO_VO2_log2"=DESEMPENHO_60_YOYO_VO2_log2)

writexl::write_xlsx(YoyoRast_data,"Medias_yoyoRast.xlsx")
