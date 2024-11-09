test_that("efficiency_react function works correctly", {
  # Test case 1: Exothermic reaction
  delta_H_exo <- -500  # Variation in enthalpy in kJ
  input_energy_exo <- 200  # Input energy in kJ
  expected_output_exo <- "The reaction is exothermic with an efficiency of -250.00%"
  actual_output_exo <- efficiency_react(delta_H_exo, input_energy_exo)
  expect_equal(actual_output_exo, expected_output_exo)

  # Test case 2: Endothermic reaction
  delta_H_endo <- 300  # Variation in enthalpy in kJ
  input_energy_endo <- 200  # Input energy in kJ
  expected_output_endo <- "The reaction is endothermic with an efficiency of 150.00%"
  actual_output_endo <- efficiency_react(delta_H_endo, input_energy_endo)
  expect_equal(actual_output_endo, expected_output_endo)

  # Test case 3: Zero input energy
  delta_H_zero_input <- 100
  input_energy_zero <- 0
  expect_error(efficiency_react(delta_H_zero_input, input_energy_zero), "Input energy must be greater than zero.")
})
