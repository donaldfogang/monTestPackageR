#' Calculate Light Intensity
#'
#' @name intensity_calc
#' @import ggplot2
#' @importFrom ggplot2 ggplot aes geom_line geom_point scale_color_manual labs theme_minimal
#' @keywords internal
globalVariables(c("Step", "Intensity", "Production"))
#'
#' This function calculates the light intensity based on measured intensity and production values,
#' allowing the user to use their own data or a predefined dataset.
#'
#' @param intensity A numeric vector representing the measured light intensity values (in watts).
#' @param production A numeric vector representing the corresponding production values (in watts).
#' @param use_hdata A boolean indicating whether to use the predefined dataset from EcoTherm (default is TRUE).
#' @return A message indicating the total light intensity and recommendations for intensity reduction if necessary.
#' @examples
#' # Using hdata
#' intensity_calc(intensity, production)
#'
#' # Using custom values
#' custom_intensity <- c(1000, 1200, 1100)
#' custom_production <- c(500, 600, 700)
#' intensity_calc(custom_intensity, custom_production, use_hdata = FALSE)
#' @export
intensity_calc <- function(intensity, production, use_hdata = TRUE) {
  # If using hdata is true, load data from EcoTherm
  if (use_hdata) {
    intensity <- EcoTherm::hdata$intensity
    production <- EcoTherm::hdata$production
  }

  # Calculate total intensity
  total_intensity <- sum(intensity) / sum(production)  # in units of light per produced unit

  # Message about light intensity
  message <- paste("The total light intensity is", round(total_intensity, 2), "units.")

  if (total_intensity > 5) {  # Arbitrary threshold for the example
    message <- paste(message, "Consider methods to reduce intensity, such as optimizing lighting.")
  } else {
    message <- paste(message, "Your light intensity is reasonable.")
  }

  print(message)

  # Prepare data for ggplot
  df <- data.frame(Step = 1:length(intensity), Intensity = intensity, Production = production)

  # Visualization of intensity losses with improved colors
  if (length(intensity) <= 49) {
    # Plot all points if there are 49 steps or fewer
    ggplot(df, aes(x = Step)) +
      geom_point(aes(y = Intensity, color = "Light Intensity"), size = 3) +
      geom_line(aes(y = Intensity, color = "Light Intensity"), size = 1.5) +
      geom_point(aes(y = Production, color = "Production"), size = 3, shape = 17) +  # Triangle for production
      geom_line(aes(y = Production, color = "Production"), size = 1.5, linetype = "dashed") +
      scale_color_manual(values = c("forestgreen", "darkorange")) +
      labs(title = "Visualization of Light Intensity and Production (Up to 49 Steps)",
           x = "Steps",
           y = "Values",
           color = "Legend") +
      theme_minimal(base_size = 15) +
      theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 18),
            legend.position = "top",
            panel.grid.major = element_line(color = "lightgray"),
            panel.grid.minor = element_blank())
  } else {
    # Create facets if there are more than 49 steps
    df$Range <- cut(df$Step, breaks = seq(1, max(df$Step) + 50, by = 50), include.lowest = TRUE, labels = FALSE)

    ggplot(df, aes(x = Step)) +
      geom_point(aes(y = Intensity, color = "Light Intensity"), size = 3) +
      geom_line(aes(y = Intensity, color = "Light Intensity"), size = 1.5) +
      geom_point(aes(y = Production, color = "Production"), size = 3, shape = 17) +
      geom_line(aes(y = Production, color = "Production"), size = 1.5, linetype = "dashed") +
      scale_color_manual(values = c("forestgreen", "darkorange")) +
      labs(title = "Visualization of Light Intensity and Production (More than 49 Steps)",
           x = "Steps",
           y = "Values",
           color = "Legend") +
      facet_wrap(~ Range, scales = "free_y") +
      theme_minimal(base_size = 15) +
      theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 18),
            legend.position = "top",
            panel.grid.major = element_line(color = "lightgray"),
            panel.grid.minor = element_blank())
  }
}
