extends StaticBody2D

var redbutton
var bluebutton
var greenbutton
var yellowbutton

func _ready():
	redbutton = $Red
	bluebutton = $Blue
	greenbutton = $Green
	yellowbutton = $Yellow
	
	if impvars.selected_color == "R":
		redbutton.text = "Red\n(Current)"
	elif impvars.selected_color == "B":
		bluebutton.text = "Blue\n(Current)"
	elif impvars.selected_color == "Y":
		yellowbutton.text = "Yellow\n(Current)"
	elif impvars.selected_color == "G":
		greenbutton.text = "Green\n(Current)"
		
	redbutton.pressed.connect(_redSelected)
	bluebutton.pressed.connect(_greenSelected)
	yellowbutton.pressed.connect(_yellowSelected)
	bluebutton.pressed.connect(_greenSelected)
	

func _redSelected():
	if impvars.selected_color != "R":
		impvars.selected_color = "R"
		impvars.emit_signal("close_color")
		
		
func _blueSelected():
	if impvars.selected_color != "B":
		impvars.selected_color = "B"
		impvars.emit_signal("close_color")
		
		
func _yellowSelected():
	if impvars.selected_color != "Y":
		impvars.selected_color = "Y"
		impvars.emit_signal("close_color")
		
		
func _greenSelected():
	if impvars.selected_color != "G":
		impvars.selected_color = "G"
		impvars.emit_signal("close_color")
