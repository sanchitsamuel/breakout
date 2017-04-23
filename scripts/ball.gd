extends RigidBody2D

const SPEEDUP = 4
const MAXSPEED = 300

func _ready():
	set_fixed_process(true)
	pass

func _fixed_process(delta):
		#this returns the list of bodies
		#it contacts with bt needs to be enabled 
		#in the inspector for the body
	
	var bodies = get_colliding_bodies()
	
	for body in bodies:
		if body.is_in_group('g_brick'):
			body.queue_free()
			
		if body.get_name() == 'Paddle':
			delta = delta * 100
			var speed = get_linear_velocity().length()
			var distance = get_pos() - body.get_node('Anchor').get_global_pos()
			var velocity = distance.normalized() * min(speed + SPEEDUP * delta, MAXSPEED * delta)
			set_linear_velocity(velocity)