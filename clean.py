from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity
import pandas as pd
import ast
import joblib
df=pd.read_csv("lib/cleaned_file.csv")
tfidf_vectorizer = TfidfVectorizer(stop_words='english')
tfidf_matrix = tfidf_vectorizer.fit_transform(df['ingredients'])
def dish_recommender(ingrd):

    user_idf=tfidf_vectorizer.transform([ingrd])
    sim_ing=cosine_similarity(user_idf,tfidf_matrix)
    li=sorted(list(enumerate(sim_ing[0])),reverse=True,key=lambda x:x[1])[0:5]
    li
    indices = [index for index,  in li]
    newdf=df.loc[indices]
    json=newdf.to_json(orient='records')
    print(json)


# dish_recommender("['rice','milk','eggs']")
joblib.dump(tfidf_vectorizer, 'tfidf_vectorizer.joblib')
joblib.dump(tfidf_matrix, 'tfidf_matrix.joblib')