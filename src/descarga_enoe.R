# Años de interés
anios <- seq(2016, 2022)
# Trimestres de interés
trimestres <- c("trim1", "trim2", "trim3", "trim4")

path_restulados <- "./resultados/"
dir.create(path_restulados)

for (anio in anios) {
  for (trim in trimestres) {
    datos <- importinegi::enoe(year = anio,
                               trimestre = trim)
    # Guarda en un csv el cuarto elemento (SDEM), que es el que nos interesa
    datos[[4]] |>
      write.csv(paste0("./resultados/SDEM", trim, anio),
                row.names = FALSE)
  }
}
