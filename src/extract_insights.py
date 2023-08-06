from collections import defaultdict

# Function to extract relevant sentences for the given keywords
def extract_relevant_sentences(text, keywords):
    relevant_sentences = defaultdict(list)
    sentences = text.split('. ')
    for sentence in sentences:
        for keyword in keywords:
            if keyword in sentence.lower():
                relevant_sentences[keyword].append(sentence.strip())
    return relevant_sentences

# Keywords related to the main themes
keywords = ['data', 'time', 'decision', 'making', 'good', 'need']

# Extract relevant sentences for the keywords
relevant_sentences = extract_relevant_sentences(cleaned_text_for_analysis, keywords)

# Summarizing the insights for each theme
summary = {}

# Data theme
data_sentences = relevant_sentences['data']
summary['Data'] = f"Data is mentioned {len(data_sentences)} times, emphasizing its centrality. Examples include: {data_sentences[:2]}."

# Time theme
time_sentences = relevant_sentences['time']
summary['Time'] = f"Time is discussed {len(time_sentences)} times, possibly related to time-based analysis. Examples include: {time_sentences[:2]}."

# Decision Making theme
decision_sentences = relevant_sentences['decision']
making_sentences = relevant_sentences['making']
summary['Decision Making'] = f"Decision making is a recurrent theme, with examples like: {decision_sentences[:1]} and {making_sentences[:1]}."

# Quality and Need theme
good_sentences = relevant_sentences['good']
need_sentences = relevant_sentences['need']
summary['Quality and Need'] = f"Quality and need of data are addressed, with examples like: {good_sentences[:1]} and {need_sentences[:1]}."

summary
