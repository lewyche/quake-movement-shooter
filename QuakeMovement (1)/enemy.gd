extends KinematicBody

export var health = 200


func _ready():
	pass # Replace with function body.

func hit(dmg):
	$umph.play()
	health -= dmg

func _process(delta):
	if health <= 0:
		queue_free()
