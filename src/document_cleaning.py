from docx import Document


def get_document(filepath: str) -> str:
    """
    Returns the document as a great big string

    """
    doc = Document(filepath)
    full_text = []
    for paragraph in doc.paragraphs:
        full_text.append(paragraph.text)
    return '\n'.join(full_text)


# Function to clean the original document, retaining more relevant content


def clean_document_for_analysis(document: str, interviewer_name: str, participant_name: str):
    """
    From an interview document, remove timestamps, the name of the interviewer and their questions, and the name of
    the participant. The pattern is two timestamps representing duration, followed by a linebreak, followed by a name,
    followed by a line of dialogue
    """
    bad_line_numbers = []
    for line_number, line in enumerate(document.split("\n")):
        if interviewer_name in line:
            bad_line_numbers.extend([line_number, line_number + 1])
        if any(not_wanted in line for not_wanted in ("-->", participant_name)):
            bad_line_numbers.append(line_number)
    cleaned_lines = [line.strip("\n") for line_number, line in enumerate(document.split("\n")) if line_number not in bad_line_numbers and line != "\n"]
    return "\n".join(cleaned_lines)
