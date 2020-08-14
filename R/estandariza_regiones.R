#' Estandariza nombres de regiones de Chile
#'
#' Esta función reconoce nombres de regiones de
#' Chile en un vector de caracteres y devuelve el nombre oficial
#' de las mismas (por ejemplo, "RM" lo convierte en "Metropolitana
#' de Santiago"). Si no reconoce un nombre de región, entonces
#' mantiene el provisto originalmente en en el vector de caracteres.
#'
#' @param regiones Un vector de caracteres
#' @param nombre_corto Si es `TRUE`, devuelve el nombre corto
#'   de las regiones Metropolitana, O'Higgins, Aysén y Magallanes.
#'   El valor por defecto es `FALSE`, que devuelve el nombre oficial
#'   de la región.
#'
#' @return Devuelve un vector de caracteres con los nombres
#'  oficiales de las regiones de Chile
#' @export estandariza_regiones
#'
#' @examples
#' regiones <- c("Aisén", "Aysén", "Región del Bio-bío",
#' "Biobio", "RM", "Metropolitana")
#' estandariza_regiones(regiones)
#' estandariza_regiones(regiones, nombre_corto = TRUE)
#'

estandariza_regiones <- function(regiones, nombre_corto = FALSE) {

  regiones <- dplyr::case_when(
    stringr::str_detect({{ regiones }}, stringr::regex("arica", ignore_case = TRUE)) ~ "Arica y Parinacota",
    stringr::str_detect({{ regiones }}, stringr::regex("tarapac", ignore_case = TRUE)) ~ "Tarapac\u00e1",
    stringr::str_detect({{ regiones }}, stringr::regex("antofagasta", ignore_case = TRUE)) ~ "Antofagasta",
    stringr::str_detect({{ regiones }}, stringr::regex("atacama", ignore_case = TRUE)) ~ "Atacama",
    stringr::str_detect({{ regiones }}, stringr::regex("coquimbo", ignore_case = TRUE)) ~ "Coquimbo",
    stringr::str_detect({{ regiones }}, stringr::regex("valp", ignore_case = TRUE)) ~ "Valpara\u00edso",
    stringr::str_detect({{ regiones }}, stringr::regex("maule", ignore_case = TRUE)) ~ "Maule",
    stringr::str_detect({{ regiones }}, stringr::regex("uble", ignore_case = TRUE)) ~ "\u00d1uble",
    stringr::str_detect({{ regiones }}, stringr::regex("b(\u00ed|i)o", ignore_case = TRUE)) ~ "Biob\u00edo",
    stringr::str_detect({{ regiones }}, stringr::regex("arauc", ignore_case = TRUE)) ~ "La Araucan\u00eda",
    stringr::str_detect({{ regiones }}, stringr::regex("r(\u00ed|i)os", ignore_case = TRUE)) ~ "Los R\u00edos",
    stringr::str_detect({{ regiones }}, stringr::regex("lago", ignore_case = TRUE)) ~ "Los Lagos",
    TRUE ~ as.character({{ regiones }}))

  if (nombre_corto == FALSE) {
    regiones <- dplyr::case_when(
      stringr::str_detect({{ regiones }}, stringr::regex("(R\\.*M\\.*|metropol)", ignore_case = TRUE )) ~ "Metropolitana de Santiago",
      stringr::str_detect({{ regiones }}, stringr::regex("higg", ignore_case = TRUE)) ~ "Libertador General Bernardo O'Higgins",
      stringr::str_detect({{ regiones }}, stringr::regex("a(i|y)s(e|\u00e9)n", ignore_case = TRUE)) ~ "Ays\u00e9n del General Carlos Iba\u00f1ez del Campo",
      stringr::str_detect({{ regiones }}, stringr::regex("magall", ignore_case = TRUE)) ~ "Magallanes y la Ant\u00e1rtica Chilena",
      TRUE ~ as.character({{ regiones }})
    )
  }

    if (nombre_corto == TRUE) {
      regiones <- dplyr::case_when(
        stringr::str_detect({{ regiones }}, stringr::regex("(R\\.*M\\.*|metropol)", ignore_case = TRUE )) ~ "Metropolitana",
        stringr::str_detect({{ regiones }}, stringr::regex("higg", ignore_case = TRUE)) ~ "O'Higgins",
        stringr::str_detect({{ regiones }}, stringr::regex("a(i|y)s(e|\u00e9)n", ignore_case = TRUE)) ~ "Ays\u00e9n",
        stringr::str_detect({{ regiones }}, stringr::regex("magall", ignore_case = TRUE)) ~ "Magallanes",
        TRUE ~ as.character({{ regiones }})
      )
    }
    return(regiones)
}
