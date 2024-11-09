#' Calculate Total Energy Consumption
#'
#' @name energy_calc
#' @import ggplot2
#' @importFrom ggplot2 ggplot aes geom_line geom_point scale_color_manual labs theme_minimal facet_wrap
#' @keywords internal
globalVariables(c("Step", "Power", "Duration"))
#'
#' This function calculates the total energy consumption from the power consumed
#' and duration, allowing the user to use their own data or a dataset.
#'
#' @param power A numeric vector of power consumed in watts (W) or kilowatts (kW).
#' @param duration A numeric vector of duration in hours (h).
#' @param use_hdata A boolean indicating whether to use the hdata dataset (default is TRUE).
#' @return Total energy consumption and a message about energy reduction.
#' @examples
#' # Using hdata
#' energy_calc(power, duration)
#'
#' # Using custom values
#' power <- c(1000, 1500, 2000)  # in watts
#' duration <- c(2, 1.5, 3)  # in hours
#' energy_calc(power, duration, use_hdata = FALSE)
#' @export
energy_calc <- function(power, duration, use_hdata = TRUE) {
  # If using hdata is true, load data from EcoTherm
  if (use_hdata) {
    hdata <- EcoTherm::hdata  # Replace with your dataset
    power <- hdata$power
    duration <- hdata$duration
  }

  # Calculate total consumption
  total_consumption <- sum(power * duration) / 1000  # in kWh

  # Message about energy consumption and reduction
  message <- paste("The total energy consumption is", total_consumption, "kWh.")
  if (total_consumption > 100) {  # Arbitrary threshold for example
    message <- paste(message, "Consider methods to reduce your consumption, such as optimizing processes or using more efficient equipment.")
  } else {
    message <- paste(message, "Your consumption is reasonable.")
  }
  print(message)

  # Prepare data for ggplot
  df <- data.frame(Step = 1:length(power), Power = power, Duration = duration)

  if (length(power) <= 49) {
    # Plot all points if there are 49 steps or fewer
    ggplot2::ggplot(df, ggplot2::aes(x = Step)) +
      ggplot2::geom_line(ggplot2::aes(y = Power, color = "Power Consumption"), size = 1) +
      ggplot2::geom_point(ggplot2::aes(y = Power, color = "Power Consumption"), size = 3) +
      ggplot2::geom_line(ggplot2::aes(y = Duration * max(Power) / max(Duration), color = "Duration"), size = 1, linetype = "dashed") +
      ggplot2::geom_point(ggplot2::aes(y = Duration * max(Power) / max(Duration), color = "Duration"), size = 3) +
      ggplot2::scale_color_manual(values = c("blue", "red")) +
      ggplot2::labs(title = "Energy Consumption by Step (Up to 49 Steps)",
                    x = "Steps",
                    y = "Power (W)",
                    color = "Legend") +
      ggplot2::theme_minimal()
  } else {
    # Create facets if there are more than 49 steps
    df$Range <- cut(df$Step, breaks = seq(1, max(df$Step) + 50, by = 50), include.lowest = TRUE, labels = FALSE)

    ggplot2::ggplot(df, ggplot2::aes(x = Step)) +
      ggplot2::geom_line(ggplot2::aes(y = Power, color = "Power Consumption"), size = 1) +
      ggplot2::geom_point(ggplot2::aes(y = Power, color = "Power Consumption"), size = 3) +
      ggplot2::geom_line(ggplot2::aes(y = Duration * max(Power) / max(Duration), color = "Duration"), size = 1, linetype = "dashed") +
      ggplot2::geom_point(ggplot2::aes(y = Duration * max(Power) / max(Duration), color = "Duration"), size = 3) +
      ggplot2::scale_color_manual(values = c("blue", "red")) +
      ggplot2::labs(title = "Energy Consumption by Step (More than 49 Steps)",
                    x = "Steps",
                    y = "Power (W)",
                    color = "Legend") +
      ggplot2::facet_wrap(~ Range, scales = "free_y") +
      ggplot2::theme_minimal()
  }
}
