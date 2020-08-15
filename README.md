
<!-- README.md is generated from README.Rmd. Please edit that file -->

# territorial

<!-- badges: start -->

[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)

<!-- badges: end -->

El objetivo del paquete **territorial** es proveer funciones de limpieza
para datos sobre unidades administrativas de organización territorial.
El paquete se encuentra actualmente en desarrollo y están disponibles
solo las funciones para estandarizar nombres de regiones de Chile y para
convertir el código numérico a nombre.

## Instalación

``` r
#install.packages("remotes")
remotes::install_github("rivaquiroga/territorial")
```

## Ejemplo

Es habitual encontrarnos con datos en que los nombres de regiones no se
encuentran escritos de manera uniforme, sobre todo cuando son datos que
han sido ingresados manualmente. Eso hace que sea difícil trabajar con
ellos y que tengamos que dedicar tiempo a normalizar los nombres.

``` r

datos_regionales
#> # A tibble: 10 x 2
#>    region                                    valor
#>    <chr>                                     <dbl>
#>  1 Biobio                                     0.65
#>  2 Bio-bío                                    0.54
#>  3 Valpo                                      0.67
#>  4 Valparaiso                                 0.74
#>  5 RM                                         0.66
#>  6 R. Metropolitana                           0.83
#>  7 Metropolitana                              0.75
#>  8 Aisén                                      0.75
#>  9 Aisén del General Carlos Ibañez del Campo  0.75
#> 10 Aysén del Gral. Carlos Ibañez              0.5
```

El objetivo del paquete `territorial` es ofrecer funciones sencillas de
limpieza de datos que permitan hacer más fácil el trabajo con este tipo
de variables. A continuación se muestra cómo se podría utilizar la
función `estandariza_regiones()` en conjunto con `dplyr::mutate()` para
los datos anteriores:

``` r

library(territorial)
library(dplyr)

mutate(datos_regionales, region = estandariza_regiones(region))
#> # A tibble: 10 x 2
#>    region                                    valor
#>    <chr>                                     <dbl>
#>  1 Biobío                                     0.65
#>  2 Biobío                                     0.54
#>  3 Valparaíso                                 0.67
#>  4 Valparaíso                                 0.74
#>  5 Metropolitana de Santiago                  0.66
#>  6 Metropolitana de Santiago                  0.83
#>  7 Metropolitana de Santiago                  0.75
#>  8 Aysén del General Carlos Ibañez del Campo  0.75
#>  9 Aysén del General Carlos Ibañez del Campo  0.75
#> 10 Aysén del General Carlos Ibañez del Campo  0.5
```

Por defecto, la función devuelve el nombre oficial de la región. Si se
utiliza el argumento `nombre_corto = TRUE`, la función devuelve el
nombre cuatro de las cuatro regiones para las que su nombre oficial no
es el más extendido:

| `nombre_corto = FALSE` (valor por defecto) | `nombre_corto = TRUE` |
| ------------------------------------------ | --------------------- |
| Metropolitana de Santiago                  | Metropolitana         |
| Libertador General Bernardo O’Higgins      | O’Higgins             |
| Aysén del General Carlos Ibañez del Campo  | Aysén                 |
| Magallanes y la Antártica Chilena          | Magallanes            |

``` r
mutate(datos_regionales, region = estandariza_regiones(region, nombre_corto = TRUE))
#> # A tibble: 10 x 2
#>    region        valor
#>    <chr>         <dbl>
#>  1 Biobío         0.65
#>  2 Biobío         0.54
#>  3 Valparaíso     0.67
#>  4 Valparaíso     0.74
#>  5 Metropolitana  0.66
#>  6 Metropolitana  0.83
#>  7 Metropolitana  0.75
#>  8 Aysén          0.75
#>  9 Aysén          0.75
#> 10 Aysén          0.5
```
