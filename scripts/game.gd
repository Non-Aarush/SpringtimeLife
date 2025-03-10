extends Node2D

# Save path for the data file
var save_path = "user://savegame.dat"


# Global variables to store data
var total_coins = 0
var total_fruits = 0

# Load data when the scene is ready
func _ready():

	total_coins = GameController.total_coins
	total_fruits = GameController.total_fruits
	print(GameController)
	print("coins :", GameController.total_coins)
	print("fruits :",GameController.total_fruits)
	load_date()
 

# Function to quit the game
func _on_quit_pressed():
	get_tree().quit()

# Function to change scenes
func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/home.tscn")

# Save function to write data to file
func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(total_coins)
	file.store_var(total_fruits)
	file.close()  # Make sure to close the file after writing

# Load function to read data from file
func load_date():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		total_coins = file.get_var()
		total_fruits = file.get_var()
		file.close() 
		print("Data loaded successfully!")
		print("Coins:", total_coins)
		print("Fruits:", total_fruits)# Make sure to close the file after reading
	else:
		print("no data saved...")
		total_coins = 0
		total_fruits = 0

# Button function to save data
func _on_texture_button_2_pressed() -> void:
	save()
