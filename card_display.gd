extends StaticBody2D

var card1
var card2
var card3
var card4
var card5
var card6
var card7
var card8
var card9
var card0
var page = 1
var totalpages
var cardlist
var nextbutton
var previousbutton
var pressedcard


func _ready():
	card1 = $Card1
	card2 = $Card2
	card3 = $Card3
	card4 = $Card4
	card5 = $Card5
	card6 = $Card6
	card7 = $Card7
	card8 = $Card8
	card9 = $Card9
	card0 = $Card0
	nextbutton = $Next
	previousbutton = $Previous
	
	cardlist = [card1, card2, card3, card4, card5,
				card6, card7, card8, card9, card0]
		
	impvars.card_display_open.connect(_drawCard)
	nextbutton.pressed.connect(_nextPage)
	previousbutton.pressed.connect(_previousPage)
	
	card1.pressed.connect(_card1pressed)
	card2.pressed.connect(_card2pressed)
	card3.pressed.connect(_card3pressed)
	card4.pressed.connect(_card4pressed)
	card5.pressed.connect(_card5pressed)
	card6.pressed.connect(_card6pressed)
	card7.pressed.connect(_card7pressed)
	card8.pressed.connect(_card8pressed)
	card9.pressed.connect(_card9pressed)
	card0.pressed.connect(_card0pressed)
	

func _drawCard():
	for i in 10:
		((cardlist[i]).texture_normal).region = Rect2(1,1,1,1)
	if impvars.playercardsshown == 1:
		var s = impvars.player1.size()
		if s <= 10:
			for i in s:
				var card = impvars.player1[i]
				var cardx = cardlist[i]
				var cardcoord = impvars.artdeck[card]
				(cardx.texture_normal).region = Rect2(cardcoord[0], cardcoord[1], 48, 64)
		else:
			totalpages = ceili(s/10.0)
			if page == totalpages:
				if s%10 == 0:
					for i in 10:
						var card = impvars.player1[i]
						var cardx = cardlist[i]
						var cardcoord = impvars.artdeck[card]
						(cardx.texture_normal).region = Rect2(cardcoord[0], cardcoord[1], 48, 64)
				else:
					var j = 0
					var noofcards = s-(10*(totalpages-1))
					for i in range(s-noofcards, s):
						var card = impvars.player1[i]
						var cardx = cardlist[j]
						var cardcoord = impvars.artdeck[card]
						(cardx.texture_normal).region = Rect2(cardcoord[0], cardcoord[1], 48, 64)
						j += 1
			else:
				var j = 0
				var firstcard = ((page*10)-10)
				for i in range(firstcard, (firstcard+10)):
						var card = impvars.player1[i]
						var cardx = cardlist[j]
						var cardcoord = impvars.artdeck[card]
						(cardx.texture_normal).region = Rect2(cardcoord[0], cardcoord[1], 48, 64)
						j += 1


func _nextPage():
	if page != totalpages:
		page += 1
		_drawCard()
		

func _previousPage():
	if page != 1:
		page -= 1
		_drawCard()


func _cardselected():
	var xcoord = int(pressedcard.texture_normal.region.position[0])
	var ycoord = int(pressedcard.texture_normal.region.position[1])
	var coords = [xcoord, ycoord]
	var cardpicked
	
	for i in impvars.artdeck:
		if impvars.artdeck[i] == coords:
			cardpicked = i
			break
			
	if cardpicked[0] != "W" and impvars.card_on_top[0] == "W" and impvars.selected_color == cardpicked[0]:
		impvars.card_on_top = cardpicked
		impvars.deck.append(cardpicked)
		impvars.emit_signal("card_display_close")
	elif cardpicked[0] == "W" and impvars.card_on_top[0] != "W":
		impvars.card_on_top = cardpicked
		impvars.deck.append(cardpicked)
		impvars.emit_signal("open_color")
	elif cardpicked[0] == impvars.card_on_top[0] and cardpicked[0] == impvars.selected_color:
		impvars.card_on_top = cardpicked
		impvars.deck.append(cardpicked)
		impvars.emit_signal("card_display_close")
	elif cardpicked[1] == impvars.card_on_top[1]:
		impvars.card_on_top = cardpicked
		impvars.deck.append(cardpicked)
		impvars.emit_signal("card_display_close")
		
	print(impvars.card_selected)


func _card1pressed():
	pressedcard = card1
	_cardselected()
	
	
func _card2pressed():
	pressedcard = card2
	_cardselected()
	
	
func _card3pressed():
	pressedcard = card3
	_cardselected()
	
	
func _card4pressed():
	pressedcard = card4
	_cardselected()
	
	
func _card5pressed():
	pressedcard = card5
	_cardselected()
	
	
func _card6pressed():
	pressedcard = card6
	_cardselected()
	
	
func _card7pressed():
	pressedcard = card7
	_cardselected()
	
	
func _card8pressed():
	pressedcard = card8
	_cardselected()
	
	
func _card9pressed():
	pressedcard = card9
	_cardselected()
	
	
func _card0pressed():
	pressedcard = card0
	_cardselected()
	
	
