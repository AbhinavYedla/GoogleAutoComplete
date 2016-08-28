##############################################################################
#                             Google Search Language                         #
##############################################################################
#' Goolge search language.
#'
#' @docType data
#'
#' @usage data(gSearchLang)
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
#' data(gSearchLang)
#' code <- gSearchLang[gSearchLang$Language == 'Japanese',2]
"gSearchLang"