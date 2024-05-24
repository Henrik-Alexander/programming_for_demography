# In R gibt es 5 verschiedene Datenformate
# Es gibt logische, numerische, characters

# Characters -------------------------------------
# Ein character oder auch string genannt ist die Aneinanderreihung von Zeichen. 
# Um einen Character vector zu erstellen nutzt man Anführungszeichen
teacher <- "Henrik"
student <- "Tom"
telefon <- "+4915202830314"
class(teacher)
class(telefon)
# Mit Character-Daten kann man keine mathematischen Tranformationen machen
teacher / 2

# Logische indicatoren ----------------------------
# Logische Indikatoren sind TRUE oder FALSE, in Großbuchstaben.

teacher == student
"Henrik" == teacher


# Numerische formate -------------------------------
# R kennt außerdem das numerische Formate.
pi <- 3.14156
class(pi)
radius <- 2
surface <- radius * pi / 2
print(surface)

# Faktors ------------------------------------------
# Faktoren unterscheiden verschiedene Ausprägungen einer Variable
factor(1)
factor(c(1, 2))
