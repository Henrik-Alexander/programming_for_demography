# Week 4: Funktionen

# Erstelle eine Funktion, welche die Uni-Mailaddresse erstellt

# Input: name
# Body: combine with domain
# Ouput: return the final mail

# Let's set a number of names
names <- c("Henrik", "David", "Clara", "Konrad")
surnames <- c("Schubert", "Schubert", "Brunner", "Dupke")

# Write the funciton
make_mail <- function(firstname, lastname) {
    domain <- "@uni-rostock.de"

    mailaddress <- paste0(firstname, ".", lastname, domain)

    return(mailaddress)
}

# Use the funktion
make_mail("Henrik", "Schubert")

# Use the funktion for allnames
make_mail(names, surnames)
