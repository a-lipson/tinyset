// NOTE: could just use ctheorems pkg instead!

// numbered remarks?
#let remark(body) = {
  v(0.25em)
  [_Remark_.]
  h(0.5em)
  body
  v(0.25em)
}


#let example-counter = counter("example")

#let example(body) = {
  example-counter.step()
  v(0.5em)
  context {
    [_Example_ #example-counter.display().]
    h(0.5em)
  }
  body
  v(0.5em)
}

// TODO: extract problem indexing to a preferences config

#let problem-counter = counter("problem")

#let problem(body) = {
  problem-counter.step()
  // v(0.5em)
  context {
    [*Problem* #problem-counter.display().]
    h(0.5em)
  }
  set enum(spacing: 1em)
  body
  v(0.5em)
}

#let proposition-counter = counter("proposition")

#let proposition(numbering: true, body) = {
  v(0.5em)
  if numbering {
    proposition-counter.step()
    context {
      [*Proposition* #proposition-counter.display().]
    }
  } else {
    [*Proposition*.]
  }
  h(0.5em)
  body
  v(0.5em)
}


#let definition-counter = counter("definition")

#let definition(numbering: true, body) = {
  v(0.5em)
  if numbering {
    definition-counter.step()
    context {
      [*Definition* #definition-counter.display().]
    }
  } else {
    [*Definition*.]
  }
  h(0.5em)
  body
  v(1em)
}

// #let proposition(body) = {
//   proposition-counter.step()
//   v(1em)
//   context {
//     [*Proposition* #proposition-counter.display().]
//     h(0.5em)
//     body
//     v(1em)
//   }
//   /*
//   figure(
//     body,
//     kind: "proposition",
//     caption: none,
//     supplement: [Proposition],
//     numbering: proposition-counter.display(),
//     label: none,
//   )
//   */
// }


// TODO: create environment reference tags
/*
#show ref: it => {
  if it.element != none and it.element.kind == "proposition" {
    [Prop. #it.element.numbering]
  } else {
    it
  }
}
*/

// #let ans(body) = { [#par(justify: true)[#body]] }
// #let prf(body) = { ans[_Proof:_ #body #qed] }

#let qs(body) = {
  // TODO: extract enumeration indexing type to a preferences config
  set enum(numbering: "(a)")
  body
}

// #let pt(body) = {
//   body
// }


#let qed = [#h(1fr)$square.big$]

// #let qed = align(right,
//     square(
//     size: 8pt,
//     stroke: 0.5pt,
//   ))


/*
 "Proof of <context>."
 #proof[ optional proof context  ][ body... ]

 "Proof."
 #proof[ body... ]
 #proof[][ body... ]
*/
#let proof(..args) = {
  let proof = "Proof"
  let body = none
  // only body was provided
  if args.pos().len() == 1 {
    body = args.pos().at(0)
    // both proof name and body were provided
  } else if args.pos().len() == 2 {
    // let name = args.pos().at(0)
    // if name.has("text") and name.text.trim() != "" {
    //   proof += " of " + name
    // }
    proof += " of " + args.pos().at(0)
    body = args.pos().at(1)
  }
  // v(0.5em)
  [_#proof._]
  h(0.5em)
  body
  qed
  v(0.5em)
}


#let sketch(..args) = {
  let sketch = "Sketch"
  let body = none
  // only body was provided
  if args.pos().len() == 1 {
    body = args.pos().at(0)
    // both proof name and body were provided
  } else if args.pos().len() == 2 {
    let name = args.pos().at(0)
    if name.has("text") and name.text.trim() != "" {
      sketch += " of " + name
    }
    body = args.pos().at(1)
  }
  v(0.5em)
  [_#sketch._]
  h(0.5em)
  body
  qed
  v(0.5em)
}

// TODO: plug theorems into contents table?

#let theorem(..args) = {
  let theorem = "Theorem"
  let name = ""
  let body = none
  // only body was provided
  if args.pos().len() == 1 {
    body = args.pos().at(0)
    // both theorem name and body were provided
  } else if args.pos().len() == 2 {
    let ctx = args.pos().at(0)
    name = " (" + text(ctx, style: "italic") + ")"
    // if ctx.has("text") and ctx.text.trim() != "" {}
    body = args.pos().at(1)
  }
  v(0.5em)
  [*#theorem*#name.]
  h(0.5em)
  body
  v(0.5em)
}


#let lemma(..args) = {
  let lemma = "Lemma"
  let name = ""
  let body = none
  // only body was provided
  if args.pos().len() == 1 {
    body = args.pos().at(0)
    // both theorem name and body were provided
  } else if args.pos().len() == 2 {
    let ctx = args.pos().at(0)
    name = " (" + text(ctx, style: "italic") + ")"
    body = args.pos().at(1)
  }
  v(0.5em)
  [*#lemma*#name.]
  h(0.5em)
  body
  v(0.5em)
}


// TODO: generalize proof above to annotated environment containing tag and possible annotation option.
#let annotated_environment() = { }
