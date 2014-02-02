;gigamonkeys unit testing!
;(load "simple-routes.lisp")
;(load "giga-unit.lisp")

(defpackage :simpleroutes-tester
  (:use :common-lisp :simple-routes :giga-unit)
  (:import-from :cl-ppcre :scan)
  (:export :run-tests))

(in-package :simpleroutes-tester)

(deftest run-tests ()
  (test-compileroutes))

(deftest basic-test ()
  (declare (optimize (debug 3)))
  (check
    (equalp "Hello" "hello")
    (equalp "there" "there")))

(deftest test-compileroutes () 
  (check 
    (equalp 
     (compile-routes 
      ;;html content uris
      (:GET    ""                                          'home-handler)
      (:GET    "/"                                         'home-handler)
      (:GET    "/home"                                     'home-handler)
      (:GET    "/endslash/"                                'home-handler)
      (:GET    "/profile"                                  'profile-handler)
      (:GET    "/dataexplorer"                             'dataexplorer-handler)
      ;;json data uris
      (:GET    "/profiledata/:userid"                      'profiledata-handler) 
      (:PUT    "/profiledata/:userid"                      'profiledata-handler)
      ;;login management
      (:POST   "/login-process"                            'loginproc)
      (:GET    "/create-account"                           'accountcreate)
      (:GET    "/login"                                    'login-form-handler)
      (:GET    "/logout"                                   'logout-handler)
      (:GET    "/dataexplorerdata"                         'data-explorer-data)
      (:POST   "/dataexplorerdata"                         'data-explorer-data)
      (:GET    "/about"                                    'about-handler)
              )
      '((:GET "^$" NIL HOME-HANDLER) (:GET "^/$" NIL HOME-HANDLER)
	(:GET "^/home$" NIL HOME-HANDLER) (:GET "^/endslash/$" NIL HOME-HANDLER)
	(:GET "^/profile$" NIL PROFILE-HANDLER)
	(:GET "^/dataexplorer$" NIL DATAEXPLORER-HANDLER)
	(:GET "^/profiledata/([^/]*)$" (USERID) PROFILEDATA-HANDLER)
	(:PUT "^/profiledata/([^/]*)$" (USERID) PROFILEDATA-HANDLER)
	(:POST "^/login-process$" NIL LOGINPROC)
	(:GET "^/create-account$" NIL ACCOUNTCREATE)
	(:GET "^/login$" NIL LOGIN-FORM-HANDLER) (:GET "^/logout$" NIL LOGOUT-HANDLER)
	(:GET "^/dataexplorerdata$" NIL DATA-EXPLORER-DATA)
	(:POST "^/dataexplorerdata$" NIL DATA-EXPLORER-DATA)
	(:GET "^/about$" NIL ABOUT-HANDLER)))))

