# LePub with Quarto
To begin a new project using LePub is incredibly simple.

```sh
quarto use template lapreprint/lepub/quarto
```

LePub can also be installed as a Quarto extension in an existing project.

```sh
quarto add lapreprint/lepub/quarto
```

## Usage

To use the template, specify `lepub-typst` as a custom format:
```yaml
format:
    lepub-typst: default
```

You can then set [options](options-quarto.md) under the format:
```yaml
format:
    lepub-typst:
        line-numbers: true
```

!!! info

    Currently, there are two `options` whose names differ from the general options:
    ```yaml
    part-data-availability:
    part-funding:
    ```