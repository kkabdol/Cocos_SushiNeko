#include "Character.h"

void Character::setSide( Side side )
{
	this->side = side;

	if( this->side == Side::Right )
	{
		this->setScaleX( -1.0f );
	}
	else
	{
		this->setScaleX( 1.0f );
	}
}

Side Character::getSide() const
{
	return side;
}

bool Character::init()
{
	if( !Node::init() )
	{
		return false;
	}

	// the character starts on the left side
	this->side = Side::Left;

	// load the character animation timeline
	this->timeline = CSLoader::createTimeline( "Character.csb" );

	// retain the character animation timeline so it doesn't get deallocated
	this->timeline->retain();

	return true;
}

void Character::onExit()
{
	// release the retain we called in init
	this->timeline->release();

	Node::onExit();
}

void Character::runChopAnimation()
{
	this->stopAllActions();
	this->runAction( this->timeline );
	timeline->play( "chop", false );
}
