// NOTE: can just use ctheorem pkg

// FIXME: counters are broken!!
#let counters = state("env", (
  "counters": (:),
  "latest": (), // just copying ctheorem at this point
))

#let create-environment(
  identifier, // e.g., "theorem"
  name, // display name e.g., "Theorem"
  style: "bold", // "bold", "italic", or "normal"
  numbering: true, // true, false, or numbering pattern "1", "a"
  base: none, // base counter to synchronize with
) = {
  let style-fn = if style == "bold" {
    strong
  } else if style == "italic" {
    emph
  } else {
    x => x
  }

  return (..args, body) => {
    let env-name = if args.pos().len() > 0 { args.pos().first() } else {
      none
    }

    let number-display = none

    if numbering {
      let result = context {
        tinyset-counters.update(state-data => {
          let counters = state-data.at("counters")
          if identifier not in counters {
            counters.insert(identifier, 0)
          }
          counters.at(identifier) += 1

          (
            "counters": counters,
            "latest": counters.at(identifier),
          )
        })
      }

      number-display = context {
        counters.update(counters => {
          if identifier not in counters {
            counters.insert(identifier, 0)
          }
          counters.at(identifier) += 1
          counters
        })

        // let current = counters.get().at(identifier)
        let current = counters.get().at("latest")

        " " + numbering("1", current)
      }
    }

    v(0.5em)
    let title = style-fn(name)
    if number-display != none {
      title += number-display
    }
    if env-name != none {
      title += " (" + emph(env-name) + ")"
    }
    title += "."

    title
    h(0.5em)
    body
    v(0.5em)
  }
}

// default styles

#let theorem = create-environment(
  "theorem",
  "Theorem",
  style: "bold",
  numbering: true,
)

#let lemma = create-environment(
  "lemma",
  "Lemma",
  style: "bold",
  numbering: true,
)

#let definition = create-environment(
  "definition",
  "Definition",
  style: "bold",
  numbering: true,
)

#let proposition = create-environment(
  "proposition",
  "Proposition",
  style: "bold",
  numbering: true,
)

#let example = create-environment(
  "example",
  "Example",
  style: "italic",
  numbering: true,
)
#let remark = create-environment(
  "remark",
  "Remark",
  style: "italic",
  numbering: false,
)

#let problem = create-environment(
  "problem",
  "Problem",
  style: "bold",
  numbering: true,
)

#let proof(..args) = {
  let proof-name = "Proof"
  let body = none

  if args.pos().len() == 1 {
    body = args.pos().at(0)
  } else if args.pos().len() == 2 {
    let context-name = args.pos().at(0)
    if context-name != none and context-name != [] {
      proof-name += " of " + context-name
    }
    body = args.pos().at(1)
  }

  v(0.5em)
  emph(proof-name + ".")
  h(0.5em)
  body
  [#h(1fr)$square.big$]
  v(0.5em)
}


/*
TODO: implement labels without separate environment.

// labeling support for references
#let labeled-environment(env-func, label-name) = {
  return (..args, label: none, body) => {
    let result = env-func(..args, body)
    if label != none {
      result + [#metadata((type: label-name, label: label)) <meta:env-label>]
    } else {
      result
    }
  }
}

#let theorem-labeled = labeled-environment(theorem, "theorem")
#let definition-labeled = labeled-environment(definition, "definition")
#let lemma-labeled = labeled-environment(lemma, "lemma")

// get counter value for references
#let get-counter(identifier) = {
  context {
    let counters = counters.get()
    if identifier in counters {
      counters.at(identifier)
    } else {
      0
    }
  }
}

*/
