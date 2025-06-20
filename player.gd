@tool
class_name Player
extends MeshInstance3D

@onready var ray_cast_3d: RayCast3D = $StaticBody3D/CollisionShape3D/RayCast3D


var hit_marker = preload("res://hit_marker.tscn")

@export var spread_factor = 13
	#set(value):
		#spread_factor = value
		#get_new_ray_direction()
		
#@export_color_no_alpha var player_color:
	#set(value):
		#player_color = value
		#get_mesh().surface_get_material(0).albedo_color = value
		
@export var bullet_material: StandardMaterial3D

@export var player_death_material: StandardMaterial3D
		
func _ready() -> void:
#	Running first to make sure initial shot isnt always in same place
	get_new_ray_direction()
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		get_new_ray_direction()
		shoot_ray()


func shoot_ray() -> void:
	var instance = hit_marker.instantiate()
	# using get_child here as a stand in, should make material setting function in the hhit marker for more flexibility	
	instance.get_child(0).set_surface_override_material(0, bullet_material)
	var collision_point = ray_cast_3d.get_collision_point()
	instance.set_position(collision_point)	
	get_parent_node_3d().add_child(instance)
	var collider = ray_cast_3d.get_collider()
	print(collider.get_parent())
	if collider.get_parent() is Player:
		print("Player class hit")
		collider.get_parent().hit_reaction()
	

func get_new_ray_direction() -> void:
	#	for now keep forward ray the same
	ray_cast_3d.target_position.x = (randf()-0.5) * 2 * spread_factor
	ray_cast_3d.target_position.y = (randf()-0.5) * 2 * spread_factor
	
func hit_reaction() -> void:
	print("hit!")
	set_surface_override_material(0, player_death_material)
