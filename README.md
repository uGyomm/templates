Welcome to the *templates* repository.

As the name suggests, this is where various templates of mine will be stored.\
The templates are made using the typesetting language called [Typst]([url](https://typst.app/docs/)).

Templates definition are stored in the **lib** folder.\
Examples using the templates are stored in the **examples** folder.\
Resources required by examples are stored in the **resources** folder.

## About the repository architecture
### lib

Templates are made to be completely independent.\
As such, it is possible that between two templates, redundancies are observed.\
One could argue that Typst's *import* functionality provides enough leeway to modularize templates libraries.
However, considering the current template average size, this seems like a non-necessary design.

More than non-necessary, it is easier to share and read a relatively small recipe using a single sheet of paper than using a heap of paper.

Under the condition that a template's size drastically increases, this decision shall be reviewed.


### examples
The *examples* folder stores two types of files, **.typ** and **.pdf** files.

A *.typ* file showcases the suggested usage of a template.\
As a typesetting example file, it plays the major role of presenting how and when to call the appropriate functions.

A *.pdf* file displays the frozen result of an example.
