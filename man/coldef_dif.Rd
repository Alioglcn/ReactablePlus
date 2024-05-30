\name{coldef_dif}
\alias{coldef_dif}
\title{Column Definition for Differences}
\description{
This function creates a column definition for differences.
}
\usage{
coldef_dif(name = NULL, style = NULL, digits = 1, cell_format_values = NULL)
}
\arguments{
\item{name}{An optional name for the column.}
\item{style}{An optional style for the column.}
\item{digits}{Number of digits to display.}
\item{cell_format_values}{An optional boolean indicating if cell values should be formatted.}
}
\value{
A column definition object for differences.
}
\examples{
coldef_dif("Difference", NULL, 2, TRUE)
}
