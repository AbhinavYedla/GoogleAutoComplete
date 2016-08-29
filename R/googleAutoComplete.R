##############################################################################
#                                             Google Auto Complete           #
##############################################################################
#' @title
#' Google Search Autocomplete
#'
#' @description
#' This function is used to get google search auto complete suggestion.
#' You can get country specific google auto complete results and language
#' specific results.
#'
#' @param query
#' The term for which autocomplete results are retrieved.
#'
#' @param country
#' Get only the country specific results not global results.
#'
#' @param searchLang
#' Language in which search is made.
#'
#' @param webInterfaceLang
#' Language of google search page.
#'
#' @details
#' \code{country} make sure that results retrieved for \code{query} are local
#' to mentioned country. \code{webInterfaceLang} parameter is for search
#' suggestions in specific language. \code{searchLang} is used to make search
#' in specific language. Please refer to \code{gSubDomain} data frame for
#' country availability and country codes. \code{gSearchLang} and
#' \code{gWebInLang} for search language and search web interface
#' availability respectively.
#'
#' @return
#' An list of terms based on the query.
#'
#' @examples
#' google_autocomplete("Where is olympics", "com","lang_en","en")
#'
#' google_autocomplete("total athletes", "com")
#'
#' @author
#' Abhinav Yedla \email{abhinavyedla@gmail.com}
#'
#' @references
#' https://sites.google.com/site/tomihasa/google-language-codes
#' https://en.wikipedia.org/wiki/List_of_Google_domains
#'
#' @keywords
#' Google Auto Complete Suggestions
#'
#' @seealso
#' \code{\link{gSearchLang},\link{gSubDomain},\link{gWebInLang}}
#'
#' @note
#' Too many requests can get you blocked. Have delay of 1-2 Sec for each request
#'
#' @import xml2
#'
#' @export

google_autocomplete <-
  function(query,
           country = "com",
           searchLang = "lang_en",
           webInterfaceLang = "en") {
    #If query is missing stop the program
    if (missing(query))
    {
      stop("Please enter query and try again")
    }
    
    
    #Get the domain name for a given country
    domainName <-
      as.character(gSubDomain[tolower(gSubDomain$Code) == country, 3])
    
    #Check if country code is correct or not
    if (identical(domainName, character(0))) {
      stop("Please re check your country short code")
    }
    
    if (!searchLang %in% gSearchLang$Code) {
      stop(
        "Please check the search Language. Refer to gSearchLang data frame for avaliable search languages"
      )
    }
    
    if (!webInterfaceLang %in% gWebInLang$Code) {
      stop(
        "Please check the Web Interface Language. Refer to gWebInLang data frame for avaliable web interface languages"
      )
    }
    
    query <- gsub(pattern = " ", replacement = "%20", query)
    query <- tolower(query)
    
    country <- tolower(country)
    webInterfaceLang <- tolower(webInterfaceLang)
    
    #Construct the url
    subDomain <-
      paste0("http://clients1.", domainName)
    
    webInterfaceLang <- paste0("hl=", webInterfaceLang)
    searchLang <- paste0("&lr=", searchLang)
    query <- paste0("q=", query)
    
    url <-
      paste0(
        subDomain,
        "/complete/search?",
        webInterfaceLang,
        searchLang,
        "&output=toolbar&",
        query
      )
    
    tryCatch({
      #Read the xml data from url
      xmlData <- read_xml(url)
      
      xmlChildren <- xml_find_all(xmlData, ".//suggestion")
      
      result <- data.frame(xml_attr(xmlChildren, "data"))
      
      colnames(result) <- "Result"
      
      return(result)
    }, error = function(ex) {
      cat("An error was detected")
      cat("Please check language and country code")
      
      
    }, finally = {
      closeAllConnections()
      
    })
  }