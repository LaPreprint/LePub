!!! failure

    The template has not yet been added to the Typst Universe, so it is not easily accessible for use in Typst.

To use the LePub template, simply `#import` it at the top of your Typst (`.typ`) document.

```typst
#import "@preview/lepub:1.0.0": *
```

## Usage

To use the template, simply `#show` it:

``` typst
#import "@preview/lepub:1.0.0": *
#show: lepub.with(
  frontmatter: (), //(1)!
  options: ()
)
```

1. Here you can specify the [front matter](settings.md#frontmatter) and [options](settings.md#options) fields, for example:
```typst
frontmatter: (
    title: Fantastic Title
    author: John Doe
),
options: (
    line-numbers: true
)
```

### YAML front matter

If you have front matter available in YAML, you can use the [pubmatter](https://typst.app/universe/package/pubmatter/) package to read it - LePub will automatically know what to do with it:

```typst
#import "@preview/lepub:1.0.0": *
#import "@preview/pubmatter:0.2.0": *
#let fm = pubmatter.load(yaml("frontmatter.yml"))
#show: lepub.with(
  frontmatter: fm,
  options: ()
)
```