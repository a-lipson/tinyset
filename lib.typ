// custom shorthands, feel free to comment these out if they are in the way.
#let inv(expression) = { $(expression)^(-1)$ }
#let implies = $==>$
#let wlog = "without loss of generatlity"
#let Wlog = "Without loss of generatlity"
#let atc = [Assume towards $==><==$]
#let impl = $==>$
#let iff = $<==>$
#let qed = [#v(0.2em)#h(1fr)$square.big$]

// environments
#let ans(body) = { [#par(justify: true)[#body]] }
#let prf(body) = { ans[_Proof:_ #body #qed] }
#let qs(body) = {
  set enum(numbering: "(a)")
  body
}
#let pt(body) = {
  body
}
