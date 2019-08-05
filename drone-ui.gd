extends Control

var v = Vector2.ZERO

func display(ang,lin,transform,circle=true):
	
	$dalt.value = lin.y
	$alt.value = log(transform.origin.y)
	$Labelq.text = str(ang, lin)
	$Circle.visible = circle
	v.x = log(lin.x)
	v.y = log(lin.z)
	
	update()

func _draw():
	draw_line( rect_size*0.5, rect_size*0.5+v*10, Color(0,1,0), 3)