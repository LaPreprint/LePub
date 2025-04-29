#import "../lepub.typ": *
#show: lepub.with(
  options: (
    word-count: true,
    line-spacing: "double",
    font-body: "libertinus serif",
    line-numbers: false,
    theme-color: "#FF5733",
    margin-side: "right",
    logo: "template/logo.jpg",
    github: "https://github.com/vocalpy/vak",
    bibliography: ("template/refs.bib", "template/refs-2.bib"),
    bibliography-style: "apa",
    parts: (
      funding: [
        This work was supported by the Swiss National Science Foundation (SNSF; #link("https://www.snf.ch/en")) Ambizione Fellowship PZ00P3_180085 (to AH), SNSF Starting Grant TMSGI3_211369 (to AH), and SNSF National Centre of Competence in Research (NCCR) AntiResist (to AH; grant number 180541). The funder played no role in the study design, data collection and analysis, decision to publish, or preparation of the manuscript. 
      ]
    )
  ),
  frontmatter: (
    title: "vak: a neural network framework for researchers studying animal acoustic communication",
    short-title: "neural network for animal acoustic communication",
    abstract: [
How is speech like birdsong? What do we mean when we say an animal learns their vocalizations? Questions like these are answered by studying how animals communicate with sound. As in many other fields, the study of acoustic communication is being revolutionized by deep neural network models. These models enable answering questions that were previously impossible to address, in part because the models automate analysis of very large datasets. Acoustic communication researchers have developed multiple models for similar tasks, often implemented as research code with one of several libraries, such as Keras and Pytorch. This situation has created a real need for a framework that allows researchers to easily benchmark multiple models, and test new models, with their own data. To address this need, we developed vak (#link("https://github.com/vocalpy/vak")[https://github.com/vocalpy/vak]), a neural network framework designed for acoustic communication researchers. ("vak" is pronounced like "talk" or "squawk" and was chosen for its similarity to the Latin root _voc_, as in "vocal".) Here we describe the design of the vak, and explain how the framework makes it easy for researchers to apply neural network models to their own data. We highlight enhancements made in version 1.0 that significantly improve user experience with the library. To provide researchers without expertise in deep learning access to these models, vak can be run via a command-line interface that uses configuration files. Vak can also be used directly in scripts by scientist-coders. To achieve this, vak adapts design patterns and an API from other domain-specific PyTorch libraries such as torchvision, with modules representing neural network operations, models, datasets, and transformations for pre- and post-processing. vak also leverages the Lightning library as a backend, so that vak developers and users can focus on the domain. We provide proof-of-concept results showing how vak can be used to test new models and compare existing models from multiple model families. In closing we discuss our roadmap for development and vision for the community of users.
    ],
    parts: (
      funding: "This work was sponsored by money.",
    ),
    date: datetime(
      year: 2023,
      month: 7,
      day: 10,
    ),
    open-access: true,
    license: "CC-BY-4.0",
    keywords: ("animal acoustic communication","bioacoustics","neural networks","extra words"),
    doi: "10.25080/gerudo-f2bc6f59-008",
    github: "https://github.com/vocalpy/vak",
    authors: (
      (
        name: "David Nicholson",
        orcid: "0000-0002-4261-4719",
        affiliations: "1",
        email: "nicholdav@gmail.com"
      ),
      (
        name: "Yarden Cohen",
        orcid: "0000-0002-8149-6954",
        affiliations: "2",
      ),
    ),
    affiliations: (
      (
        id: "1",
        name: "Independent researcher, Baltimore, Maryland, USA",
      ),
      (
        id: "2",
        name: "Weizmann Institute of Science, Rehovot, Israel",
      ),
    ),
  )
)

= Introduction
#lorem(100)

#lorem(100)

== Smaller heading
#lorem(100)

// #table(
//   columns: 7,
//   align: (auto,auto,auto,auto,auto,auto,auto,),
//   table.header(table.cell(rowspan: 2)[], table.cell(colspan: 2)[Kendall\'s W], table.cell(colspan: 2)[Gaussian model], table.cell(rowspan: 2)[N], table.cell(rowspan: 2)[n],
//     [W], [p], [ICC], [p],),
//   table.hline(),
//   table.cell(colspan: 7)[AP],
//   [DL + DD + LL], [0.48], [\< 0.001], [0.27 \[0.11, 0.43\]], [\< 0.001], [32], [172],
//   [DL + DD], [0.49], [0.005], [0.22 \[0.01, 0.43\]], [0.009], [27], [102],
//   [DL + LL], [0.63], [\< 0.001], [0.42 \[0.21, 0.60\]], [\< 0.001], [32], [119],
//   [DD + LL], [0.52], [0.001], [0.27 \[0.06, 0.46\]], [0.003], [27], [107],
//   table.cell(colspan: 7)[MP\[active\]],
//   [DL + DD + LL], [0.39], [\< 0.001], [0.23 \[0.08, 0.39\]], [\< 0.001], [32], [172],
//   [DL + DD], [0.48], [0.008], [0.28 \[0.05, 0.47\]], [0.002], [27], [102],
//   [DL + LL], [0.47], [0.006], [0.27 \[0.07, 0.46\]], [\< 0.001], [32], [119],
//   [DD + LL], [0.50], [0.002], [0.32 \[0.10, 0.52\]], [\< 0.001], [27], [107],
//   table.cell(colspan: 7)[MP\[passive\]],
//   [DL + DD + LL], [0.56], [\< 0.001], [0.42 \[0.24, 0.57\]], [\< 0.001], [32], [173],
//   [DL + DD], [0.57], [\< 0.001], [0.43 \[0.20, 0.61\]], [\< 0.001], [27], [103],
//   [DL + LL], [0.67], [\< 0.001], [0.49 \[0.28, 0.65\]], [\< 0.001], [32], [119],
//   [DD + LL], [0.62], [\< 0.001], [0.47 \[0.24, 0.64\]], [\< 0.001], [27], [108],
// )

=== Even smaller heading
// #lorem(100) 
@netwok2020 
// @netwok2021

// === Another even smaller heading
// #lorem(100)