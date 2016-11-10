#pragma once
#include "cocos2d.h"
#include "cocostudio/CocoStudio.h"
#include "Constants.h"

USING_NS_CC;

class Character : public cocos2d::Node
{
public:
	CREATE_FUNC( Character );

	void setSide( Side side );
	Side getSide() const;

	bool init() override;
	void onExit() override;
	void runChopAnimation();

protected:
	Side side;

	cocostudio::timeline::ActionTimeline* timeline;
};