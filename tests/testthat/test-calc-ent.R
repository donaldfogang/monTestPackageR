test_that("calc_ent calculates delta_H correctly using custom values", {
  # Define example product and reactant enthalpies
  prod_enthalpies <- c(-285.83, -393.51)
  reac_enthalpies <- c(-74.87, -45.9)

  # Set use_hdata to FALSE to use provided values
  expected_delta_H <- sum(prod_enthalpies) - sum(reac_enthalpies)

  # Call the function with custom values
  actual_delta_H <- calc_ent(prod_enthalpies, reac_enthalpies, use_hdata = FALSE)

  # Compare the expected and actual ΔH
  expect_equal(actual_delta_H, expected_delta_H)
})
