#let qed = [#v(0.2em)#h(1fr)$square.big$]

#let ans(body) = { [#par(justify: true)[#body]] }
#let prf(body) = { ans[_Proof:_ #body #qed] }
#let qs(body) = {
  set enum(numbering: "(a)")
  body
}
#let pt(body) = {
  body
}
