#' Check if the Reaction is Exothermic
#'
#' This function checks whether a given reaction is exothermic based on the change in
#' enthalpy (delta_H). A reaction is considered exothermic if it releases heat to its surroundings,
#' resulting in a negative delta_H value.
#'
#' @param delta_H A numeric value representing the change in enthalpy (delta_H) for the reaction.
#'                It should be a single numeric value resulting from the calculation of enthalpy.
#'
#' @return A logical value:
#'         - TRUE if the reaction is exothermic (delta_H < 0)
#'         - FALSE if the reaction is not exothermic (delta_H ≥ 0)
#' @export
#'
#' @examples
#' # Example of checking if a reaction is exothermic
#' delta_H <- -50.0  # Example delta_H value
#' is_exo(delta_H)   # Should return TRUE
#'
#' delta_H <- 10.0   # Another example ΔH value
#' is_exo(delta_H)   # Should return FALSE
is_exo <- function(delta_H) {
  # Return TRUE if ΔH is negative (exothermic)
  return(delta_H < 0)
}
