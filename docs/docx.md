Coming soon!

```sh
pandoc document.docx -f docx -t typst \
  --template=https://raw.githubusercontent.com/LaPreprint/LePub/main/docx/docx-show.typ \
  --lua-filter=https://raw.githubusercontent.com/LaPreprint/LePub/main/filters/docx-custom-properties.lua \
  --lua-filter=https://raw.githubusercontent.com/LaPreprint/LePub/main/filters/keywords-filter-complete.lua
```