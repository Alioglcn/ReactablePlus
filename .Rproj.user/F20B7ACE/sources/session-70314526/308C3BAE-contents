box::use(
  reactable,
  shiny,
  reactR,
  htmltools,
)


#' Format Values in Thousands
#'
#' This function multiplies a given value by 1000 and formats it.
#'
#' @param value A numeric value to be formatted.
#' @export
format_values_1k <- function(value) {
  value <- value * 1000
  return(format_values(value))
}

#' Column Format for Dollar Values
#'
#' This function creates a column format for dollar values.
#'
#' @param digits Number of digits to display.
#' @export
col_format_dollar <- function(digits) {
  colFormat(prefix = "$", separators = TRUE, locales = "en-US", digits = digits)
}

#' Column Format for Percentage Values
#'
#' This function creates a column format for percentage values.
#'
#' @param digits Number of digits to display.
#' @export
col_format_per <- function(digits = 1) {
  colFormat(suffix = "%", locales = "en-US", digits = digits)
}

#' Column Format for Basis Points
#'
#' This function creates a column format for basis points.
#'
#' @param digits Number of digits to display.
#' @export
col_format_bps <- function(digits = 0) {
  colFormat(suffix = " bps", locales = "en-US", digits = 0)
}

#' Column Format for Differences
#'
#' This function creates a column format for differences.
#'
#' @param digits Number of digits to display.
#' @export
col_format_dif <- function(digits = 1) {
  colFormat(separators = TRUE, locales = "en-US", digits = digits)
}

#' Column Definition for Dollar Values
#'
#' This function creates a column definition for dollar values.
#'
#' @export
coldef_dollar <- function() {
  colDef(
    format = col_format_dollar(0),
    cell = format_values
  )
}

#' Column Definition for Basis Points
#'
#' This function creates a column definition for basis points.
#'
#' @export
coldef_bps <- function() {
  colDef(
    style = style.red.green,
    format = col_format_bps(),
    cell = format_bps
  )
}

#' Column Definition for Percentage Values
#'
#' This function creates a column definition for percentage values.
#'
#' @param name
#' @param filterable An optional boolean indicating if the column is filterable.
#' @export
coldef_per <- function(name = NULL, filterable = NULL) {
  c <- colDef(
    style = style.red.green,
    align = "right",
    format = col_format_per(),
    #  format the cell value as a percentage with a comma as the big mark and a period as the decimal mark. If the value is NA, returns nothing
    cell = format_percentage
  )
  if (!is.null(name)) {
    c$name <- name
  }
  if (!is.null(filterable)) {
    c$filterMethod <- JS("filterRange")
    c$filterInput <- JS("muiRangeFilter_percentage")
    c$filterable <- TRUE
    c$style <- NULL
  }

  return(c)
}

#' Column Definition for Differences
#'
#' This function creates a column definition for differences.
#'
#' @param name An optional name for the column.
#' @param style An optional style for the column.
#' @param digits Number of digits to display.
#' @param cell_format_values An optional boolean indicating if cell values should be formatted.
#' @export
coldef_dif <- function(name = NULL, style = NULL, digits = 1, cell_format_values = NULL) {
  c <- colDef(
    format = col_format_dif(digits),
    align = "right",
    cell = format_values
  )

  if (!is.null(style)) {
    c$style <- style.red.green
  }
  if (!is.null(name)) {
    c$name <- name
  }
  if (!is.null(cell_format_values)) {
    c$cell <- NULL
  }

  return(c)
}


#' Format Values
#'
#' This function formats numeric values with appropriate units (K, M, B, T).
#'
#' @param value A numeric value to be formatted.
#' @export
format_values <- function(value) {
  if (is.na(value) || is.null(value)) {
    return(" ")
  } else if (is.numeric(value)) {
    if (value >= 1e12) {
      value <- paste0("$", abs(as.numeric(round(value/1e12, 1))), "T")
    } else if (value <= -1e12) {
      value <- paste0("-$", abs(as.numeric(round(value/1e12, 1))), "T")
    } else if (value >= 1e9) {
      value <- paste0("$", abs(as.numeric(round(value/1e9, 1))), "B")
    } else if (value <= -1e9) {
      value <- paste0("-$", abs(as.numeric(round(value/1e9, 1))), "B")
    } else if (value >= 1e6) {
      value <- paste0("$", abs(as.numeric(round(value/1e6, 1))), "M")
    } else if (value <= -1e6) {
      value <- paste0("-$", abs(as.numeric(round(value/1e6, 1))), "M")
    } else if (value >= 1e3) {
      value <- paste0("$", abs(as.numeric(round(value/1e3, 1))), "K")
    } else if (value <= -1e3) {
      value <- paste0("-$", abs(as.numeric(round(value/1e3, 1))), "K")
    } else if (value < 0 && value > -1e3) {
      value <- paste0("-$", abs(as.numeric(round(value, 1))))
    } else if (value > 0 && value < 1e3) {
      value <- paste0("$", abs(as.numeric(round(value, 1))))
    } else if (value == 0) {
      return(value)
    }
  }
  return(value)
}

#' Format Percentage Values
#'
#' This function formats numeric values as percentages.
#'
#' @param value A numeric value to be formatted.
#' @export
format_percentage <- function(value) {
  if (is.finite(value)) {
    return(paste0(format(as.numeric(value), big.mark = ",", decimal.mark = ".", scientific = FALSE), "%"))
  } else if (is.infinite(value) && value > 0) {
    return("Inf")
  } else if (is.infinite(value) && value < 0) {
    return("-Inf")
  }
}

#' Format Basis Points
#'
#' This function formats numeric values as basis points.
#'
#' @param value A numeric value to be formatted.
#' @export
format_bps <- function(value) {
  if (is.na(value) || is.null(value)) {
    return(" ")
  } else if (is.numeric(value)) {
    if (value > 0 & !is.infinite(value)) {
      value <- paste0("+ ", abs(as.numeric(round(value, 0))), " bps")
    } else if (value < 0 & !is.infinite(value)) {
      value <- paste0("- ", abs(as.numeric(round(value, 0))), " bps")
    } else if (value == 0) {
      value <- round(value, 0)
    }
  }
  return(value)
}


#' JavaScript for Reactable
#'
#' This function returns JavaScript code to be included in a Shiny application for custom Reactable functionality.
#'
#' @export
js_script_reactable <- function() {
  shiny$tags$script(shiny$HTML("
function formatValues(value) {
  if (isNaN(value) || value === null) {
    return ' ';
  } else if (typeof value === 'number') {
    if (value >= 1e12) {
      value = '$' + Math.abs((value / 1e12).toFixed(1)) + 'T';
    } else if (value <= -1e12) {
      value = '-$' + Math.abs((value / 1e12).toFixed(1)) + 'T';
    } else if (value >= 1e9) {
      value = '$' + Math.abs((value / 1e9).toFixed(1)) + 'B';
    } else if (value <= -1e9) {
      value = '-$' + Math.abs((value / 1e9).toFixed(1)) + 'B';
    } else if (value >= 1e6) {
      value = '$' + Math.abs((value / 1e6).toFixed(1)) + 'M';
    } else if (value <= -1e6) {
      value = '-$' + Math.abs((value / 1e6).toFixed(1)) + 'M';
    } else if (value >= 1e3) {
      value = '$' + Math.abs((value / 1e3).toFixed(1)) + 'K';
    } else if (value <= -1e3) {
      value = '-$' + Math.abs((value / 1e3).toFixed(1)) + 'K';
    } else if (value < 0 && value > -1e3) {
      value = '-$' + Math.abs(value.toFixed(0)) + '';
    } else if (value > 0 && value < 1e3) {
      value = '$' + Math.abs(value.toFixed(0)) + '';
    } else if (value === 0) {
      return value;
    }
  }
  return value;
}



const muiRangeFilter = (column, state) => {

 const range = React.useMemo(() => {
  let min = Infinity;
  let max = -Infinity;
  const uniqueValues = new Set(); // Benzersiz değerleri saklamak için bir Set kullanıyoruz

  state.data.forEach(row => {
    const value = row[column.id];
    if (!uniqueValues.has(value)) { // Benzersiz olmayan değerleri kontrol ediyoruz
      uniqueValues.add(value);
      if (value < min) {
        min = Math.floor(value);
      }
      if (value > max) {
        max = Math.ceil(value);
      }
    }
  });

  return [min, max];
}, [state.data]);

  const value = column.filterValue ? column.filterValue : range
  const valueLabel = `${formatValues(value[0])}...${formatValues(value[1])}`

  return React.createElement(
    'div',
    // Add some margin so the tooltips don't get cut off
    { style: { margin: '0 8px' } },
    [
      valueLabel,
      React.createElement(
        MaterialUI.Slider,
        {
          value: value,
          min: range[0],
          max: range[1],
          onChange: (e, val) => column.setFilter(val),
          'aria-label': `Filter ${column.name}`
        }
      )
    ]
  )
}

const muiRangeFilter_percentage = (column, state) => {
  const range = React.useMemo(() => {
    let min = Infinity;
    let max = -Infinity;
    let uniqueValues = new Set();

    state.data.forEach(row => {
      const value = row[column.id];
      if (!uniqueValues.has(value)) {
        uniqueValues.add(value);
        if (value < min) {
          min = Math.floor(value);
        }
        if (value > max) {
          max = Math.ceil(value);
        }
      }
    });

    return [min, max];
  }, [state.data]);

  const value = column.filterValue ? column.filterValue : range;
  const valueLabel = `${value[0]}...${value[1]}`;

  return React.createElement(
    'div',
    { style: { margin: '0 8px' } },
    [
      valueLabel,
      React.createElement(MaterialUI.Slider, {
        value: value,
        min: range[0],
        max: range[1],
        onChange: (e, val) => column.setFilter(val),
        'aria-label': `Filter ${column.name}`
      })
    ]
  );
};


const filterRange = (rows, columnId, filterValue) => {
  const [min, max] = filterValue
  return rows.filter(row => {
    const value = row.values[columnId]
    return value >= min && value <= max
  })
}"))
}

#’ Contacts Filter
#’
#’ This function creates a select input filter for contacts in a Reactable table.
#’
#’ @param values A vector of unique values for the filter.
#’ @param name The name of the filter.
#’ @export
contacts_filter <- function(values, name) {
  shiny$tags$select(
    onchange = sprintf("Reactable.setFilter('select-reactable', '%s', event.target.value)", name),
    shiny$tags$option(value = "", "All"),
    lapply(unique(values), tags$option),
    style = "width: 100%; height: 28px;"
  )
}
