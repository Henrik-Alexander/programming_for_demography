# Die verschiedenen Datentypen können in Objekten gebündelt und gesammelt werden.
# Es gibt verschiedene Containertypen: vectors, matrix, list, data.frame, arrays
# Die Typen unterscheiden sich hinsichtlich der Anzahl der Dimensionen und der Fähigkeit verschiedene Datentypen zu haben

# Vectors -------------------------------
# Vectoren können die gleichen Werte speichern in einer Dimension

# Create a numeric Vector
numbers <- c(1, 2, 3, 4, 5, 6)
class(numbers)

# Jedoch könne Vekotren nur den gleichen Typ speichern.
numbers <- c(numbers, "Henrik")
class(numbers)
# Wenn man das nicht berücksichtigt, dann wird der Typ überschrieben

# Man kann Elemente auswählen indem man die Position des Elements bestimmt
numbers[3]
numbers[1]
numbers[1:length(numbers)]


# Matrix ---------------------------------
# Matrizen sind Vektoren im zeidimensionalen Raum

# 
numbers <- c(1, 2, 3, 4, 5, 6)
tabs <- matrix(numbers, nrow = 2, ncol = 3)
print(tabs) # 
dim(tabs) # Hat zwei Dimension, 2 Reihen und 3 Spalten

# Um Elemente einer Matrix auszuwählen muss man die Reihe x und die Spalte < bestimmen matrix[x, y]
tabs[2, 1]
tabs[5, 1]

# Listen -----------------------------------

# Listen habe den Vorteil, dass sie alle beliebigen Datentypen kombinieren können

henrik <- list("name" = "Henrik", "alter" = 27, "geburtsort" = "Berlin")
class(henrik$alter)
class(henrik$geburtsort)


# Datensätze ------------------------------

# Datensätze sind Listen die aus Vektoren der gleichen länge bestehen

x <- c(1, 2, 3, 4)
y <- c(5, 4, 3, 1)
name <- c("Henrik", "Carl", "Dieter", "Peter")

d <- data.frame(name = name, x = x, y = y)
print(d)
