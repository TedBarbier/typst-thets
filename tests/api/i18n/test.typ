// Chaînes localisées et dates.
#import "/src/i18n.typ": long-date, month-year, tr

// Le français et l'anglais définissent exactement les mêmes clés.
#let fr = tr("fr")
#let en = tr("en")
#assert.eq(fr.keys().sorted(), en.keys().sorted())

// Dates de la page de titre et du jury (datify).
#let d = datetime(year: 2026, month: 5, day: 15)
#assert.eq(long-date(d, "fr"), "15 mai 2026")
#assert.eq(long-date(d, "en"), "May 15, 2026")
#assert.eq(lower(month-year(d, "fr")), "mai 2026")
#assert.eq(month-year(d, "en"), "May 2026")
#assert.eq(long-date(none, "fr"), "")
