// Types de document et langues : alias acceptés et erreurs explicites.
#import "/src/state.typ": (
  is-doctorate, is-masters, is-project, normalize-lang, normalize-type,
)

// Les noms français et anglais désignent le même type.
#assert.eq(normalize-type("these"), "thesis")
#assert.eq(normalize-type("thesis"), "thesis")
#assert.eq(normalize-type("thesepararticles"), "manuscriptbasedthesis")
#assert.eq(normalize-type("memoire"), "masterdegreethesis")
#assert.eq(
  normalize-type("memoirepararticles"),
  "manuscriptbasedmasterdegreethesis",
)
#assert.eq(normalize-type("rapportprojet"), "projectreport")
#assert.eq(normalize-type("projectreport"), "projectreport")

// Familles de documents.
#assert(is-doctorate("thesis") and is-doctorate("manuscriptbasedthesis"))
#assert(is-masters("masterdegreethesis"))
#assert(is-masters("manuscriptbasedmasterdegreethesis"))
#assert(is-project("projectreport"))
#assert(not is-doctorate("projectreport") and not is-masters("thesis"))

// Langues.
#for (alias, lang) in (
  ("fr", "fr"),
  ("french", "fr"),
  ("francais", "fr"),
  ("en", "en"),
  ("english", "en"),
) {
  assert.eq(normalize-lang(alias), lang)
}

// Une valeur inconnue s'arrête avec un message qui cite la valeur fautive.
#assert-panic(() => normalize-type("doctorat"))
#assert("« doctorat »" in catch(() => normalize-type("doctorat")))
#assert("« de »" in catch(() => normalize-lang("de")))
