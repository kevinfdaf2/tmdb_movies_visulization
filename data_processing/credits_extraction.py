import csv
import pandas as pd
import json


# check json format
# form https://blog.csdn.net/elecjack/article/details/51901054
def is_json(myjson):
    try:
        json.loads(myjson)
    except ValueError:
        return False
    return True

# wrangling tmdb_5000_movies.csv file
def mutate_moveis():
    movies = open("./tmdb_5000_movies.csv", "r")
    w_movies = open("movies.csv", "w")
    writer = csv.writer(w_movies)
    reader = csv.reader(movies)
    genre = []
    # get all the genre, store in a list
    for row in reader:
        if is_json(row[1]):
            try:
                json_data = json.loads(row[1])
                data_dataframe = pd.DataFrame(json_data)
                # only get the genre name
                for i in data_dataframe["name"]:
                    genre.append(i)
            except KeyError:
                pass
    genre = list(set(genre))
    # point to the first line
    movies.seek(0)
    # create genre columns
    for row in reader:
        # get a settle length list to create columns
        genre1 = [''] * len(genre)
        if is_json(row[1]):
            try:
                json_data = json.loads(row[1])
                data_dataframe = pd.DataFrame(json_data)
                # write genre in to the corresponding column
                for j in data_dataframe["name"]:
                    for i in range(0, len(genre)):
                        if genre[i] == j:
                            genre1[i] = j
            except KeyError:
                pass
        companies = []
        # format product companies column
        if is_json(row[9]):
            try:
                json_data = json.loads(row[9])
                data_dataframe = pd.DataFrame(json_data)
                for i in data_dataframe["name"]:
                    companies.append(i)
                row[9] = ", ".join(companies)
            except KeyError:
                pass
        country = []
        # format product countries column
        if is_json(row[10]):
            try:
                json_data = json.loads(row[10])
                data_dataframe = pd.DataFrame(json_data)
                for i in data_dataframe["name"]:
                    country.append(i)
                row[10] = ", ".join(country)
            except KeyError:
                pass
        # format movie language column
        languages = []
        if is_json(row[14]):
            try:
                json_data = json.loads(row[14])
                data_dataframe = pd.DataFrame(json_data)
                for i in data_dataframe["name"]:
                    languages.append(i)
                row[14] = ", ".join(languages)
            except KeyError:
                pass
        # delete redundant column
        del row[16]
        del row[6]
        del row[4]
        del row[1]
        writer.writerow(row + genre1)


def mutate_credis():
    credis = open("./tmdb_5000_credits.csv", "r")
    w_credis = open("credits.csv", "w")
    writer = csv.writer(w_credis)
    reader = csv.reader(credis)
    # extract characters
    for row in reader:
        character = []
        if is_json(row[2]):
            try:
                json_data = json.loads(row[2])
                data_dataframe = pd.DataFrame(json_data)
                for i in data_dataframe["character"]:
                    character.append(i)
                row[2] = ", ".join(character)
            except KeyError:
                pass
        crew = []
        director = []
        if is_json(row[3]):
            try:
                json_data = json.loads(row[3])
                data_dataframe = pd.DataFrame(json_data)
                for i in range(0, len(data_dataframe)):
                    # put direcor name into the Director column
                    if data_dataframe["job"][i] == "Director":
                        for i in data_dataframe["name"]:
                            director.append(i)
                    else:
                        crew.append(data_dataframe["job"][i] + ':' + data_dataframe["name"][i])
                row[3] = ", ".join(crew)
                # if there are many director, add the most frequent
                if len(director) < len(set(director)):
                    row.append(max(director, key=director.count))
                # if every director occur once, take the first one
                elif len(director) > 0:
                    row.append(director[0])
                # if there are no director add a NA value
                else:
                    row.append(None)
            except KeyError:
                continue
        # write file
        writer.writerow(row)
    return "Mutate credits done!"


def main():
    mutate_credis()


if __name__ == '__main__':
    main()
