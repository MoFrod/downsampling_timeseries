from src.filter_functions import filter_dataframe
import pandas as pd


def test_filter_function():
    """
    Test that the filter function slices the dataframe and returns a new copy

    :return:
    """
    test_data = {"method": ["first", "second"], "dataset": [1, 2]}
    test_df = pd.DataFrame.from_dict(test_data)
    filtered_df = filter_dataframe(test_df, "first", 1)
    assert len(filtered_df) == 1
    assert len(test_df) == 2
