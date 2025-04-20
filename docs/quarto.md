# LePub with Quarto
LePub can be installed as a Quarto extension.

```sh
quarto add lapreprint/lepub/quarto
```

## Usage

Then, to use the template, specify `lepub-typst` as a custom format:
```yaml
format:
    lepub-typst: default
```

You can then set [options](settings.md#options) under the format:
```yaml
format:
    lepub-typst:
        line-numbers: true
```