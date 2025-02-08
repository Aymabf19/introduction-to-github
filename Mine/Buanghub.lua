import tkinter as tk
from tkinter import messagebox

# List containing only the secret units (example secret units)
secret_units = [
    "Seifer (Secret)",
    "Ice Queen (Secret)",
    "Apollo (Secret)",
    "Dark Knight (Secret)",
    "Phantom Mage (Secret)"
]

# Function to select the unit and show a confirmation message
def select_unit():
    selected_unit = unit_listbox.get(unit_listbox.curselection())
    messagebox.showinfo("Unit Selected", f"You have selected: {selected_unit}")

# Create the application window
root = tk.Tk()
root.title("Anime Defenders - Select Secret Unit")

# Create a Listbox to display the secret units
unit_listbox = tk.Listbox(root, height=10, width=40)
for unit in secret_units:
    unit_listbox.insert(tk.END, unit)

# Add a button to select the unit
select_button = tk.Button(root, text="Select Unit", command=select_unit)

# Arrange elements in the window
unit_listbox.pack(pady=20)
select_button.pack()

# Run the application
root.mainloop()
