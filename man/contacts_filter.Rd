\name{contacts_filter}
\alias{contacts_filter}
\title{Contacts Filter}
\description{
This function creates a select input filter for contacts in a Reactable table.
}
\usage{
contacts_filter(values, name)
}
\arguments{
\item{values}{A vector of unique values for the filter.}
\item{name}{The name of the filter.}
}
\value{
A HTML select input element.
}
\examples{
contacts_filter(c("John", "Jane", "Doe"), "Name")
}
