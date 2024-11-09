#' Calculate the Enthalpy Change of a Reaction
#'
#' This function calculates the enthalpy change (ΔH) for a given reaction
#' using either user-provided enthalpy values or those from the hdata dataset.
#' Users can provide either product/reactant names or chemical formulas.
#'
#' @param prod A character vector of product names or formulas, or a numeric vector of product enthalpy values.
#' @param reac A character vector of reactant names or formulas, or a numeric vector of reactant enthalpy values.
#' @param use_hdata A logical indicating whether to use the hdata dataset (default is TRUE).
#' @return The enthalpy change of the reaction.
#' @examples
#' # Using custom values
#' calc_ent(c(-285.83, -393.51), c(-74.87, -45.9), use_hdata = FALSE)
#'
#' calc_ent(prod = c(-285.83, -393.51), reac = c(-74.87, -45.9), use_hdata = FALSE)
#'
#' prod <- c(-285.83, -393.51)
#' reac <- c(-74.87, -45.9)
#' calc_ent(prod, reac, use_hdata = FALSE)
#'
#' # Using the hdata dataset with names
#' calc_ent(c("Water", "Carbon dioxide"), c("Methane", "Ammonia"))
#'
#' calc_ent(prod = c("Water", "Carbon dioxide"), reac = c("Methane", "Ammonia"))
#'
#' prod <- c("Water", "Carbon dioxide")
#' reac <- c("Methane", "Ammonia")
#' calc_ent(prod, reac)
#'
#' # Using the hdata dataset with formulas
#' calc_ent(c("H2O", "CO2"), c("CH4", "NH3"))
#'
#' calc_ent(prod = c("H2O", "CO2"), reac = c("CH4", "NH3"))
#'
#' prod <- c("H2O", "CO2")
#' reac <- c("CH4", "NH3")
#' calc_ent(prod, reac)
#' @export
calc_ent <- function(prod, reac, use_hdata = TRUE) {
  if (use_hdata) {
    # Charger le dataset hdata
    hdata <- EcoTherm::hdata

    # Vérifier si les entrées sont des formules ou des noms
    if (all(prod %in% hdata$name)) {
      prod_enthalpies <- hdata$enthalpy_formation[hdata$name %in% prod]
    } else {
      prod_enthalpies <- hdata$enthalpy_formation[hdata$formula %in% prod]
    }

    if (all(reac %in% hdata$name)) {
      reac_enthalpies <- hdata$enthalpy_formation[hdata$name %in% reac]
    } else {
      reac_enthalpies <- hdata$enthalpy_formation[hdata$formula %in% reac]
    }

    # Vérifier si tous les produits et réactifs sont trouvés
    if (length(prod_enthalpies) != length(prod)) {
      warning("Some product names or formulas were not found in hdata.")
    }
    if (length(reac_enthalpies) != length(reac)) {
      warning("Some reactant names or formulas were not found in hdata.")
    }
  } else {
    # Si hdata n'est pas utilisé, convertir l'entrée en numérique
    prod_enthalpies <- as.numeric(prod)
    reac_enthalpies <- as.numeric(reac)

    # Vérifier les valeurs NA
    if (any(is.na(prod_enthalpies))) {
      stop("Please provide valid numeric values for products.")
    }
    if (any(is.na(reac_enthalpies))) {
      stop("Please provide valid numeric values for reactants.")
    }
  }

  # Calculer ΔH
  delta_H <- sum(prod_enthalpies) - sum(reac_enthalpies)
  return(delta_H)
}
