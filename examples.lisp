;; three bigram examples to get you started

(load "bigrams.lisp")

(findbigrams "Lorem Ipsum is commonly used for example text. Lorem Ipsum is cool")

(createlistofbigrams
        (countbigrams
            (findbigrams "Lorem Ipsum is commonly used for example text. Lorem Ipsum is cool")))

(createlistofbigrams
    (countbigrams
        (findbigrams "This is a software engineering blog post. a software engineering")))
