# Theme

Next, we can modify the template. To do so, open `lepub.typ` that lives in the **root** of the project (or, if you have renamed the template, then `new-name.typ`).

## Copy changes

Whenever you have saved your changes, copy the updated source file (`lepub.typ`) to the `typst`, `quarto` and `myst` folders with the dedicated task:

``` sh
pixi run copy
```

## Change defaults

The simplest changes are made by changing the `default-options`:

``` typst linenums="17"
    let default-options = (
        theme-color: "#2453A1",
        font-body: "libertinus serif",
        line-numbers: false
    )
```

If you want to ensure that users do not overwrite the default options, you can include this line before the `default-options`:

``` typst linenums="17" hl_lines="1"
    let options = ()
    let default-options = (
        theme-color: "#2453A1",
        font-body: "libertinus serif",
        line-numbers: false
    )
```
