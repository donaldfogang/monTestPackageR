test_that("is_endo function works correctly", {
  # Test case 1: Positive delta_H (endothermic)
  delta_H_positive <- 10
  expect_true(is_endo(delta_H_positive))

  # Test case 2: Negative delta_H (exothermic)
  delta_H_negative <- -10
  expect_false(is_endo(delta_H_negative))

  # Test case 3: Zero delta_H (neither endothermic nor exothermic)
  delta_H_zero <- 0
  expect_false(is_endo(delta_H_zero))
})
