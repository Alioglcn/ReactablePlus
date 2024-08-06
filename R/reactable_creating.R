box::use(
  reactable,
  shiny,
  reactR,
  htmltools,
  reactable.extras
)

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
custom_reactable <- function(data, ns, columns, paginateSubRows = TRUE,
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
