extends Spatial

# Current fade level [0..1]
var current_fade := 0.0

# Material on fade mesh
var fade_material : Material = null

# Array of fade-contributors
var fade_contributors = Array()

# Called when the node enters the scene tree for the first time.
func _ready():
	# Get the fade material
	fade_material = $FadeMesh.get_surface_material(0)
	
	# Get all fade contributor nodes
	fade_contributors = get_tree().get_nodes_in_group("fade_contributor")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Get the highest fade from all contributors [0..1]
	var fade = 0.0
	for f in fade_contributors:
		fade = max(fade, f.fade_contribution)
	
	# Clamp the fade to ensure legal range
	fade = clamp(fade, 0.0, 1.0)
	
	# Adjust the fade level if necessary
	if fade != current_fade:
		# Update the current fade
		current_fade = fade
		
		# Set the fade mesh alpha channel
		fade_material.albedo_color.a = fade
		
		# Enable the fade mesh only if we have anything to fade
		$FadeMesh.visible = current_fade > 0
