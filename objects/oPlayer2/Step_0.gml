if(hp<=0){
	with(pUnit){
		if(other.id==creator.id){
			instance_destroy();
		}
	}
	instance_destroy();
}

if(beginTurn){
	with(pUnit){
		if(other.id==creator.id){
			actions=maxActions;
		}
	}
	if(turnMana<maxMana){
		turnMana++;
		mana=turnMana;
	}
	if(handSize<maxHandSize){
		handSize++;
	}
	beginTurn=false;
	active=true;
}else if(active){
	if(keyboard_check_pressed(vk_space)){
		active=false;
		oPlayer1.beginTurn=true;
	}
	if(!deckShuffled){
		instance_create_depth(0,0,0,oDeck2);
		deckSize=oDeck2.deckSize;
		for(var i=0;i<deckSize;i++){
			card[i]=oDeck2.card[oDeck2.deck[i]];
			cardName[i]=oDeck2.cardName[oDeck2.deck[i]];
			cardMana[i]=oDeck2.cardMana[oDeck2.deck[i]];
		}
		instance_destroy(oDeck2);
		deckShuffled=true;
	}
}