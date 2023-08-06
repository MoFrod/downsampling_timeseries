# Function to clean the original document, retaining more relevant content
def clean_document_for_analysis(doc_path):
    # Read the document
    document = Document(doc_path)
    cleaned_text = []

    # Iterate through the paragraphs and clean the content
    for paragraph in document.paragraphs:
        # Check if the paragraph contains timestamp or interviewer content
        if '-->' in paragraph.text or 'Interviewer' in paragraph.text:
            continue

        # Remove the "Decision Maker" label if present
        cleaned_paragraph = paragraph.text.replace("Decision Maker", "").strip()

        # Add the cleaned text to the result
        cleaned_text.append(cleaned_paragraph)

    return " ".join(cleaned_text)

# Clean the original document for analysis
cleaned_text_for_analysis = clean_document_for_analysis(doc_path)
cleaned_text_for_analysis[:500] # Displaying the first 500 characters of the cleaned text
