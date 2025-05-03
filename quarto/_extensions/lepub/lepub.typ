#import "@preview/pubmatter:0.2.1"
#import "@preview/wordometer:0.1.4": word-count, total-words, total-characters

#let lepub(
  frontmatter: (),
  options: (),
  kind: none,
  // The path to a bibliography file if you want to cite some external works.
  page-start: none,
  max-page: none,
  // The paper's content.
  body
) = {

  // Here we need to specify the default options in case none are being provided
  let default-options = (
      theme-color: "#2453A1",
      font-body: "libertinus serif",
      font-body-size: 9pt,
      line-spacing: 0.65em,
      line-numbers: false,
      margin-side: "right",
      section-numbering: "1.1.1",
      section-numbering-last: false,
      logo: none,
      logo-position: top,
      bibliography: none,
      bibliography-style: "ieee",
      date-submitted: none,
      date-received: none,
      date-accepted: none,
      date-published: none,
      paper-size: "us-letter",
      parts: (
        data-availability: none,
        funding: none
        ),
      word-count: false
    )

  if (type(options) == array) {
    options = options.to-dict()
  }

  let options = default-options + options

  // Line spacing
  if (type(options.line-spacing) == str) {
    if (options.line-spacing == "single") {
      options.line-spacing = 0.65em
    } else if (options.line-spacing == "onehalf") {
      options.line-spacing = 0.975em
    } else if (options.line-spacing == "double") {
      options.line-spacing = 1.3em
    }
  }

  // Alignment
  options.side-width = 27%
  options.margin-side = str(options.margin-side)
  if (options.margin-side == "left") {
    options.margin-side-align = left
    options.margin-shift = -33%
    options.margin-shift-logo = -33%
    if (options.line-numbers == true) {
      options.side-width = 24%
      // options.number-clearance = 8pt
    }
  } else if (options.margin-side == "right") {
    options.margin-side-align = right
    options.margin-shift = 5.2%
    options.margin-shift-logo = 32%
  }

  // Logo placement
  if (options.logo-position == top) {
    options.logo-v-adjustment = -10pt
  } else if (options.logo-position == bottom) {
    options.logo-v-adjustment = -70pt
  }

  // Load frontmatter
  let fm = pubmatter.load(frontmatter)

  // Process dates
  let dates;
  if ("date" in fm and type(fm.date) == datetime) {
    dates = (
      (title: "Submitted", date: fm.date),
      )
  } else {
    dates = date
  }

  // Process colors
  let theme-color = rgb(options.theme-color.replace("\\", ""))

  // Set document metadata.
  set document(title: fm.title, author: fm.authors.map(author => author.name))
  let theme = (color: theme-color, font: options.font-body)
  if (page-start != none) {counter(page).update(page-start)}
  state("THEME").update(theme)

  show: word-count
  let n-words = total-words
  let n-characters = total-characters

  set page(
    paper: options.paper-size,
    margin: (options.margin-side: 25%),
    header: pubmatter.show-page-header(fm),
    footer: block(
      width: 100%,
      stroke: (top: 1pt + gray),
      inset: (top: 8pt, right: 2pt),
      context [
        #set text(
          font: theme.font, 
          size: 9pt, 
          fill: gray.darken(50%)
          )
        #pubmatter.show-spaced-content((
          if("venue" in fm) {emph(fm.venue)},
          if("date" in fm and fm.date != none) {fm.date.display("[month repr:long] [day], [year]")}
        ))
        #h(1fr)
        #counter(page).display()
      ]
    ),
  )

  show link: it => [#text(fill: theme.color)[#it]]
  show ref: it => {
    if (it.element == none)  {
      // This is a citation showing 2024a or [1]
      show regex("([\d]{1,4}[a-z]?)"): it => text(fill: theme.color, it)
      it
      return
    }
    // The rest of the references, like `Figure 1`
    set text(fill: theme.color)
    it
  }

  // Set the body font.
  set text(
    font: options.font-body, 
    size: options.font-body-size
  )
  // Configure equation numbering and spacing.
  set math.equation(numbering: "(1)")
  show math.equation: set block(spacing: 1em)

  // =============================== //
  // =========== Lists ============= //
  // =============================== //
  set enum(indent: 10pt, body-indent: 9pt)
  set list(indent: 10pt, body-indent: 9pt)

  // =============================== //
  // ========== Headings =========== //
  // =============================== //

  set heading(numbering: options.section-numbering)
  show heading: it => context {
    let loc = here()
    // Find out the final number of the heading counter.
    let levels = counter(heading).at(loc)
    let level-patterns = options.section-numbering.split(".")
    set text(10pt, weight: 400)
    if it.level == 1 [
      // First-level headings are centered smallcaps.
      // We don't want to number of the acknowledgment section.
      #let is-ack = it.body in ([Acknowledgements], [Declaration of Competing Interest])
      // #set align(center)
      #set text(if is-ack { 10pt } else { 12pt }, weight: if is-ack { "regular" } else { "bold" })
      // #show: smallcaps
      #show: block.with(above: 20pt, below: 13.75pt, sticky: true)
      #if it.numbering != none and not is-ack {
        numbering(level-patterns.at(0), levels.at(0))
        [.]
        h(7pt, weak: true)
      }
      #it.body
    ] else if it.level == 2 [
      // Second-level headings are run-ins.
      #set par(first-line-indent: 0pt)
      #set text(weight: "semibold")
      #show: block.with(above: 15pt, below: 13.75pt, sticky: true)
      #if it.numbering != none {
        if options.section-numbering-last == false {
          numbering(options.section-numbering, ..levels) 
          } else { 
          numbering(level-patterns.at(1), levels.at(1))
        } 
        // [.]
        h(7pt, weak: true)
      }
      #it.body
    ] else [
      // Third level headings are run-ins too, but different.
      #show: block.with(above: 15pt, below: 13.75pt, sticky: true)
      #set text(style: "italic")
      #if it.level == 3 and it.numbering != none {
        if options.section-numbering-last == false {
          numbering(options.section-numbering, ..levels) 
          } else { 
          numbering(level-patterns.at(2), levels.at(2))
        } 
        // [. ]
        h(5pt, weak: true)
      }
      #it.body
    ]
  }

  // =============================== //
  // ======== Logo placement ======= //
  // =============================== //
  if options.at("logo", default: none) != none {
    place(
      options.logo-position + options.margin-side-align,
      dx: options.margin-shift-logo,
      float: false,
      box(
        width: 27%,
        {
          if (type(options.logo) == content) {
            options.logo
          } else {
            image(options.logo, width: 100%)
          }
        },
      ),
    )
  }

  // Creates custom contexts
  let left-caption(it) = context {
    set text(size: 8pt)
    set align(left)
    set par(justify: true)
    text(weight: "bold")[#it.supplement #it.counter.display(it.numbering)]
    "."
    h(4pt)
    set text(fill: black.lighten(20%), style: "italic")
    it.body
  }

  // =============================== //
  // ====== Title and Subtitle ===== //
  // =============================== //
  pubmatter.show-title-block(fm)

  // =============================== //
  // ======== Margin matter ======== //
  // =============================== //
  let corresponding = fm.authors.filter((author) => "email" in author).at(0, default: none)
  let margin = (

    // == Corresponding author == //
    if corresponding != none {
      (
        title: "Correspondence to",
        content: [
          #corresponding.name\
          #link("mailto:" + corresponding.email)[#corresponding.email]
        ],
      )
    },
    (
      title: [License #h(1fr) #pubmatter.show-license-badge(fm)],
      content: [
        #set par(justify: true)
        #set text(size: 7pt)
        #pubmatter.show-copyright(fm)
      ]
    ),

    // == Data Availability == //
    if options.at("parts", default: none) != none {(
      if "data-availability" in options.parts {(
        if options.parts.data-availability != none {(
          title: "Data Availability",
          content: [
            #set par(justify: true)
            #set text(size: 7pt)
            #options.parts.data-availability
          ],
        )}
      )}
    )},

    // == Funding == //
    if options.at("parts", default: none) != none {(
      if "funding" in options.parts {(
        if options.parts.funding != none {(
        title: "Funding",
        content: [
          #set par(justify: true)
          #set text(size: 7pt)
          #options.parts.funding
          ],
        )}
      )}
    )},

    // Word count
    if options.at("word-count", default: false) == true {(
      title: "Word count",
      content: [
        #set par(justify: true)
        #set text(size: 7pt)
        Words: #n-words \
        Characters: #n-characters
      ]
    )}
  ).filter((m) => m != none)

  // Margin matter placement
  place(
    options.margin-side-align + bottom,
    dx: options.margin-shift,
    dy: options.logo-v-adjustment,
    place( // Nested `place` to ensure that text can be left-aligned when in right margin
      left + bottom,
      box(width: options.side-width, {
        set text(font: theme.font)
        if (kind != none) {
          show par: set par(spacing: 0em)
          text(11pt, fill: theme.color, weight: "semibold", smallcaps(kind))
          parbreak()
        }
        if (dates != none) {
          let formatted-dates

          grid(columns: (40%, 60%), gutter: 7pt,
            ..dates.zip(range(dates.len())).map((formatted-dates) => {
              let d = formatted-dates.at(0);
              let i = formatted-dates.at(1);
              let weight = "light"
              if (i == 0) {
                weight = "bold"
              }
              return (
                text(size: 7pt, fill: theme.color, weight: weight, d.title),
                text(size: 7pt, d.date.display("[month repr:short] [day], [year]"))
              )
            }).flatten()
          )
        }
        v(2em)
        grid(columns: 1, gutter: 2em, ..margin.map(side => {
          text(size: 7pt, {
            if ("title" in side) {
              text(fill: theme.color, weight: "bold", side.title)
              [\ ]
            }
            set enum(indent: 0.1em, body-indent: 0.25em)
            set list(indent: 0.1em, body-indent: 0.25em)
            side.content
          })
        }))
      }),
    )
  )

  // =============================== //
  // ========== Abstract =========== //
  // =============================== //
  pubmatter.show-abstract-block(fm)

  // =============================== //
  // =========== Body  ============= //
  // =============================== //
  show par: set par(
    leading: options.line-spacing,
    spacing: options.line-spacing, 
    justify: true,
    first-line-indent: 1em
    )

  show raw.where(block: true): (it) => {
      set text(size: 6pt)
      set align(left)
      block(sticky: true, fill: luma(240), width: 100%, inset: 10pt, radius: 1pt, it)
  }
  show figure.caption: left-caption
  show figure.where(kind: "table"): set figure.caption(position: top)
  show figure.where(kind: "table"): set block(breakable: true)
  set figure(placement: auto)

  // =============================== //
  // ======== Line numbering ======= //
  // =============================== //
  set par.line(
    numbering: "1", 
    // number-clearance: options.number-clearance
    ) if options.line-numbers == true

  // =============================== //
  // ======= Display content ======= //
  // =============================== //
  body

  // =============================== //
  // ======== Bibliography ========= //
  // =============================== //
  if options.bibliography != none {
    set bibliography(
      title: text(10pt, "References"), 
      style: options.bibliography-style
    )
    show bibliography: (it) => {
      set text(7pt)
      set block(spacing: 0.9em)
      it
    }
    bibliography(options.bibliography)
  }
}
