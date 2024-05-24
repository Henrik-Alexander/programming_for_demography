# Erstelle einen Vektor mit den Jahreszeiten
seasons <- c("january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december")


# Wenn june, july, august, september, say that it is summer
for (month in seasons) {
    if (month %in% c("june", "july", "august", "september")) {
        print(paste("Es ist Sommer in", month))
    } else {
        print(paste("Es ist Sommer in", month))
    }
}

