# LePub with MyST

!!! failure

    The template has not yet been added to the MyST Templates, so it is not easily accessible for use in MyST.

Start a new MyST project inside the destination folder.

```sh
myst init
```

## Usage

Then open `myst.yml` and add the following export:
```yaml
exports:
  - format: typst
    template: typst-lepub
```

You can then set [options](settings.md#options) under the format:
```yaml
exports:
  - format: typst
    template: typst-lepub
    line_numbers: true
```

!!! info

    Note that for MyST all option names use underscore (`_`) instead of hyphen (`-`):
    ```yaml
    line_numbers: true # Correct
    line-numbers: true # Wrong
    ```