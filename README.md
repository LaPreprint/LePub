# TyPreprint

Currently under development.

I'm building a repository that aims to create a template that serves Typst, Quarto and MyST natively. Please come back soon.

The core file is `typreprint.typ`.

### Typst
- Specification: `typst.toml`
- Entrypoint: 
    - `typst-template/from_manual.typ` (without YAML frontmatter)
    - `typst-template/from_yaml.typ` (with YAML frontmatter)
- Extras: `frontmatter.yml`

### Quarto 
- Specification: `_extension.yml`
- Entrypoint: `quarto_template.typ`
- Partials: `quarto-show.typ`

### MyST
- Specification: `template.yml`
- Entrypoint: `myst-show.typ`