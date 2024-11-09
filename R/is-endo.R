#' Check if the Reaction is Endothermic
#'
#' This function checks whether a given reaction is endothermic based on the change in
#' enthalpy (delta_H). A reaction is considered endothermic if it absorbs heat from its surroundings,
#' resulting in a positive delta_H value.
#'
#' @param delta_H A numeric value representing the change in enthalpy (delta_H) for the reaction.
#'                It should be a single numeric value resulting from the calculation of enthalpy.
#'
#' @return A logical value:
#'         - TRUE if the reaction is endothermic (delta_H > 0)
#'         - FALSE if the reaction is not endothermic (delta_H ≤ 0)
#' @export
#'
#' @examples
#' # Example of checking if a reaction is endothermic
#' delta_H <- 25.0  # Example delta_H value
#' is_endo(delta_H)  # Should return TRUE
#'
#' delta_H <- -15.0  # Another example ΔH value
#' is_endo(delta_H)  # Should return FALSE
is_endo <- function(delta_H) {
  # Return TRUE if ΔH is positive (endothermic)
  return(delta_H > 0)
}
