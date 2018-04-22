import json

counter = 0

page = open('movieData.json', 'r')
parsed = json.loads(page.read())

f = open('dataInsertion.js', 'w+')
f.write('db.createCollection("movies");\n')
f.write('db.movies.ensureIndex("movie_id");\n')

for item in parsed['my_movies']:
    if counter<5:
        print(json.dumps(item))
        print('\n')
        counter+=1
    f.write('db.movies.insert([' + json.dumps(item) + ']);\n')
f.close()