##############################################################################
#                     Google Search Web Interface Language                   #
##############################################################################
#' Goolge search web interface language.
#'
#' @docType data
#'
#' @usage data(gWebInLang)
#'
#' @format An data frame with 2 columns Language and Code.
#'
#' @keywords datasets
#'
#' @references 
#' https://sites.google.com/site/tomihasa/google-language-codes
#'
#' @source \href{#' https://sites.google.com/site/tomihasa/google-language-codes}
#'
#' @examples
#' data(gWebInLang)
#' code <- gWebInLang[gWebInLang$Language == 'Hindi',2]
"gWebInLang"