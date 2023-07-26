extends MeshInstance

onready var aimcast = get_node("../Camera/aimcast")
onready var animation = $spinner/AnimationPlayer
onready var bullethole = preload("res://bullethole.tscn")

export var damage = 50

var is_ads = false

func create_bullet_hole(point, normal):
	var new_hole = bullethole.instance()
	get_node("../../../").add_child(new_hole)
	new_hole.transform.origin = point
	new_hole.look_at(point + normal, Vector3.UP)

func _physics_process(_delta):
	if Input.is_action_just_pressed("fire"):
		
		if $Timer.is_stopped():
			
			
			$gun_player.play()
			animation.play("Spin")
			
			if aimcast.is_colliding():
				
				var collider = aimcast.get_collider()
				
				create_bullet_hole(aimcast.get_collision_point(), aimcast.get_collision_normal())
				
				if collider.is_in_group("enemy"):
					collider.hit(damage)
			$Timer.start()
	if Input.is_action_just_pressed("ads"):
		
		if is_ads == false:
			animation.play("aim")
			is_ads = true
		else:
			animation.play("unaim")
			is_ads = false

func _ready():
	pass # Replace with function body.
