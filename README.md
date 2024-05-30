# ReactablePlus

ReactablePlus is an R package providing enhanced components and themes for reactable tables in Shiny applications.

## Installation

You can install the package directly from GitHub:

```r
# Install the devtools package if you haven't already
install.packages("devtools")

# Install the ReactablePlus package from GitHub
devtools::install_github("Alioglcn/ReactablePlus")
```

## Usage

Here’s an example of how to use the package:

```r
library(shiny)
library(reactable)
library(ReactablePlus)

# Define UI for application
ui <- fluidPage(
  # Application title
  titlePanel("ReactablePlus Example"),
  
  # Reactable table with custom theme
  reactableOutput("table")
)

# Define server logic
server <- function(input, output) {
  output$table <- renderReactable({
    reactable(
      iris,
      theme = ReactablePlus::theme()
    )
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
```

## Functions and Features

### Themes and Styles

ReactablePlus provides predefined themes and styles for reactable tables. The theme function allows you to apply a custom theme to your tables easily.

```r
# Create a reactable theme with custom padding
custom_theme <- theme(paddingBottom = "1rem", paddingTop = "1rem")

# Apply the theme to a reactable table
reactable(iris, theme = custom_theme)
```

### Column Formatting

ReactablePlus includes several functions for formatting column values:

	•	col_format_dollar(digits): Format values as dollar amounts.
	•	col_format_per(digits): Format values as percentages.
	•	col_format_bps(digits): Format values as basis points.
	•	col_format_dif(digits): Format values with differences.

```r
# Example of formatting columns
reactable(
  iris,
  columns = list(
    Sepal.Length = col_format_dollar(2),
    Sepal.Width = col_format_per(1),
    Petal.Length = col_format_bps(0),
    Petal.Width = col_format_dif(1)
  )
)
```

### Custom Cell Styles

You can define custom cell styles using the style_ and style.red.green functions:

```r
# Define custom cell style
custom_style <- style_()

# Apply custom style to a reactable table
reactable(
  iris,
  defaultColDef = colDef(style = custom_style)
)
```

## JavaScript Integration

ReactablePlus also supports custom JavaScript functions for advanced customization:

```r
# Include custom JavaScript for reactable
js_code <- js_script_reactable()
shiny::tags$head(js_code)
```

## Dependencies

ReactablePlus depends on the following packages:

	•	shiny
	•	reactable
	•	reactR
	•	htmltools

These dependencies are automatically installed when you install ReactablePlus from GitHub.

## Contributing

We welcome contributions to ReactablePlus! If you find a bug, have a suggestion, or want to contribute code, please create an issue or submit a pull request on GitHub.

## Reporting Bugs

If you find a bug, please create an issue with a detailed description and steps to reproduce the problem.

## Suggesting Enhancements

If you have an idea for an enhancement, please create an issue with a detailed description of the suggestion and its benefits.

## Submitting Pull Requests

If you want to contribute code, fork the repository and create a new branch for your feature or bugfix. Ensure your code follows the existing coding style and passes all tests. Create a pull request with a detailed description of your changes and the problem they solve.

## Improving Documentation

If you find any issues in the documentation or have suggestions for improvements, please create an issue or submit a pull request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

	•	reactable
	•	shiny
	•	reactR
	•	htmltools

Thank you for using ReactablePlus! If you have any questions or need assistance, feel free to open an issue on GitHub.








 
