% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hdata.R
\docType{data}
\name{hdata}
\alias{hdata}
\title{Thermodynamic Data}
\format{
A data frame with 50 rows and 13 variables:
\describe{
\item{name}{Name of the compound.}
\item{formula}{Chemical formula of the compound.}
\item{physical_state}{Physical state of the compound (e.g., solid, liquid, gas).}
\item{enthalpy_formation}{Standard enthalpy of formation in kJ/mol.}
\item{temperature}{Standard temperature in Kelvin (K).}
\item{pressure}{Standard pressure in bar.}
\item{molar_mass}{Molar mass in grams per mole (g/mol).}
\item{specific_heat}{Specific heat capacity in joules per gram per Kelvin (J/(g·K)).}
\item{density}{Density in grams per cubic centimeter (g/cm³).}
\item{power}{Power in watts (W).}
\item{duration}{Duration in hours (h).}
\item{intensity}{Intensity in watts (W) over duration (h).}
\item{production}{Production in watts (W) over duration (h).}
}
}
\source{
\url{https://webbook.nist.gov/}
}
\usage{
hdata
}
\description{
A dataset containing thermodynamic properties of common compounds.
}
\keyword{datasets}
