#' Calculate Reaction Efficiency
#'
#' This function calculates the efficiency of a chemical reaction based on
#' the change in enthalpy (\code{delta_H}) and the input energy provided.
#' It returns a message indicating whether the reaction is exothermic or
#' endothermic, along with the calculated efficiency in percentage.
#'
#' @param delta_H A numeric value representing the change in enthalpy of the reaction (in kJ).
#' @param input_energy A numeric value representing the input energy provided to the reaction (in kJ).
#'
#' @return A character string describing the type of reaction (exothermic or endothermic)
#'         and the efficiency as a percentage.
#' @export
#'
#' @examples
#' # Example of an exothermic reaction
#' delta_H_exo <- -500  # Variation in enthalpy in kJ
#' input_energy_exo <- 200  # Input energy in kJ
#' efficiency_react(delta_H_exo, input_energy_exo)
#' # Expected output: "The reaction is exothermic with an efficiency of -250.00%"
#'
#' # Example of an endothermic reaction
#' delta_H_endo <- 300  # Variation in enthalpy in kJ
#' input_energy_endo <- 200  # Input energy in kJ
#' efficiency_react(delta_H_endo, input_energy_endo)
#' # Expected output: "The reaction is endothermic with an efficiency of 150.00%"
efficiency_react <- function(delta_H, input_energy) {
  # Check the input energy
  if (input_energy <= 0) stop("Input energy must be greater than zero.")

  # Calculate efficiency as a percentage
  efficiency_value <- (delta_H / input_energy) * 100

  # Format the result with the % sign
  efficiency_formatted <- sprintf("%.2f%%", efficiency_value)

  # Display a message based on the result
  if (delta_H < 0) {
    # Exothermic reaction
    return(paste("The reaction is exothermic with an efficiency of", efficiency_formatted))
  } else {
    # Endothermic reaction
    return(paste("The reaction is endothermic with an efficiency of", efficiency_formatted))
  }
}
