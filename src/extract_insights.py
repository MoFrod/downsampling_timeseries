
import numpy as np
import gensim
from gensim.corpora.dictionary import Dictionary
from gensim.models.ldamodel import LdaModel
#import collections
#from collections import defaultdict
#import spacy

def create_corpus(cleaned_tokens: list[str]) -> list[tuple[int, int]]:
    """
    This creates a dictionary of words from the cleaned tokens.
    """
    corpus = Dictionary(cleaned_tokens).doc2bow(cleaned_tokens)
    return corpus

def extract_topics(model: LdaModel) -> list[tuple[int, list[str, float]]]:
    topics = model.print_topics(num_topics = 5, num_words = 10)
    return topics

def extraction_pipeline(cleaned_tokens: list[str]):
    """
    This function runs all of the extraction elements for a document.
    """
    corpus = create_corpus(cleaned_tokens)
    lda_model = LdaModel(corpus, num_topics=5, passes=15)
    extracted_topics = extract_topics(lda_model)
    for topic in extracted_topics:
        print(topic)


# # Load a pre-trained English model
# nlp = spacy.load("en_core_web_sm")

# # Process the text
# document = "Your document text here..."
# doc = nlp(document)

# # Extract named entities and noun chunks as potential concepts
# concepts = [chunk.text for chunk in doc.noun_chunks]

# # Extract relationships between concepts using dependency parsing
# relationships = []
# for token in doc:
#     if token.dep_ in ["nsubj", "dobj"]:
#         subject = [w for w in token.head.lefts if w.dep_ == "nsubj"]
#         if subject:
#             relationships.append((subject[0], token.head, token))


# # Function to extract relevant sentences for the given keywords
# def extract_relevant_sentences(text, keywords):
#     relevant_sentences = defaultdict(list)
#     sentences = text.split('. ')
#     for sentence in sentences:
#         for keyword in keywords:
#             if keyword in sentence.lower():
#                 relevant_sentences[keyword].append(sentence.strip())
#     return relevant_sentences

# # Keywords related to the main themes
# keywords = ['data', 'trust', 'time', 'decision', 'making', 'quality', 'visualisation', 'limitations']

# # Extract relevant sentences for the keywords
# relevant_sentences = extract_relevant_sentences(cleaned_text_for_analysis, keywords)

# # Summarizing the insights for each theme
# summary = {}

# # Data theme
# data_sentences = relevant_sentences['data']
# summary['Data'] = f"Data is mentioned {len(data_sentences)} times, emphasizing its centrality. Examples include: {data_sentences[:2]}."

# # Trust theme
# trust_sentences = relevant_sentences['trust']
# summary['Trust'] = f"Trust is discussed {len(trust_sentences)} times. Examples include: {trust_sentences[:2]}."

# # Time theme
# time_sentences = relevant_sentences['time']
# summary['Time'] = f"Time is discussed {len(time_sentences)} times. Examples include: {time_sentences[:2]}."

# # Decision Making theme
# decision_sentences = relevant_sentences['decision']
# making_sentences = relevant_sentences['making']
# summary['Decision Making'] = f"Decision making is a recurrent theme, with examples like: {decision_sentences[:1]} and {making_sentences[:1]}."

# # Quality theme
# good_sentences = relevant_sentences['quality']
# summary['Quality'] = f"Quality of data are addressed, with examples like: {good_sentences[:1]}."

# # Visualisation theme
# visualisation_sentences = relevant_sentences['quality']
# summary['Visualisation'] = f"Visualisation of data are addressed, with examples like: {visualisation_sentences[:1]}."

# # Limitations theme
# limitations_sentences = relevant_sentences['quality']
# summary['Limitations'] = f"Limitations of data are addressed, with examples like: {limitations_sentences[:1]}."

# # Provenance theme
# provenance_sentences = relevant_sentences['quality']
# summary['provenance'] = f"provenance of data are addressed, with examples like: {provenance_sentences[:1]}."

# summary
