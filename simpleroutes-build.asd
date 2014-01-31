;;;; -*- mode: common-lisp; -*-
;;; Currell Bery - sblockserver system definition file

(defpackage #:simpleroutes-asd
  (:use :cl :asdf))

(in-package :simpleroutes-asd)

(ql:quickload "hunchentoot")
(ql:quickload "cl-who")
(ql:quickload "cl-ppcre")

(defsystem simple-routes
  :name "simple-routes"
  :version "0.2"
  :author "Currell Berry"
  :licence "2 clause BSD"
  :description "Facility for straightforward http routing on top of Hunchentoot."
  :depends-on (:hunchentoot :cl-ppcre)
  :components ((:file "simple-routes")))
  
(defsystem simpleroutes-demo
  :name "simpleroutes-demo"
  :version "0.5"
  :author "Currell Berry"
  :licence "2 clause BSD"
  :description "demonstrates simple use of simple-routes"
  :depends-on (:hunchentoot :cl-ppcre :cl-who :simple-routes)
  :components ((:file "simpleroutes-demo")))

(defsystem simpleroutes-test
  :name "simpleroutes-test"
  :description "unit tests simple-routes"
  :depends-on (:simple-routes)
  :components ((:file "giga-unit")
	       (:file "simpleroutes-test" :depends-on ("giga-unit"))))
