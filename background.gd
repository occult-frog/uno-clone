extends StaticBody2D

var p1
var p2
var p3
var p4
var carddisplay
var colordisplay
var deck

func _ready():
	randomize()
	
	carddisplay = $CardDisplay
	colordisplay = $ColorSelector
	deck = $Deck
	$".".remove_child(colordisplay)
	$".".remove_child(carddisplay)
	
	impvars.deck.shuffle()
	
	for i in 25:
		p1 = impvars.deck.pick_random()
		p2 = impvars.deck.pick_random()
		p3 = impvars.deck.pick_random()
		p4 = impvars.deck.pick_random()
		impvars.player1.append(p1)
		impvars.player2.append(p2)
		impvars.player3.append(p3)
		impvars.player4.append(p4)
		impvars.deck.erase(p1)
		impvars.deck.erase(p2)
		impvars.deck.erase(p3)
		impvars.deck.erase(p4)
		
	var a = impvars.deck.pick_random()
	if a == "W" or a == "W+4" or a[1] == "R" or a[1] == "S" or a[1] == "+":
		while a == "W" or a == "W+4" or a[1] == "R" or a[1] == "S" or a[1] == "+":
			a = impvars.deck.pick_random()
			impvars.card_on_top = a
			impvars.selected_color = a[0]
			print(impvars.selected_color)
			print(a)
	else:
		impvars.card_on_top = a
		impvars.selected_color = a[0]
		print(impvars.selected_color)
		print(a)
		
	for i in impvars.artdeck:
		if i == a:
			var cardcoord = impvars.artdeck[i]
			deck.region_rect = Rect2(cardcoord[0], cardcoord[1], 48, 64)
	
	print(impvars.player1, "\n")
	print(impvars.player2, "\n")
	print(impvars.player3, "\n")
	print(impvars.player4, "\n")
	print(impvars.deck, "\n")
	
	impvars.card_display_open.connect(_openCardDisplay)
	impvars.open_color.connect(_openColorDisplay)
	impvars.close_color.connect(_closeColorDisplay)
	impvars.card_display_close.connect(_closeCardDisplay)
	

func _openCardDisplay():
	add_child(carddisplay)
	
func _openColorDisplay():
	add_child(colordisplay)
	remove_child(carddisplay)

func _closeCardDisplay():
	remove_child(carddisplay)


func _closeColorDisplay():
	remove_child(colordisplay)
	print(impvars.selected_color)
