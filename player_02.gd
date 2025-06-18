extends MeshInstance3D

@onready var ray_cast_3d: RayCast3D = $StaticBody3D/CollisionShape3D/RayCast3D
var hit_marker = preload("res://hit_marker.tscn")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		# do something
		print("SHOOT") 
		print(ray_cast_3d)
		print(ray_cast_3d.get_collider())
		shoot_ray()
		#RayCast.target_position = 


func shoot_ray() -> void:
	var instance = hit_marker.instantiate()
	instance.set_position(ray_cast_3d.get_collision_point())	
	get_parent_node_3d().add_child(instance)
