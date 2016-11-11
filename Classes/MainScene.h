#ifndef __MAINSCENE_SCENE_H__
#define __MAINSCENE_SCENE_H__

#include "cocos2d.h"
#include "ui/CocosGUI.h"
#include "Piece.h"
#include "Constants.h"

enum class GameState
{
	Title,
	Ready,
	Playing,
	GameOver
};

class Character;

class MainScene : public cocos2d::Layer
{
public:
    // there's no 'id' in cpp, so we recommend returning the class instance pointer
    static cocos2d::Scene* createScene();

    // Here's a difference. Method 'init' in cocos2d-x returns bool, instead of returning 'id' in cocos2d-iphone
    virtual bool init();

    // implement the "static create()" method manually
    CREATE_FUNC(MainScene);

protected:
	void setupTouchHandling();
	void setupKeyboardHandling();
	void onEnter() override;
	void update( float dt ) override;

	Character* character;

private:
	Side getSideForObstacle( Side lastSide );
	void stepTower();
	bool isGameOver();
	void triggerTitle();
	void triggerReady();
	void triggerGameOver();
	void triggerPlaying();
	void resetGameState();
	void setScore( int score );
	void setTimeLeft( float timeLeft );
	void animateHitPiece( Side obstacleSide );

	cocos2d::Node* pieceNode;
	cocos2d::Vector<Piece*> pieces;
	Side lastObstacleSide;
	int pieceIndex;
	GameState gameState;
	bool isAnimatingGameOver;

	cocos2d::ui::Text* scoreLabel;
	int score;

	cocos2d::Sprite* timeBar;
	float timeLeft;

	cocos2d::Vec2 flyingPiecePosition;
};

#endif // __MAINSCENE_SCENE_H__
