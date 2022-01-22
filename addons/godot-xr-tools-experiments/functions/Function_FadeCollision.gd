extends Spatial

## Layers to collide with
##
## @desc:
##    This property sets the layers this fade collision checks for.
export (int, LAYERS_3D_PHYSICS) var collision_layers = 0

## Collision distance at which fading begins
##
## @desc:
##    This distance sets how far away from the camera a collision must be to
##    begin obscuring the view
export (float) var fade_start_distance = 0.2

## Collision distance for totally obscuring the view
##
## @desc:
##    This distance sets how far away from the camera a collision must be to
##    totally obscure the view
export (float) var fade_full_distance = 0.15

# Current fade contribution [0..1] - used by Fader
var fade_contribution = 0.0

# Shape to use for collision detection
var collision_shape = null

# Parameters to use for collision detection
var collision_parameters = null

# World space to use for collision detection
var space = null

# Called when the node enters the scene tree for the first time.
func _ready():
	# Construct a sphere for the collision shape
	collision_shape = SphereShape.new()
	collision_shape.radius = fade_start_distance
	
	# Construct the collosion parameters
	collision_parameters = PhysicsShapeQueryParameters.new()
	collision_parameters.collision_mask = collision_layers
	collision_parameters.set_shape(collision_shape)

	# Get the space to test collisions in
	space = get_world().direct_space_state

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Update the collision parameters to include our global location
	collision_parameters.transform = global_transform

	# Find closest collision
	var results = space.get_rest_info(collision_parameters)
	if "point" in results:
		# Collision detected, calculate distance to closet collision point
		var delta_pos = global_transform.origin - results["point"]
		var length = delta_pos.length()
		
		# Fade based on distance
		var fade = inverse_lerp(fade_start_distance, fade_full_distance, length)	
		fade_contribution = clamp(fade, 0.0, 1.0)
	else:
		# No collision
		fade_contribution = 0
