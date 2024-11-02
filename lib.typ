#let header(number, class: "Math 3551 - Fall 2024") = {
  // set text(font: "New Computer Modern Math")
  align(center)[
    #class \
    Sylvan Franklin - Homework #number
  ]
}

#let ans(body) = {
 set enum(numbering: "1. ")
 block(inset: 1em)[
   #body
 ]
}

#let prf = thmproof("proof", "Proof")
#let iff = $<==>$
#let inv(content) = {$content^(-1)$}
#let implies = $==>$

#let q(body) = {
  set enum(numbering: "(a)")
  body
}

