# Common Lisp Bigrams

A tool to retrieve and display the most commonly used bigrams in a text.

## Using this tool

First, load the `bigrams.lisp` file into your Common Lisp project:

    (load "bigrams.lisp")

Now you are ready to start using the bigrams tool.

### Finding bigrams

To find bigrams in a corpus of text, use the `(findbigrams)` function:

    (findbigrams "Lorem Ipsum is commonly used for example text. Lorem Ipsum is cool")

This returns a raw list of bigrams:

    (("Lorem" "Ipsum") ("Ipsum" "is") ("is" "commonly") ("commonly" "used")
    ("used" "for") ("for" "example") ("example" "text.") ("text." "Lorem")
    ("Lorem" "Ipsum") ("Ipsum" "is") ("is" "cool") ("cool" NIL))

Bigrams are identified with a space delimiter. The last word in a corpus of text will be paired with NIL.

### Creating a list of counted bigrams

The list above does not count the bigrams in a list. To do this counting, you can use the `(createlistofbigrams)` function paired with the `(countbigrams)` function:

    (createlistofbigrams
        (countbigrams
            (findbigrams "Lorem Ipsum is commonly used for example text. Lorem Ipsum is cool")))

This code:

1. Finds the bigrams in a sentence.
2. Returns two hashmaps with the bigrams, an internal ID as a key, and the number of times each bigram appears in a text.
3. Displays the list of bigrams followed by the number of times the bigrams occur. This information is displayed in the Lisp REPL. The bigrams are in descending order of the number of times they appear in the provided corpus.

## License

This project is licensed under an [MIT license](LICENSE).

## Contributors

- capjamesg
