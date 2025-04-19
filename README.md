# LePub

**Currently under active development.**

The idea is to try building a template that serves Typst, Quarto and MyST all at once - natively. Please come back soon.

## Usage

Not yet...

```yaml
options:
    theme-color: red
    font-body: "libertinus serif"
    line-spacing: 1.0
    line-numbers: true
    section-numbering: true
    endfloat: false // Not implemented yet!
```
    

## Development

Since we're developing for three different engines at once, here's a quick overview of which files belong to which engine. The core file is `lepub.typ` - when that is updated, then it will be updated for all engines (things may of course still need to be tweaked in those too, but there is no duplication of work).

### Typst
- Specification: `typst.toml`
- Entrypoint: 
    - `typst-template/from-manual.typ` (without YAML frontmatter)
    - `typst-template/from-yaml.typ` (with YAML frontmatter)
- Extras: `typst-template/frontmatter.yml`

### Quarto 
- Specification: `_extension.yml`
- Entrypoint: `quarto-template.typ`
- Partials: `quarto-show.typ`

#### Settings
Users can specify the options directly under the `lepub-typst` format, e.g.:

```yaml
format:
    lepub-typst:
        line-numbers: true
```

Developers can access these values *without prefixes* in `quarto-show.typ`.

### MyST
- Specification: `template.yml`
- Entrypoint: `myst-show.typ`
