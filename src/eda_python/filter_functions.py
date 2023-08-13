import functools
from typing import Generator

import pandas as pd


def filter_dataframe(dataframe: pd.DataFrame, method: str, dataset: str, param: str) -> pd.DataFrame:
    """
    Filter a dataframe and return it

    :param dataframe:
    :param method:
    :param dataset:
    :param param:
    :return: the filtered dataframe
    """
    return dataframe.loc[(dataframe.method == method) & (dataframe.dataset == dataset) & (dataframe.param == param)]


def split_dataframe(big_dataframe: pd.DataFrame, dataset: str) -> Generator[pd.DataFrame, None, None]:
    """
    Create a generator of slices of the big_dataframe. It's a generator so that we don't overwhelm the memory of the
    system
    
    :param big_dataframe:
    :return:
    """
    partial_filter = functools.partial(filter_dataframe, big_dataframe, dataset = dataset)
    for method_str in big_dataframe.method.unique():
        for param_str in big_dataframe.param.unique():
            yield partial_filter(method=method_str, param=param_str)

def 
