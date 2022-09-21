;; split document into bigrams

(ql:quickload :cl-ppcre)

(defun findbigrams (doc)
    ;; split document up into (1,2) bigrams
    (let ((document (cl-ppcre:split " " doc)))
        (loop for item in document and idx from 0
            collect (list item (if (< (+ idx 1) (length document)) (nth (+ idx 1) document))))))

(defun concatenategrams (gram)
    (read-from-string (apply 'concatenate 'string gram)))

(defun countbigrams (bigrams)
    (defparameter *bigram-reference* (make-hash-table))
    (defparameter *bigram-count* (make-hash-table))
    (loop for b in bigrams
        do (progn
                (if
                    (gethash (concatenategrams b) *bigram-count*)
                    (setf (gethash (concatenategrams b) *bigram-count*) (+ (gethash (concatenategrams b) *bigram-count*) 1))
                    (setf (gethash (concatenategrams b) *bigram-count*) 1))
                (setf (gethash (concatenategrams b) *bigram-reference*) b)))
    (list *bigram-count* *bigram-reference*))

(defun hashtablelist (bigrams &optional order)
    (let ((counter nil))
        (maphash (lambda (k v) (push (cons k v) counter)) bigrams)
    (if (string= order "ascending") (sort counter #'< :key #'cdr) (sort counter #'> :key #'cdr))))

(defun createlistofbigrams (bigramlist)
    (loop for bigram in (hashtablelist (first bigramlist)) do
            (progn
                (print (gethash (first bigram) (second bigramlist)))
                (print (cdr bigram)))))

;; (load "bigrams.lisp")