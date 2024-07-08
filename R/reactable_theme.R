# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   https://r-pkgs.org
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

box::use(
  reactable,
  shiny,
  reactR,
  htmltools,
)

#' Background Color
#'
#' This variable defines the background color for the reactable theme.
#'
#' @export
bgColor <- "#dddddd"

#' Font Size
#'
#' This variable defines the font size for the reactable theme.
#'
#' @export
fontsize <- "0.8rem"

#' Header Font Size
#'
#' This variable defines the font size for the table headers.
#'
#' @export
headerFontsize <- "0.9rem"

#' Level 1 Color
#'
#' This variable defines the color for level 1 elements.
#'
#' @export
level1color <- "#B0B0B0"

#' Level 2 Color
#'
#' This variable defines the color for level 2 elements.
#'
#' @export
level2color <- "#D0D0D0"

#' Level 3 Color
#'
#' This variable defines the color for level 3 elements.
#'
#' @export
level3color <- "#E8E8E8"

#' Level 4 Color
#'
#' This variable defines the color for level 4 elements.
#'
#' @export
level4color <- "#F0F0F0"

#' Level 5 Color
#'
#' This variable defines the color for level 5 elements.
#'
#' @export
level5color <- "#F8F8F8"

#' Level 6 Color
#'
#' This variable defines the color for level 6 elements.
#'
#' @export
level6color <- "#FFFFFF"

#' Filter Background Color
#'
#' This variable defines the background color for filters.
#'
#' @export
filter_bgColor <- "#1c1c1c"

#' Font Color for Styles
#'
#' This variable defines the font color for various styles.
#'
#' @export
style_font_color <- "#000000"

#' Create Reactable Theme
#'
#' This function creates a custom reactable theme with specified styles for various elements.
#'
#' @param paddingBottom Bottom padding for the search input style.
#' @param paddingTop Top padding for the search input style.
#' @export
theme <- function(paddingBottom = "0.5rem", paddingTop = "0.5rem") {
  reactable::reactableTheme(
    backgroundColor = bgColor,
    searchInputStyle = list(
      paddingLeft = "1.9rem",
      paddingTop = paddingTop,
      paddingBottom = paddingBottom,
      width = "20%",
      border = "none",
      backgroundColor = "hsl(0, 0%, 10%)",
      backgroundSize = "1rem",
      backgroundPosition = "left 0.5rem center",
      backgroundRepeat = "no-repeat",
      "&:focus" = list(
        backgroundColor = "rgba(255, 255, 255, 0.1)",
        border = "none"
      ),
      "::placeholder" = list(
        color = "hsl(0, 0%, 55%)"
      ),
      "&:hover::placeholder, &:focus::placeholder" = list(
        color = "hsl(0, 0%, 95%)"
      )
    ),
    headerStyle = list(
      backgroundColor = "#ffb672", # Açık gri
      color = "#222222",           # Koyu gri
      borderBottom = "none",
      paddingBottom = "0",
      marginBottom = "0",
      fontWeight = "bold"          # Doğru yazım: fontWeight
    ),
    filterInputStyle = list(
      backgroundColor = "#bfbfbf", # Hafif pastel mavi (diğer stil öğelerine uygun)
      backgroundSize = "1rem",
      marginTop = "-10px",
      marginBottom = "0"
    ),
    cellStyle = style_()
  )
}
#' Header Style
#'
#' This function returns a list of style properties for table headers.
#'
#' @export
header_style <- function() {
  list(background = filter_bgColor, color = level1color)
}

#' Cell Style
#'
#' This function returns a list of style properties for table cells.
#'
#' @export
style_ <- function() {
  list(fontSize = fontsize, color = style_font_color, fontWeight = 600)
}

#' Minimum Width
#'
#' This variable defines the minimum width for table columns.
#'
#' @export
min_width <- 1

#' Style for Positive and Negative Values
#'
#' This function returns a style list for positive and negative values.
#'
#' @param value A numeric value to be styled.
#' @export
style.red.green <- function(value) {
  if (!is.na(value) & value != 0) {
    if (value > 0 & !is.infinite(value)) {
      color <- "#02c902"
    } else if (value < 0 & !is.infinite(value)) {
      color <- "#FF0000"
    } else {
      color <- "grey"
    }
    list(color = color, fontWeight = "bold")
  }
}

#' Dependencies for Material-UI Components
#'
#' This function returns the necessary HTML dependencies to use Material-UI components in a Shiny application.
#'
#' @export
muiDependency <- function() {
  list(
    html_dependency_react(),
    htmlDependency(
      name = "mui",
      version = "5.13.1",
      src = c(href = "https://unpkg.com/@mui/material@5.6.3/umd/"),
      script = "material-ui.production.min.js"
    )
  )
}
