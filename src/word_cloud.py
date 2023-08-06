from collections import Counter
from sklearn.feature_extraction.text import ENGLISH_STOP_WORDS
from nltk.tokenize import word_tokenize
from wordcloud import WordCloud
import matplotlib.pyplot as plt

# Tokenize the cleaned text
tokens = word_tokenize(cleaned_text_for_analysis.lower())

# Filter out stopwords and non-alphanumeric tokens, and retain words related to data and trust
filtered_tokens = [word for word in tokens if word not in ENGLISH_STOP_WORDS and word.isalnum() and len(word) > 2]

# Get the most common words
word_frequency = Counter(filtered_tokens)
most_common_words = word_frequency.most_common(10)
most_common_words

# Generate a word cloud using the word frequencies
wordcloud = WordCloud(width=800, height=400, background_color='white').generate_from_frequencies(word_frequency_alternative)

# Plot the word cloud
plt.figure(figsize=(10, 5))
plt.imshow(wordcloud, interpolation='bilinear')
plt.axis("off")
plt.title("Main Themes of the Interview about Data and Trust")
plt.show()
