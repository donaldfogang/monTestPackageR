test_that("is_exo function works correctly", {
  # Test case 1: Negative delta_H (exothermic)
  delta_H_negative <- -10
  expect_true(is_exo(delta_H_negative))

  # Test case 2: Positive delta_H (endothermic)
  delta_H_positive <- 10
  expect_false(is_exo(delta_H_positive))

  # Test case 3: Zero delta_H (neither exothermic nor endothermic)
  delta_H_zero <- 0
  expect_false(is_exo(delta_H_zero))
})
