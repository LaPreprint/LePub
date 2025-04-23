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

## Options

```yaml
options:
  theme-color: red
  font-body: "libertinus serif"
  font-body-size: 9pt
  line-spacing: 0.65em # (1)!
  line-numbers: true
  margin-side: left
  paper-size: "us-letter"
  section-numbering: "1.1.1" # or another valid pattern, e.g. "1.a.i" or "none"
  section-numbering-last: false # (2)!
  logo: none
  logo-position: bottom # top or bottom
  bibliography-style: string # (3)!
  funding: string
  data-availability: string
  endfloat: false // Not implemented yet!
```

1. Either a size including unit, *e.g.* `0.65em` or `9pt`, or one of the strings: `["single", "onehalf", "double"]`.

2. When specifying a `section-numbering: "1.(a).(i)"`, you can set `section-numbering-last: true` to only show the last level of the heading (e.g. `(i)` for a third level header).

3. Should be one of the [supported Typst styles](https://typst.app/docs/reference/model/bibliography/#styles) or the path to a CSL file.

### `theme-color`
**Type**: `string`  
**Default**: `#2453A1`  
**Description**: Sets the primary color of the article. 