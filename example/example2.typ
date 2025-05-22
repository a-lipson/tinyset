// local import for package development
#import "@local/tinyset:0.2.1": *

#let author = "example author"

#show: style(author)

#problem[
  This is an example problem.
]

/* 
 * we can have leave the first set square brackets blank and we will get an unnamed proof; 
 * we can also only include one set of brackets for the content.
 */

#proof[
Here is an example proof with no name.
]

#proof[][
Here is an example proof with a blank name.
]

#proof[name][
Here is an example proof with a name.
]


