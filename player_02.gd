extends MeshInstance3D

@onready var ray_cast_3d: RayCast3D = $StaticBody3D/CollisionShape3D/RayCast3D

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		# do something
		print("SHOOT") 
		print(ray_cast_3d)
		print(ray_cast_3d.get_collider())
		#RayCast.target_position = 
