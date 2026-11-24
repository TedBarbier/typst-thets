// Figures, sous-figures, tableaux et extraits de code : légendes, sources,
// cadres et numérotation par chapitre.
#import "/src/lib.typ": *

#show: ets-document.with(
  title: [Flottants],
  author: (firstname: "Prénom", lastname: "Nom"),
  copyright-year: 2026,
  title-page: false,
  jury-page: false,
)

#let placeholder = rect(width: 100%, height: 3cm, fill: luma(220))

= Chapitre de test

#ets-figure(
  placeholder,
  caption: [Figure simple],
  label: <fig:simple>,
  source: "Source de l'image",
  year: 2024,
)

#ets-figure(
  frame: true,
  grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    ets-subfigure(placeholder, caption: [Gauche], label: <fig:a>),
    ets-subfigure(placeholder, caption: [Droite], label: <fig:b>),
  ),
  caption: [Sous-figures],
  label: <fig:grid>,
)

#ets-table(
  caption: [Tableau],
  label: <tab:t>,
  source: "Source du tableau",
  year: 2024,
  table(columns: 3, align: center, ..([titre],) * 3, ..([valeur],) * 6),
)

#ets-listing(
  ```python
  def bonjour():
      return "ok"
  ```,
  caption: [Extrait de code],
  label: <lst:l>,
)

Renvois : @fig:simple, @fig:a, @fig:grid, @tab:t et @lst:l.
