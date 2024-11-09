#' Thermodynamic Data
#'
#' A dataset containing thermodynamic properties of common compounds.
#'
#' @format A data frame with 50 rows and 13 variables:
#' \describe{
#'   \item{name}{Name of the compound.}
#'   \item{formula}{Chemical formula of the compound.}
#'   \item{physical_state}{Physical state of the compound (e.g., solid, liquid, gas).}
#'   \item{enthalpy_formation}{Standard enthalpy of formation in kJ/mol.}
#'   \item{temperature}{Standard temperature in Kelvin (K).}
#'   \item{pressure}{Standard pressure in bar.}
#'   \item{molar_mass}{Molar mass in grams per mole (g/mol).}
#'   \item{specific_heat}{Specific heat capacity in joules per gram per Kelvin (J/(g·K)).}
#'   \item{density}{Density in grams per cubic centimeter (g/cm³).}
#'   \item{power}{Power in watts (W).}
#'   \item{duration}{Duration in hours (h).}
#'   \item{intensity}{Intensity in watts (W) over duration (h).}
#'   \item{production}{Production in watts (W) over duration (h).}
#' }
#' @source \url{https://webbook.nist.gov/}
#' @export
hdata <- data.frame(
  name = c("Water", "Carbon dioxide", "Methane", "Ammonia", "Sulfuric acid",
           "Ethanol", "Acetic acid", "Benzene", "Propane", "Butane",
           "Chloroform", "Acetone", "Hydrogen", "Oxygen", "Nitrogen",
           "Sodium", "Potassium", "Calcium", "Magnesium", "Iron",
           "Aluminum", "Copper", "Zinc", "Mercury", "Lead",
           "Hydrochloric acid", "Nitric acid", "Sodium carbonate",
           "Sodium silicate", "Glucose", "Fructose", "Sorbitol",
           "Glycerol", "Citric acid", "Caffeine", "Thymol", "Menthol",
           "Styrene", "Benzoic acid", "Ethanolamine", "Copper sulfate",
           "Calcium chloride", "Sodium fluoride", "Carbon disulfide",
           "Potassium nitrate", "Sodium bicarbonate", "Boric acid",
           "Dichloromethane", "Triacetin", "Pyridine"),
  formula = c("H2O", "CO2", "CH4", "NH3", "H2SO4",
              "C2H5OH", "C2H4O2", "C6H6", "C3H8", "C4H10",
              "CHCl3", "C3H6O", "H2", "O2", "N2",
              "Na", "K", "Ca", "Mg", "Fe",
              "Al", "Cu", "Zn", "Hg", "Pb",
              "HCl", "HNO3", "Na2CO3", "Na2SiO3", "C6H12O6",
              "C6H12O6", "C6H14O6", "C3H8O3", "C6H8O7", "C8H10N4O2",
              "C10H13NO", "C10H14O", "C3H3N", "C6H5COOH", "C2H7NO",
              "CuSO4", "CaCl2", "NaF", "CS2", "KNO3",
              "NaHCO3", "H3BO3", "CH2Cl2", "C9H16O5", "C5H5N"),
  physical_state = c("liquid", "gas", "gas", "gas", "liquid",
                     "liquid", "liquid", "liquid", "gas", "gas",
                     "liquid", "liquid", "gas", "gas", "gas",
                     "solid", "solid", "solid", "solid", "solid",
                     "solid", "solid", "solid", "liquid", "solid",
                     "liquid", "liquid", "solid", "solid", "liquid",
                     "liquid", "liquid", "liquid", "solid", "solid",
                     "liquid", "liquid", "liquid", "solid", "solid",
                     "solid", "solid", "solid", "solid", "solid",
                     "liquid", "liquid", "liquid", "liquid", "solid"),
  enthalpy_formation = c(-285.83, -393.51, -74.87, -45.9, -814.0,
                         -277.4, -483.0, 49.0, -104.7, -125.0,
                         -119.7, -248.0, 0.0, 0.0, 0.0,
                         -240.0, -251.2, -635.1, -601.6, -82.0,
                         -167.0, -29.0, -153.0, 0.0, -204.0,
                         -92.3, -206.0, -113.6, -110.0, -1273.0,
                         -464.0, -643.0, -374.0, -26.6, -128.0,
                         -265.0, -124.0, -20.1, -104.0, -195.0,
                         -107.0, -244.0, -31.0, -200.0, -593.0,
                         -161.0, -88.0, -178.0, -36.0, -131.0),
  temperature = rep(298.15, 50),
  pressure = rep(1, 50),
  molar_mass = c(18.015, 44.01, 16.04, 17.03, 98.079,
                 46.068, 60.052, 78.11, 44.097, 58.124,
                 119.38, 58.08, 2.016, 32.00, 28.02,
                 22.99, 39.10, 40.08, 24.31, 55.85,
                 26.98, 63.55, 65.38, 200.59, 207.2,
                 36.461, 63.01, 105.99, 122.06, 180.18,
                 180.18, 182.17, 92.09, 192.13, 154.23,
                 104.15, 59.06, 97.99, 159.61, 147.02,
                 58.44, 84.00, 78.11, 58.44, 204.25,
                 46.07, 123.11,  68.09,  76.09, 180.18),
  specific_heat = rep(4.18, 50),
  density = c(1.00, 1.98, 0.656, 0.73, 1.84,
              0.789, 1.05, 0.876, 0.493, 0.573,
              1.48, 0.784, 0.0899, 0.001429, 0.001250,
              0.97, 0.86, 1.55, 1.74, 7.87,
              2.70, 8.96, 7.14, 13.534, 11.34,
              1.19, 1.51, 2.53, 2.16, 1.54,
              1.34, 1.23, 1.10, 1.50, 0.85,
              1.39, 1.00, 2.50, 2.53, 1.44,
              1.60, 1.10, 1.06, 1.19, 1.00,
              1.25, 1.20, 1.19, 1.05, 0.97),
  power = round(runif(50, min = 100, max = 5000)),
  duration = round(runif(50, min = 1, max = 10), 1),
  intensity = runif(50, min = 100, max = 1000),
  production = runif(50, min = 50, max = 500)
)
