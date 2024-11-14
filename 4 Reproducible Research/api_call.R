# Load necessary libraries
library(httr)
library(glue)
library(jsonlite)

# Define the function
llama3 <- function(model_param, x, temperature = 0.2, max_new_tokens = 10) {
  # Define the URL
  url <- "https://turbo.skynet.coypu.org/"
  
  # Create the request payload as a list
  data <- list(
    messages = list(
      list(
        role = "user",
        content = paste0(model_param, "\n", x)
      )
    ),
    temperature = temperature,
    max_new_tokens = max_new_tokens
  )
  
  # Attempt the POST request
  tryCatch({
    # Make the POST request, encoding the body as JSON
    response <- POST(url, body = data, encode = "json")
    
    # Check if the request was successful
    if (status_code(response) == 200) {
      # Parse the response content
      content_data <- content(response, as = "parsed", type = "application/json")
      
      # Extract and return the "content" field if available
      return(content_data$content)
    } else {
      # Handle the case where the request fails
      stop("Request failed with status code: ", status_code(response))
    }
  }, error = function(e) {
    # Catch and return any errors encountered
    return(e$message)
  })
}

## Prompts can be understood as two parts: a context "instantiating" model parameters, and an independent variable.


# Example of in-context learning: machine translation
model_param <- "English: Hello, German: Hallo"
x <- "English: are you fine?"
y <- llama3(model_param, x) 
print(y)


# Use glue to create a formatted string
# Define substrings
en <- "Bye"
de <- "Ciao"

# glue together template and substrings to construct a dictionary
dictionary <- glue("English: {en}, German: {de}")
print(dictionary)

# define dictionary look-up key
key <- "English: Whatsup?"
value <- llama3(dictionary, key)
print(value)
