If you are want to customize the template, or make your own, we have attempted to make it as easy as possible. We use [pixi](https://pixi.sh) for development, so the first step is to install it.

=== "MacOS & Linux"

    ``` bash
    curl -fsSL https://pixi.sh/install.sh | sh
    ```

=== "Windows"

    ``` pwsh
    powershell -ExecutionPolicy ByPass -c "irm -useb https://pixi.sh/install.ps1 | iex"
    ```

### Create template

!!! failure

    Currently isn't implemented. See related [Github issue](https://github.com/LaPreprint/LePub/issues/11).

To get your own custom template, we provide the option to use an interactive prompt that clones the template and inserts all your details. First, install `copier` with Pixi.

```sh
pixi global install copier
```

Next, run:

```sh
copier copy lapreprint/lepub@copier path/to/destination
```


<!-- ## Update project details

The first thing you want to do is update the details around the project. That should be:

- `pixi.toml`
- `mkdocs.yml`
- `typst/X.X.X/typst.toml`
- `quarto/_extensions/lepub/_extension.yml`
- `myst/lepub/template.yml` -->