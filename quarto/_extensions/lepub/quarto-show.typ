#show: lepub.with(
  frontmatter: (
    $if(title)$
      title: "$title$",
    $endif$
    $if(by-author)$
      authors: (
      $for(by-author)$
      (
        name: "$it.name.literal$",
        email: "$it.email$",
        url: "$it.url$",
        $for(it.affiliations/first)$department: [$it.department$],
        organization: [$it.name$],
        location: [$it.city$, $it.region$ $it.postal-code$],
        $endfor$
      )$sep$,
      $endfor$,
      ),
    $endif$
    $if(abstract)$
      abstract: [$abstract$],
    $endif$
    $if(bibliography)$
      bibliography-file: "$bibliography$",
    $endif$
  ),
  options: (
    font-body: "$font-body$",
  $if(line-numbers)$
    line-numbers: $line-numbers$,
  $endif$
  $if(theme-color)$
    theme-color: "$theme-color$"
  $endif$
  )
)