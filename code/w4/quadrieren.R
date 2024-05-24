# Das Quadrat einer Zahl ist wenn man die Zahl mit sich selbst multipliziert

quadrieren <- function (zahl) {
    return(zahl * zahl)
}

# Quadriere 15
quadrieren(15)

# Produziert die Funktion das gleiche Ergebnis wie die R-Funktion
zahlen <- c(10, 15, 20, 30, 100)
quadrieren(zahlen) == zahlen^2
