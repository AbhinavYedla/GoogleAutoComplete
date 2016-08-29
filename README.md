Google Search Autocomplete

Description

This function is used to get google search auto complete suggestion. You can get country specific google auto complete results and language specific results.

Usage

googleAutoComplete(query, country = "com", searchLang = "lang_en",
  webInterfacewebInterfaceLang = "en")
Arguments

query	
The term for which autocomplete results are retrieved.
country	
Get only the country specific results not global results.
searchLang	
Language in which search is made.
webInterfaceLang	
Language of google search page.
Details

country make sure that results retrieved for query are local to mentioned country. webInterfaceLang parameter is for search suggestions in specific language. searchLang is used to make search in specific language. Please refer to googleSubDomain data frame for country availability and country codes. googleSearchLang and googleWebInterfaceLang for search language and search web interface availability respectively.

Value

An list of terms based on the query.

Note

Please use it fair. Too many requests can get you blocked.

Author(s)

Shawn Dorius sdorius@iastate.edu

Abhinav Yedla abhinavyedla@gmail.com

References

https://sites.google.com/site/tomihasa/google-language-codes 
https://en.wikipedia.org/wiki/List_of_Google_domains

See Also

googleSearchLang,googleWebInterfaceLang

Examples

googleAutoComplete("Where is olympics", "com","lang_en","en")
Results:
Where is olympics 2020
Where is olympics 2016
Where is olympics 2024
Where is olympics 2016 held

googleAutoComplete("total athletes", "com")
Results:
total athletes in 2014 Olympics
total athletes in 2014 winter Olympics
total athletes in the 2012 Olympics
