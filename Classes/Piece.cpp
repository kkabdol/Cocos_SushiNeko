#include "Piece.h"

using namespace cocos2d;

float Piece::getSpriteHeight() const
{
	// first grab a reference to the roll sprite
	Sprite* roll = this->getChildByName<Sprite*>( "roll" );
	return roll->getContentSize().height;
}

void Piece::setObstacleSide( Side side )
{
	this->obstacleSide = side;

	Sprite* roll = this->getChildByName<Sprite*>( "roll" );
	
	Sprite* leftChopstick = roll->getChildByName<Sprite*>( "leftChopstick" );
	Sprite* rightChopstick = roll->getChildByName<Sprite*>( "rightChopstick" );

	switch( this->obstacleSide )
	{
		case Side::None:
			leftChopstick->setVisible( false );
			rightChopstick->setVisible( false );
			break;
		case Side::Left:
			leftChopstick->setVisible( true );
			rightChopstick->setVisible( false );
			break;
		case Side::Right:
			leftChopstick->setVisible( false );
			rightChopstick->setVisible( true );
			break;
	}
}

Side Piece::getObstacleSide() const
{
	return this->obstacleSide;
}
