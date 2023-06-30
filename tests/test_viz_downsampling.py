import pandas as pd

from src.python_viz_downsampling import filter_dataframe

def test_filter_dataframe():
    test_data = {"method": "simpledecimation", "method": "percentagechange"}
    test_dataframe = pd.DataFrame(test_data)
    print(test_dataframe)
    assert False