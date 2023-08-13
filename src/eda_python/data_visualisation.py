import seaborn as sns
import matplotlib.pyplot as plt

def data_inputs() -> dict[str, list]:
    """
    This represents the data we've read from a .csv
    """
    return {"categorical": ["a", "b", "c"], "numeric": [1, 2, 3]} 

def basic_vis() -> None :

# Apply the default theme
    sns.set_theme()

# Load an example dataset
    tips = sns.load_dataset("tips")

#Create a visualization
    sns.relplot(
    data=data_inputs(),
    x="categorical", y="numeric", #col="categorical",
    #hue="smoker", style="smoker", size="size",
)

    plt.savefig("seaborn_plot.png")

basic_vis()