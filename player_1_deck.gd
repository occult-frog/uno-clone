extends StaticBody2D

var showbutton

func _ready():
	showbutton = $Show
	
	showbutton.pressed.connect(_showCards)
	
	
func _showCards():
	impvars.playercardsshown = 1
	impvars.emit_signal("card_display_open")
