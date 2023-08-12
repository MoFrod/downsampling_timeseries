from src.document_cleaning import clean_document_for_analysis, remove_stopwords


# def test_clean_document_for_analysis():
#     test_document = """
#     0:0:0.0 --> 0:0:2.820
#     Interviewer
#     Timing about yourself and your most recent role. 

#     0:0:4.430 --> 0:0:5.120 
#     Participant 
#     Yeah, of course. 
    
#     0:0:5.130 --> 0:0:6.400 
#     Participant
#     Uh, my name is Participant Name
#     """
#     expected_output = """
#     Yeah, of course
#     """
#     output = clean_document_for_analysis(test_document, "Interviewer", participant_name="Participant")
#     assert output == expected_output

def test_remove_stopwords():
    test_input = ["Yeah", "of", "course"]
    expected_output = ["Yeah", "course"]
    output = remove_stopwords(test_input)
    assert output == expected_output
    