# Details, generics, and methods for the `ProteinSeq` class

The `ProteinSeq` class is an input for the functions `countSeqDiffs` and
`is.ProteinSeq`. It consists of a character vector. Each entry in this
vector represents the aminoacid (the protein components coded by a gene)
sequence, for a given aligned protein sequence. The object must be a
character, named vector, with the names typically corresponding to the
species (name could be scientific or common name) from which every
sequence came. The characters within the vector must correspond to valid
aminoacid symbols (i.e. capitalized letters or deletion "\_" symbols).
Particularly, the following symbols relate to amino acids:
`"A", "C", "D", "E", "F", "G", "H", "I", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "Y"`.

Importantly, the symbol `"_"` means an indel (insertion or deletion),
and the symbols `"X", "B", "Z", "J"` should be considered as ambiguous
site readings.

## Usage

``` r
is.ProteinSeq(x)

# S3 method for class 'ProteinSeq'
print(x, ...)

# S3 method for class 'ProteinSeq'
summary(object, ...)

# S3 method for class 'ProteinSeq'
head(x, n = 20, ...)

# S3 method for class 'ProteinSeq'
tail(x, n = 20, ...)
```

## Arguments

- x:

  an object of the class `ProteinSeq`

- ...:

  arguments to be passed to or from other methods.

  \#' @return Shows the last `n` elements of a `ProteinSeq` object.

- object:

  an object of the class `ProteinSeq`

- n:

  number of aminoacids to be shown

## Value

A logical indicating if object `x` is of class `ProteinSeq`

`print.ProteinSeq` Prints a brief summary of a `print.ProteinSeq`
containing the number of sequences and the length of the alignment. See
more details of the format in `??ProteinSeq`.

Same as `print.ProteinSeq`.

Shows the first `n` elements of a `ProteinSeq` object.

## Details

`is.ProteinSeq` A `ProteinSeq` must be a list containing multiple
vectors made of characters (usually letters that code to Amino Acids,
deletions, etc). All of these must have the correct length (i.e. same as
all the others) and their relative positions should match (i.e., the
object must contain *alligned* Amino acide sequences).

## Author

Daniel Rabosky, Matheus Januario, Jennifer Auler
