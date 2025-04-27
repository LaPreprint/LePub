# Options

### `bibliography`

:   **Type**: <span class="type type-array">array</span><span class="type-or">&lt;</span><span class="type type-string">string</span><span class="type-or">&gt;</span>  
    **Description**: Path (or list of paths) of bibliography files to use.

### `bibliography-style`

:   **Type**: <span class="type type-string">string</span>  
    **Default**: `"apa"`  
    **Options**: [Styles available natively in Typst](https://typst.app/docs/reference/model/bibliography/#styles)  
    **Description**: The style used for both the bibliography and the in-line citations.

### `font-body`

:   **Type**: <span class="type type-string">string</span>  
    **Default**: `"libertinus serif"`  
    **Description**: Primary font used throughout the document.

### `font-body-size`

:   **Type**: <span class="type type-string">string</span>  
    **Default**: `9pt`  
    **Description**: Font size used in the abstract and the body of the document.

### `line-numbers`

:   **Type**: <span class="type type-boolean">boolean</span>  
    **Default**: `true`  
    **Options**: `[true, false]`  
    **Description**: Include line numbers. Line numbers start after the abstract.

### `line-spacing`

:   **Type**: <span class="type type-variant">length</span><span class="type-or">/</span><span class="type type-string">string</span>  
    **Default**: `0.65em`  
    **Description**: Line spacing used in the body of the document, including figure legends, table legends and margin matter. Either a size including unit, *e.g.* `0.65em` or `9pt`, or one of the strings: `["single", "onehalf", "double"]`.

### `logo`

:   **Type**: <span class="type type-string">string</span>  
    **Default**: `none`  
    **Description**: Path to a (publisher) logo, otherwise `none` if no logo is to be included.

### `logo-position`

:   **Type**: <span class="type type-variant">alignment</span>  
    **Default**: `top`  
    **Options**: `[top, bottom]`  
    **Description**: When a logo is included, whether to print it on the top or bottom of the first page.

### `margin-side`

:   **Type**: <span class="type type-variant">alignment</span><span class="type-or">/</span><span class="type type-string">string</span>  
    **Default**: `left`  
    **Options**: `[left, right]`  
    **Description**: Which side to leave space for margin matter.

### `paper-size`

:   **Type**: <span class="type type-string">string</span>  
    **Default**: `"us-letter"`  
    **Options**: [See all options here](https://typst.app/docs/reference/layout/page/#parameters-paper)  
    **Description**: The paper size to be used.

### `part-data-availability`

:   **Type**: <span class="type type-string">string</span>  
    **Description**: A data availability statement.

### `part-funding`

:   **Type**: <span class="type type-string">string</span>  
    **Description**: A funding statement.

### `section-numbering`

:   **Type**: <span class="type type-string">string</span>  
    **Default**: `"1.1.1"`  
    **Options**: Any valid pattern, e.g. `"1.a.i"`, or `none`. You can also use brackets (*e.g.* `"1.(a).(i)"`) which can be useful when used in combination with `section-numbering-last`.  
    **Description**: Whether to use section/heading numbering patterns, and provide the desired pattern.

### `section-numbering-last`

:   **Type**: <span class="type type-boolean">boolean</span>  
    **Default**: `false`  
    **Options**: `[true, false]`  
    **Description**: When true, only the lowest level of the pattern is used in the section heading. So when using a pattern like `"1.(a).(i)"` only `(i)` is shown for a third level heading.

### `theme-color`

:   **Type**: <span class="type type-string">string</span>  
    **Default**: `#2453A1`  
    **Description**: Sets the primary color of the article.