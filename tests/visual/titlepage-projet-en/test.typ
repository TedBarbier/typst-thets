// Title page and jury of an English project report, reserved licence,
// with the values of mainETS_english.tex.
#import "/src/lib.typ": *

#show: ets-document.with(
  type: "projectreport",
  lang: "en",
  licence: "reserved",
  title: [Document title],
  author: (firstname: "First name", lastname: "Last name"),
  copyright-year: 2026,
  defense-date: datetime(year: 2026, month: 5, day: 15),
  deposit-date: datetime(year: 2025, month: 11, day: 30),
  supervisor: (name: "First Name Last Name", dept: "Department name"),
  chair: (name: "First Name Last Name", dept: "Department name"),
  jury: ((name: "First Name Last Name", dept: "Department name"),),
  concentration: "Electrical Engineering",
)
