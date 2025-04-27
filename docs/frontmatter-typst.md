## Outline

```typst
#import "@preview/lepub:1.0.0": *
#show: lepub.with(
  frontmatter: (
    title: string,
    subtitle: string,
    short-title: string,
    keywords: (),
    abstract: (
        (
            title: string,
            content: string
        ),
    ),
    authors: (
        (
            name: string
            orcid: string
            email: string
            url: string
            roles: array
            degrees: array
            affiliations: (
                (
                    id: string
                    index: int
                ),
            )
        ),
    ),
    affiliations: (
        (
            id: string,
            index: int,
            name: string,
            institution: string,
        ),
    ),
    open-access: string,
    license: (
        (
            id: string,
            url: string,
            name: string,
        ),
    ),
    doi: string,
    funding: (
        (
            source: string
            investigator: (
                (
                    ref: 
                ),
            ),
        ),
    ),
    part-acknowledgments: string,
    bibliography: string
  )
)
```

## Parameters

### `abstract`

:   **Type**: <span class="type type-string">  string</span><span class="type-or"> | </span><span class="type type-array">dictionary</span>  
    **Aliases**: `abstracts`  
    **Description**: The document's abstract(s). When the content is provided directly to `abstract`, the title is `Abstract` by default.  
    **Properties**:  

    | Property | Type | Description | Default |
    |----------|------|-------------|---------|
    | `title` | <span class="type type-string">string</span> | The title of the abstract | `"Abstract"` |
    | `content` | <span class="type type-string">string</span> | The content/body of the abstract | `none` |

### `affiliations`

:   **Type**: <span class="type type-string">string</span><span class="type-or"> | </span><span class="type type-array">dictionary</span>  
    **Aliases**: `affiliation`  
    **Description**: Institutional affiliations. When the content is provided directly to `affiliation`, it is provided to `name` by default.  
    **Properties**:  

    | Property | Type | Description | Default |
    |----------|------|-------------|---------|
    | `id` | <span class="type type-string">string</span> | Unique identifier for the affiliation | `none` |
    | `index` | <span class="type type-number">int</span> | Numeric index for the affiliation | `none` |
    | `name` | <span class="type type-string">string</span> | Name of the affiliation | `none` |
    | `institution` | <span class="type type-string">string</span> | Institution name (use either name or institution) | `none` |

### `authors`

:   **Type**: <span class="type type-array">array</span><span class="type-or">&lt;</span><span class="type type-object">object</span><span class="type-or">&gt;</span> <span class="type-or">|</span> <span class="type type-string">string</span>  
    **Aliases**: `author`  
    **Description**: Document authors. Simple strings are converted to `((name: string),)`.  
    **Properties**:  

    | Property | Type | Description | Default |
    |----------|------|-------------|---------|
    | `name` | <span class="type type-string">string</span> | Author's name | `none` |
    | `url` | <span class="type type-string">string</span> | Author's website (aliases: `website`, `homepage`) | `none` |
    | `email` | <span class="type type-string">string</span> | Author's email address | `none` |
    | `phone` | <span class="type type-string">string</span> | Author's phone number | `none` |
    | `fax` | <span class="type type-string">string</span> | Author's fax number | `none` |
    | `orcid` | <span class="type type-string">string</span> | ORCID identifier (alias: `ORCID`) | `none` |
    | `note` | <span class="type type-string">string</span> | Additional notes about the author | `none` |
    | `corresponding` | <span class="type type-boolean">boolean</span> | Whether this is the corresponding author | `true` when email set |
    | `equal-contributor` | <span class="type type-boolean">boolean</span> | Equal contribution indicator (aliases: `equalContributor`, `equal_contributor`) | `none` |
    | `deceased` | <span class="type type-boolean">boolean</span> | Whether the author is deceased | `none` |
    | `roles` | <span class="type type-array">array</span><span class="type-or">&lt;</span><span class="type type-string">string</span><span class="type-or">&gt;</span> | Contributor roles (must be valid contributor roles) | `none` |
    | `affiliations` | <span class="type type-array">array</span><span class="type-or">&lt;</span><span class="type type-object">object</span><span class="type-or">&gt;</span> | Author's affiliations (aliases: `affiliation`) | `none` |

### `citation`

:   **Type**: <span class="type type-string">string</span>  
    **Description**: Citation information for the document.

### `date`

:   **Type**: <span class="type type-datetime">datetime</span>  
    **Description**: Publication date. Validates from 'YYYY-MM-DD' if provided as a string.

### `doi`

:   **Type**: <span class="type type-string">string</span>  
    **Description**: Digital Object Identifier. Must be only the ID, not the full URL.

### `keywords`

:   **Type**: <span class="type type-array">array</span>  
    **Description**: Keywords to be listed underneath the abstract.

### `license`

:   **Type**: <span class="type type-object">object</span>  
    **Description**: License information. Can be set with a SPDX ID for Creative Commons.  
    **Properties**:  

    | Property | Type | Description | Default |
    |----------|------|-------------|---------|
    | `id` | <span class="type type-string">string</span> | License identifier (e.g., SPDX ID) | `none` |
    | `url` | <span class="type type-string">string</span> | URL to the license text | `none` |
    | `name` | <span class="type type-string">string</span> | Human-readable license name | `none` |

### `open-access`

:   **Type**: <span class="type type-boolean">boolean</span>  
    **Description**: Whether the document is open access.

### `short-title`

:   **Type**: <span class="type type-string">string</span>  
    **Aliases**: `running-title`, `running-head`  
    **Description**: Short version of the title for running headers.

### `subtitle`

:   **Type**: <span class="type type-string">string</span>  
    **Description**: Document subtitle.

### `title`

:   **Type**: <span class="type type-string">string</span>  
    **Description**: Document title.