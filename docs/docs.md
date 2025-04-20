We use [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/), which is also installed by Pixi automatically. It is configured in `mkdocs.yml`. To update the documentation, edit the `.md` files in the `docs` folder.

To serve your docs locally run:

```sh
pixi run mkdocs serve
```

To publish the documentation, we use a Github Action (`.github/workflows/ci.yml`), so you just need to ensure that your Github repository it is deployed from the correct branch.

```
Settings -> Pages -> Source: Deploy from Branch
```

And then publish from the `gh-pages` branch.