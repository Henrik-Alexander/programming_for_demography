# Load the packages
import pickle
import pandas as pd
import numpy as np
import os
import matplotlib.pyplot as plt


# Change the directory
os.chdir("C:/Users/Lenovo/Desktop/Teaching/R_for_social_science")

# Set the path 
df = pd.read_pickle("daten/olympics/olympic_results.pkl")

#%% Data wrangling --------------------------------

df.head()
df.columns

# Create year and place
df["year"] = df.slug_game.apply(lambda x: x.rsplit("-", 1)[-1])
df["year"] = pd.to_numeric(df["year"])
df["place"] = df.slug_game.apply(lambda x: x.rsplit("-", 1)[0])

# %% Plot the years

figs, ax = plt.subplots(figsize = (10, 10))
ax.hist(df.year)
plt.show()

#%% Which country has the most gold medals

# Get the country-medal count
medals = df.groupby(["country_name", "year", "medal_type"], as_index = False).size()
medals["cumsum"] = medals.sort_values(["country_name", "year", "medal_type"]).groupby("country_name")["size"].apply("cumsum")

# Filter four countries
countries = ["Federal Republic of Germany", "United States of America", 
             "Great Britain", "People's Republic of China"]
medals2 = medals[medals["country_name"].isin(countries)]

# Create colours
c = []
for coun in medals2["country_name"]:
    if coun == "Federal Republic of Germany":
        c.append("#2E1D74")
    elif coun == "United States of America":
        c.append("#F93F0B")
    elif coun == "Great Britain":
        c.append("#344F1D")
    elif coun == "People's Republic of China":
        c.append("#A6C3E3")
        
col_dict = {"United States of America": "#F93F0B",
            "Federal Republic of Germany": "#2E1D74",
            "Great Britain": "#344F1D",
            "People's Republic of China": "#A6C3E3"}        

# Plot the result
figs, ax = plt.subplots()
for country in countries:
    tmp = medals2[medals2["country_name"] == country]
    ax.plot(tmp.year, tmp["size"], color = col_dict[country], label = country)
ax.legend()
plt.show()
