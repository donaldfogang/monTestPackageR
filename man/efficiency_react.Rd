% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/efficiency-react.R
\name{efficiency_react}
\alias{efficiency_react}
\title{Calculate Reaction Efficiency}
\usage{
efficiency_react(delta_H, input_energy)
}
\arguments{
\item{delta_H}{A numeric value representing the change in enthalpy of the reaction (in kJ).}

\item{input_energy}{A numeric value representing the input energy provided to the reaction (in kJ).}
}
\value{
A character string describing the type of reaction (exothermic or endothermic)
and the efficiency as a percentage.
}
\description{
This function calculates the efficiency of a chemical reaction based on
the change in enthalpy (\code{delta_H}) and the input energy provided.
It returns a message indicating whether the reaction is exothermic or
endothermic, along with the calculated efficiency in percentage.
}
\examples{
# Example of an exothermic reaction
delta_H_exo <- -500  # Variation in enthalpy in kJ
input_energy_exo <- 200  # Input energy in kJ
efficiency_react(delta_H_exo, input_energy_exo)
# Expected output: "The reaction is exothermic with an efficiency of -250.00\%"

# Example of an endothermic reaction
delta_H_endo <- 300  # Variation in enthalpy in kJ
input_energy_endo <- 200  # Input energy in kJ
efficiency_react(delta_H_endo, input_energy_endo)
# Expected output: "The reaction is endothermic with an efficiency of 150.00\%"
}
