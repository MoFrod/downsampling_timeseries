import networkx as nx
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.colors import to_rgba, to_hex

def lighten_color(color, fraction=0.3):
    rgba_color = to_rgba(color)
    lighter_color = ((1 - fraction) * rgba_color[i] + fraction for i in range(3))
    return to_hex((*lighter_color, 1))

def grouped_concentric_radial_layout(G, core_node, main_themes, sub_themes):
    pos = {}
    pos[core_node] = (0, 0)
    num_main_themes = len(main_themes)
    main_radius = 1
    for i, theme in enumerate(main_themes):
        angle = 2 * np.pi * i / num_main_themes
        pos[theme] = (main_radius * np.cos(angle), main_radius * np.sin(angle))
        num_sub_themes = len(sub_themes[theme])
        sub_radius = 2
        sub_angle_start = angle - (np.pi / num_main_themes)
        sub_angle_end = angle + (np.pi / num_main_themes)
        for j, subtheme in enumerate(sub_themes[theme]):
            sub_angle = sub_angle_start + (sub_angle_end - sub_angle_start) * j / (num_sub_themes - 1 if num_sub_themes > 1 else 1)
            pos[subtheme] = ((main_radius + sub_radius) * np.cos(sub_angle),
                             (main_radius + sub_radius) * np.sin(sub_angle))
    return pos

def draw_final_concept_map(G, pos, core_node, main_themes, sub_themes):
    plt.figure(figsize=(12, 8), facecolor='whitesmoke')
    core_color = paired_colors(1)
    nx.draw_networkx_nodes(G, pos, nodelist=[core_node], node_size=5000, node_color=[core_color], node_shape='o')
    nx.draw_networkx_labels(G, pos, labels={core_node: core_node}, font_size=12, font_weight='bold')

    for i, theme in enumerate(main_themes):
        theme_color = paired_colors(i + 2) if theme != "Quality and Need" else "lightblue"
        subtheme_colors = [lighten_color(theme_color) for _ in sub_themes[theme]]
        nx.draw_networkx_nodes(G, pos, nodelist=[theme], node_size=3000, node_color=[theme_color], node_shape='o')
        nx.draw_networkx_nodes(G, pos, nodelist=sub_themes[theme], node_size=2000, node_color=subtheme_colors, node_shape='o')
        nx.draw_networkx_labels(G, pos, labels={node: node for node in [theme] + sub_themes[theme]}, font_size=8 + (2 if theme != "Trust" else 0))

    nx.draw_networkx_edges(G, pos, edge_color='gray', width=1, arrowsize=15)
    plt.title("Data-Driven Decision Making: A Hierarchical Concept Map", fontsize=14, pad=20)
    plt.axis("off")
    plt.tight_layout()
    plt.show()

# Define the Paired color map
paired_colors = get_cmap('Paired')

# Main themes and sub-themes
main_themes = ["Data", "Time", "Decision Making", "Quality and Need", "Trust"]
sub_themes = {
    "Data": ["points", "analysis", "insights", "information"],
    "Time": ["constraints", "real-time processing", "time-based analysis", "time management"],
    "Decision Making": ["strategic", "consequences", "interrogate", "stakes"],
    "Quality and Need": ["accuracy", "reliability", "accessibility", "timeliness"],
    "Trust": ["higher", "thinking", "bottoming"]
}

# Create the graph and add nodes and edges
G_updated = nx.DiGraph()
G_updated.add_node("Data-Driven Decision Making")
G_updated.add_nodes_from(main_themes)
G_updated.add_edges_from([("Data-Driven Decision Making", theme) for theme in main_themes])
for theme, subtheme_list in sub_themes.items():
    G_updated.add_nodes_from(subtheme_list)
    G_updated.add_edges_from([(theme, subtheme) for subtheme in subtheme_list])

# Compute the grouped concentric radial layout positions
grouped_concentric_radial_positions_final = grouped_concentric_radial_layout(G_updated, "Data-Driven Decision Making", main_themes, sub_themes)

# Draw the final concept map
draw_final_concept_map(G_updated, grouped_concentric_radial_positions_final, "Data-Driven Decision Making", main_themes, sub_themes)

