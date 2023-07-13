descarga_sdem <- function(anio_inicio = 2020, anio_fin = 2020) {

  # Directorio en donde va a guardar los archivos descargados
  path_restulados <- "./resultados/"
  dir.create(path_restulados) # Crea el directorio si no existe

  # Crea un vector como secuencia de valores
  anios <- seq(anio_inicio, anio_fin)
  # Descarga todos los trimestres
  trimestres <- c("trim1", "trim2", "trim3", "trim4")

  for (anio in anios) {
    for (trim in trimestres) {
      datos <- NULL # Crea el objeto vacío

      datos <- importinegi::enoe(year = anio,
                                 trimestre = trim)

      tryCatch(                       # Applying tryCatch

        expr = {                      # Specifying expression
          # Guarda en un csv el cuarto elemento (SDEM), que es el que nos interesa
          datos[4] |>
            write.csv(paste0("./resultados/SDEM", anio, trim),
                      row.names = FALSE)
        },

        error = function(e){          # Specifying error message
          message("There was an error message.")
        },

        warning = function(w){        # Specifying warning message
          message("There was a warning message.")
        },

        finally = {                   # Specifying final message
          message("tryCatch is finished.")
        }
      )

    }
  }

}
