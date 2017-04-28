simple-routes
=============

A simple Common Lisp RESTful routing facility on top of Hunchentoot.

This library provides a method for simple, centralized http routing on top of [Hunchentoot](http://weitz.de/hunchentoot/ "Hunchentoot at Weitz.de").  When you use this library with hunchentoot it takes priority over the default hunchentoot routing system but does not replace it.  If simple-routes does not match a handler to a given request, it will fall back to hunchentoot's other url routing methods (easy-handler, then the default static file service).

I wrote this library because the current routing methods I found were either too complicated for my needs (Restas) or too unstructured for a RESTful api (Hunchentoot easy-handler).

Sample syntax
-------------

simple-routes searches through \*routeslist\* for every incoming request to try to find a matching handler for the incoming url.  

```
(setf simple-routes:*routeslist*
      (compile-routes 
       ;;html content uris
       (:GET    ""                                      'home-handler)
       (:GET    "/people"                               'people-handler)
       (:GET    "/people/:first/:last"                  'get-person-handler)
       (:PUT    "/people/:first/:last/:description"     'put-person-handler)
              ))
```

This will register the listed relative urls with whatever functions are defined with names matching those specified in the rightmost column.  It will automatically forward the url segments which are keywords (start with a ":") as arguments to the handlers.  Here are corresponding function signatures for the url-handler functions.

```
(defun home-handler () ())
(defun people-handler () ())
(defun get-person-handler (first last) ())
(defun put-person-handler (first last description) ())
```

Demo
----

See simpleroutes-demo for a self-contained example web app using simple-routes!
To run the demo:

1. Navigate to the directory containing simpleroutes-demo.lisp
2. open up a Lisp REPL
3. Run these commands
 ```
 * (load "simpleroutes-build.asd")
 * (asdf:operate 'asdf:load-op 'simpleroutes-demo)
 ```

4. Navigate to localhost:8080/ in your web browser.
