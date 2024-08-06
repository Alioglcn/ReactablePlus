\name{custom_reactable}
\alias{custom_reactable}
\title{Create Custom Reactable}
\description{
This function creates a custom reactable with specified common styles for light theme apps.
}
\usage{
custom_reactable(data, ns, columns, paginateSubRows = TRUE,
  resizable = TRUE, striped = FALSE, wrap = FALSE, pagination = TRUE,
  showPagination = TRUE, showPageSizeOptions = TRUE, filterable = TRUE,
  highlight = FALSE, height = "500", width = "100%", selection = "multiple", ...)
}
\arguments{
  \item{data}{A data frame to display in the reactable.}
  \item{ns}{A namespace function to prefix input IDs for Shiny modules.}
  \item{columns}{A list of column definitions for the reactable.}
  \item{paginateSubRows}{Logical, whether to paginate sub-rows. Default is TRUE.}
  \item{resizable}{Logical, whether columns are resizable. Default is TRUE.}
  \item{striped}{Logical, whether to display striped rows. Default is FALSE.}
  \item{wrap}{Logical, whether to wrap text in cells. Default is FALSE.}
  \item{pagination}{Logical, whether to enable pagination. Default is TRUE.}
  \item{showPagination}{Logical, whether to show pagination controls. Default is TRUE.}
  \item{showPageSizeOptions}{Logical, whether to show page size options. Default is TRUE.}
  \item{filterable}{Logical, whether to enable filtering. Default is TRUE.}
  \item{highlight}{Logical, whether to highlight rows on hover. Default is FALSE.}
  \item{height}{The height of the table in pixels or as a percentage. Default is "500".}
  \item{width}{The width of the table in pixels or as a percentage. Default is "100%".}
  \item{selection}{The selection mode for rows ("multiple", "single", or "none"). Default is "multiple".}
  \item{...}{Additional arguments passed to the reactable function.}
}
\value{
A reactable object that can be rendered in Shiny applications.
}
\examples{
library(reactable)
library(shiny)

data <- data.frame(
  Name = c("John", "Paul", "George", "Ringo"),
  Age = c(30, 28, 32, 35)
)

columns <- list(
  Name = colDef(name = "Name"),
  Age = colDef(name = "Age")
)

ui <- fluidPage(
  custom_reactable(data, ns = NS("example"), columns = columns)
)

server <- function(input, output, session) {}

shinyApp(ui, server)
}
\seealso{
\code{\link{reactable}}
}
\author{
Ali Ogulcan Et \email{ali_ogulcan06@hotmail.com}
}
