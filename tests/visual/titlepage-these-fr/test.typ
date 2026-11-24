// Page de titre, verso de licence et jury d'une thèse en français,
// avec toutes les valeurs de mainETS_francais.tex.
#import "/src/lib.typ": *

#show: ets-document.with(
  type: "these",
  lang: "fr",
  licence: "creativecommons",
  confidential: true,
  title: [Titre du document],
  author: (firstname: "Prénom", lastname: "Nom de famille"),
  copyright-year: 2026,
  defense-date: datetime(year: 2026, month: 5, day: 15),
  deposit-date: datetime(year: 2025, month: 11, day: 30),
  supervisor: (name: "Prénom Nom", dept: "Nom du département"),
  cosupervisor: (
    name: "Prénom Nom",
    dept: "Nom du département",
    affiliation: "à l'École XXX",
  ),
  chair: (name: "Prénom Nom", dept: "Nom du département"),
  jury: ((name: "Prénom Nom", dept: "Nom du département"),),
  external-examiners: (
    (name: "Prénom Nom", affiliation: "Nom de la compagnie"),
  ),
  independent-examiner: (
    name: "Prénom Nom",
    affiliation: "Nom de la compagnie",
  ),
  concentration: "génie logiciel",
  cotutorship: "ECOLE NATIONALE DE XXXX",
)
