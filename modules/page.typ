#let today = datetime.today()

// title with author name and date
#let title(title, author) = [
  #align(center)[
    #text(size: 18pt, weight: "bold")[#title] \
    #v(0.5em)
    #author \
    #v(0.5em)
    #today.display("[month repr:long] [day], [year]")
  ]
]

// heading with author name and date with a separator line
#let header(author) = [
  #grid(
    columns: (1fr, 1fr),
    align(left)[#author],
    align(right)[#today.display("[month repr:long] [day], [year]")],
  )
  #line(length: 100%)
]

// style option with different first page
#let style(
  author, // required
  page_numbering: "1/1",
  enum_numbering: "(a)",
  heading_numbering: "1.",
  font_family: "New Computer Modern", // latex default font
  font_size: 11pt,
) = {
  doc => {
    set page(
      header: context {
        if counter(page).get().first() > 1 [
          #header(author)
        ]
      },
      numbering: page_numbering,
    )
    set text(font: font_family, size: font_size)
    set enum(numbering: enum_numbering, spacing: 1.5em)
    set heading(numbering: heading_numbering)

    show heading: it => {
      it
      v(0.5em)
    }

    doc // return context
  }
}

