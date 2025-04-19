#import "../lepub.typ": *
#show: lepub.with(
  options: (
    font-body: "libertinus serif",
    line-numbers: true
  ),
  frontmatter: (
    title: "vak: a neural network framework for researchers studying animal acoustic communication",
    abstract: [
How is speech like birdsong? What do we mean when we say an animal learns their vocalizations? Questions like these are answered by studying how animals communicate with sound. As in many other fields, the study of acoustic communication is being revolutionized by deep neural network models. These models enable answering questions that were previously impossible to address, in part because the models automate analysis of very large datasets. Acoustic communication researchers have developed multiple models for similar tasks, often implemented as research code with one of several libraries, such as Keras and Pytorch. This situation has created a real need for a framework that allows researchers to easily benchmark multiple models, and test new models, with their own data. To address this need, we developed vak (#link("https://github.com/vocalpy/vak")[https://github.com/vocalpy/vak]), a neural network framework designed for acoustic communication researchers. ("vak" is pronounced like "talk" or "squawk" and was chosen for its similarity to the Latin root _voc_, as in "vocal".) Here we describe the design of the vak, and explain how the framework makes it easy for researchers to apply neural network models to their own data. We highlight enhancements made in version 1.0 that significantly improve user experience with the library. To provide researchers without expertise in deep learning access to these models, vak can be run via a command-line interface that uses configuration files. Vak can also be used directly in scripts by scientist-coders. To achieve this, vak adapts design patterns and an API from other domain-specific PyTorch libraries such as torchvision, with modules representing neural network operations, models, datasets, and transformations for pre- and post-processing. vak also leverages the Lightning library as a backend, so that vak developers and users can focus on the domain. We provide proof-of-concept results showing how vak can be used to test new models and compare existing models from multiple model families. In closing we discuss our roadmap for development and vision for the community of users.
    ],
    date: datetime(
      year: 2023,
      month: 7,
      day: 10,
    ),
    open-access: true,
    license: "CC-BY-4.0",
    keywords: ("animal acoustic communication","bioacoustics","neural networks",),
    doi: "10.25080/gerudo-f2bc6f59-008",
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
    github: "https://github.com/vocalpy/vak",
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
Some text