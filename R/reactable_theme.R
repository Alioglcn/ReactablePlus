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
  reactable.extras,
  htmltools,
)

#' Background Color
#'
#' This variable defines the background color for the reactable theme.
#'
#' @export
bgColor <- "#F7FFFE"

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
level1color <- "#F7FFFE"

#' Level 2 Color
#'
#' This variable defines the color for level 2 elements.
#'
#' @export
level2color <- "#F7FFFE"

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
filter_bgColor <- "#BBD4CE"

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
      backgroundColor = "#BBD4CE", # Açık gri
      color = "#ffffff",           # Koyu gri
      borderBottom = "none",
      paddingBottom = "0",
      marginBottom = "0",
      fontWeight = "bold"          # Doğru yazım: fontWeight
    ),
    filterInputStyle = list(
      backgroundColor = "#7E9592", # Hafif pastel mavi (diğer stil öğelerine uygun)
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

#' Create Custom Reactable
#'
#' This function creates a custom reactable with specified common styles for light theme apps.
#'
#' @param data A data frame to display in the reactable.
#' @param ns A namespace function to prefix input IDs for Shiny modules.
#' @param columns A list of column definitions for the reactable.
#' @param paginateSubRows Logical, whether to paginate sub-rows. Default is TRUE.
#' @param resizable Logical, whether columns are resizable. Default is TRUE.
#' @param striped Logical, whether to display striped rows. Default is FALSE.
#' @param wrap Logical, whether to wrap text in cells. Default is FALSE.
#' @param pagination Logical, whether to enable pagination. Default is TRUE.
#' @param showPagination Logical, whether to show pagination controls. Default is TRUE.
#' @param showPageSizeOptions Logical, whether to show page size options. Default is TRUE.
#' @param filterable Logical, whether to enable filtering. Default is TRUE.
#' @param highlight Logical, whether to highlight rows on hover. Default is FALSE.
#' @param height The height of the table in pixels or as a percentage. Default is "500".
#' @param width The width of the table in pixels or as a percentage. Default is "100%".
#' @param selection The selection mode for rows ("multiple", "single", or "none"). Default is "multiple".
#' @param ... Additional arguments passed to the reactable function.
#' @export
customReactable <- function(data, ns, columns, paginateSubRows = TRUE,
                             resizable = TRUE, striped = FALSE, wrap = FALSE, pagination = TRUE, showPagination = TRUE,
                             showPageSizeOptions = TRUE, filterable = TRUE, highlight = FALSE, height = "500", width = "100%", selection = "multiple", ...){
  react <- reactable$reactable(
    data = data,
    paginateSubRows = paginateSubRows,
    resizable = resizable,
    striped = striped,
    wrap = wrap,
    width = width,
    height = height,
    pagination = pagination,
    showPagination = showPagination,
    showPageSizeOptions = showPageSizeOptions,
    selection = selection,
    onClick = "select",
    filterable = filterable,
    defaultColDef = reactable$colDef(
      footerStyle = list(fontWeight = "bold"),
      align = "center",
      style = list(
        whiteSpace = "nowrap",
        overflow = "hidden",
        textOverflow = "ellipsis"
      )
    ),
    highlight = highlight,
    theme = ReactablePlus$theme(),
    columns = columns,
    ...
  )

  return(react)
}

