(defvar *db* nil)

(defun make-cd (title artist rating ripped)
    (list :title title :artist artist :rating rating :ripped ripped))

(defun add-record (cd) (push cd *db*))

(defun dump-db ()
    (dolist (cd *db*)
        (format t "~{~a:~10t~a~%~}~%" cd)))

(defun dump-db-short ()
  (format t "~{~{~a:~10t~a~%~}~%~}" *db*))

(defun prompt-read (prompt)
    (format *query-io* "~a: " prompt)
    (force-output *query-io*)
    (read-line *query-io*))

(defun prompt-for-cd ()
    (make-cd
     (prompt-read "Title")
     (prompt-read "Artist")
     (prompt-read "Rating")
     (prompt-read "Ripped [y/n]")))

(add-record (make-cd "Roses" "Kathy Mattea" 7 t))
(add-record (make-cd "Fly" "Dixie Chicks" 8 t))
(add-record (make-cd "Home" "Dixie Chicks" 9 t))