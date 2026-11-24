# boreal-thesis-ets — gabarit Typst ÉTS (non officiel)

[![Pipeline](https://gitlab.com/TedBarbier/typst-thets/badges/main/pipeline.svg)](https://gitlab.com/TedBarbier/typst-thets/-/pipelines)
[![Version](https://img.shields.io/badge/dynamic/toml?url=https%3A%2F%2Fgitlab.com%2FTedBarbier%2Ftypst-thets%2F-%2Fraw%2Fmain%2Ftypst.toml&query=%24.package.version&prefix=v&label=version&color=239dad)](https://gitlab.com/TedBarbier/typst-thets/-/tags)
[![Typst Universe](https://img.shields.io/badge/Typst_Universe-boreal--thesis--ets-239dad)](https://typst.app/universe/package/boreal-thesis-ets)
[![Typst](https://img.shields.io/badge/Typst-%E2%89%A50.15-239dad?logo=typst&logoColor=white)](https://typst.app)
[![Licence](https://img.shields.io/badge/licence-MIT--0-blue)](LICENSE)
[![Miroir GitHub](https://img.shields.io/badge/miroir-GitHub-181717?logo=github)](https://github.com/TedBarbier/typst-thets)

Portage en [Typst](https://typst.app) du gabarit LaTeX `thETS` de rédaction de
thèse, de mémoire et de rapport de projet de l'École de technologie supérieure
(ÉTS, Montréal).

« boreal » n'est là que pour respecter les règles de nommage de Typst Universe :
les noms tels que `ets` ou `thets` sont réservés aux gabarits officiels.

> **⚠️ Gabarit non officiel.** Il n'est ni produit, ni validé, ni soutenu par
> l'ÉTS. Il reproduit au mieux la mise en page du gabarit LaTeX officiel, mais
> rien ne garantit qu'un professeur, un jury ou le décanat accepte le document
> produit. Vérifiez les exigences de votre programme avant de déposer. Le
> logiciel est fourni « tel quel », sans garantie d'aucune sorte (voir
> [LICENSE](LICENSE)).

La mise en page reproduit celle du gabarit LaTeX : papier US Letter,
recto-verso, corps de 12 pt, interligne 1,5, marges 3,81 cm / 3,81 cm / 1,90 cm
/ 1,90 cm, chapitres en page impaire.

## Démarrage rapide

Avec Typst 0.15 ou plus récent :

```bash
typst init @preview/boreal-thesis-ets:0.1.0 mon-rapport
cd mon-rapport
typst watch rapport.typ
```

Sur [typst.app](https://typst.app), choisir « Start from template » et chercher
`boreal-thesis-ets`.

Le dossier créé contient `rapport.typ` (modèle en français), `rapport-english.typ`
(modèle en anglais), des exemples de bibliographie et une figure. Les valeurs de
la page de titre et du jury (« Prénom Nom », « Nom du département », etc.) sont
celles des fichiers `mainETS_francais.tex` et `mainETS_english.tex` du gabarit
LaTeX : il suffit de les remplacer.

Pour utiliser le gabarit dans un document existant :

```typ
#import "@preview/boreal-thesis-ets:0.1.0": *

#show: ets-document.with(
  type: "rapportprojet",
  lang: "fr",
  title: [Titre du document],
  author: (firstname: "Prénom", lastname: "Nom de famille"),
  // ...
)
```

Le [GUIDE.md](GUIDE.md) décrit toutes les commandes : options du document, page
de titre, sections préliminaires, figures, tableaux, extraits de code,
algorithmes, annexes et bibliographie.

### Bibliographie

Un paquet Typst ne peut pas lire les fichiers de votre projet. Passez donc le
contenu de la base, lu depuis votre document :

```typ
#ets-bibliography(read("biblio.bib", encoding: none))
```

## Contenu du dépôt

| Chemin | Rôle |
|--------|------|
| `src/` | Modules du gabarit (`lib.typ` est le point d'entrée) |
| `template/` | Fichiers copiés par `typst init` |
| `ets.csl` | Style bibliographique APA-ÉTS (portage de `bibETS.bst`) |
| `Figures/logocc.pdf` | Logo Creative Commons de la page de titre |
| `GUIDE.md` | Guide d'utilisation complet |

## Polices

Le gabarit compose en Times (`newtxtext` côté LaTeX). Il cherche d'abord
« Times New Roman », présent sous macOS et Windows, puis *TeX Gyre Termes*
(clone libre de Times, à installer sous Linux), et enfin « Libertinus Serif »,
livrée avec Typst.

## Impression — respect des marges

Lors de l'impression du PDF, régler l'option **Mise à l'échelle** sur
**Aucune**, faute de quoi les marges ne sont pas respectées.

## Développement

Les tests utilisent [tytanic](https://github.com/typst-community/tytanic) :

```bash
tt run                 # lance tous les tests
tt update visual/floats  # régénère une référence après un changement voulu
```

- `tests/api/` : tests unitaires (types de document, langues, traductions, dates) ;
- `tests/visual/` : rendus comparés à des images de référence (page de titre,
  jury, flottants). Seules les polices embarquées sont utilisées, pour un rendu
  identique partout ;
- `@template` : vérifie que le projet créé par `typst init` compile.

La CI GitLab lance aussi `typstyle --check`, la compilation des deux modèles et
`typst-package-check`.

## Crédits

La mise en page, les textes de la page de titre et les valeurs par défaut
viennent du gabarit LaTeX `thETS` de l'ÉTS et de ses auteurs successifs
(Christophe Pagano, Pascal Giard, le support LaTeX de l'ÉTS et l'équipe
Uniformat). Questions sur le gabarit officiel :
[support-latex@livia.etsmtl.ca](mailto:support-latex@livia.etsmtl.ca). Merci de
ne pas leur écrire au sujet de ce portage : ouvrez plutôt une issue ici.

Les dates sont mises en forme par le paquet
[`datify`](https://github.com/Jeomhps/datify).

## Licence

Code du portage : [MIT-0](LICENSE).
