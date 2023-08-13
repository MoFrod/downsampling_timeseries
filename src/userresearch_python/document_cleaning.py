from docx import Document
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize

def get_document(filepath: str) -> str:
    """
    Returns the document as a great big string

    """
    doc = Document(filepath)
    full_text = []
    for paragraph in doc.paragraphs:
        full_text.append(paragraph.text)
    return '\n'.join(full_text)

def tokenize_document(document: str) -> list[str]:
    """
    Splits a sentence (str) into words and returns a list of words (substr).
    """
    lower_document = document.lower()
    tokens = word_tokenize(lower_document)
    return tokens

def remove_stopwords(tokens: list[str]) -> list[str]:
    """
    This removes a list of 40 stop words, including "a", "an", "the", "of", etc.
    """
    stop_words = set(stopwords.words("english"))
    stop_words.update(["like", "yeah", "umm"])
    cleaned_tokens = [word for word in tokens if word.isalnum() and word not in stop_words]
    return cleaned_tokens

def remove_small_words(tokens: list[str]) -> list[str]:
    """
    This removes small words from the tokenized document.
    """
    return [token for token in tokens if len(token)>3]

def clean_document_for_analysis(document: str, interviewer_name: str, participant_name: str) -> list[str]:
    """
    From an interview document, remove timestamps, the name of the interviewer and their questions, and the name of
    the participant. The pattern is two timestamps representing duration, followed by a linebreak, followed by a name,
    followed by a line of dialogue.
    """
    bad_line_numbers = []
    for line_number, line in enumerate(document.split("\n")):
        if interviewer_name in line:
            bad_line_numbers.extend([line_number, line_number + 1])
        if any(not_wanted in line for not_wanted in ("-->", participant_name)):
            bad_line_numbers.append(line_number)
    cleaned_lines = [line.strip("\n") for line_number, line in enumerate(document.split("\n")) if line_number not in bad_line_numbers and line != "\n"]
    participant_content = "\n".join(cleaned_lines)
    tokenized_document = tokenize_document(participant_content)
    cleaned_document = remove_stopwords(remove_small_words(tokenized_document))
    return cleaned_document