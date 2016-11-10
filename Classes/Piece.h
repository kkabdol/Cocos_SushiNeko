#pragma once
#include "cocos2d.h"
#include "Constants.h"

class Piece : public cocos2d::Node
{
public:
	CREATE_FUNC( Piece );

	float getSpriteHeight() const;
	void setObstacleSide( Side side );
	Side getObstacleSide() const;

protected:
	Side obstacleSide;
};