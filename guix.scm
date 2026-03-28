; SPDX-License-Identifier: PMPL-1.0-or-later
;; guix.scm — GNU Guix package definition for polyglot-formalisms-gleam
;; Usage: guix shell -f guix.scm

(use-modules (guix packages)
             (guix build-system gnu)
             (guix licenses))

(package
  (name "polyglot-formalisms-gleam")
  (version "0.1.0")
  (source #f)
  (build-system gnu-build-system)
  (synopsis "polyglot-formalisms-gleam")
  (description "polyglot-formalisms-gleam — part of the hyperpolymath ecosystem.")
  (home-page "https://github.com/hyperpolymath/polyglot-formalisms-gleam")
  (license ((@@ (guix licenses) license) "PMPL-1.0-or-later"
             "https://github.com/hyperpolymath/palimpsest-license")))
