#include "MainScene.h"
#include "cocostudio/CocoStudio.h"
#include "ui/CocosGUI.h"
#include "CharacterReader.h"
#include "PieceReader.h"
#include "Character.h"

USING_NS_CC;

using namespace cocostudio::timeline;

Scene* MainScene::createScene()
{
    // 'scene' is an autorelease object
    auto scene = Scene::create();
    
    // 'layer' is an autorelease object
    auto layer = MainScene::create();

    // add layer as a child to scene
    scene->addChild(layer);

    // return the scene
    return scene;
}

// on "init" you need to initialize your instance
bool MainScene::init()
{
    //////////////////////////////
    // 1. super init first
    if ( !Layer::init() )
    {
        return false;
    }

	// Register the readers for our custom classes
	// Be very careful to do CharacterReader::getInstance, not CharacterReader::getInstance() which will crash
	CSLoader* instance = CSLoader::getInstance();
	instance->registReaderObject( "CharacterReader", ( ObjectFactory::Instance ) CharacterReader::getInstance );
	instance->registReaderObject( "PieceReader", ( ObjectFactory::Instance ) PieceReader::getInstance );
    
    auto rootNode = CSLoader::createNode("MainScene.csb");

	//Size size = Director::getInstance()->getVisibleSize();
	//rootNode->setContentSize( size );
	//ui::Helper::doLayout( rootNode );

    addChild(rootNode);
	this->pieceNode = rootNode->getChildByName( "pieceNode" );
	this->character = rootNode->getChildByName<Character*>( "character" );

	this->lastObstacleSide = Side::Left;
	float rollHeight = 0;
	for( int i = 0; i < cNumberOfSuchi; ++i )
	{
		Piece* piece = dynamic_cast< Piece* >( CSLoader::createNode( "Piece.csb" ) );

		if( rollHeight == 0 )
		{
			rollHeight = piece->getSpriteHeight();
		}

		piece->setPosition( 0.0f, rollHeight / 2.0f * i );

		this->pieceNode->addChild( piece );
		this->pieces.pushBack( piece );

		this->lastObstacleSide = this->getSideForObstacle( this->lastObstacleSide );
		piece->setObstacleSide( this->lastObstacleSide );
	}

	this->pieceIndex = 0;
	this->gameState = GameState::Title;
	this->isAnimatingGameOver = false;

	this->scoreLabel = rootNode->getChildByName<cocos2d::ui::Text*>( "scoreLabel" );

	auto lifeBG = rootNode->getChildByName( "lifeBG" );
	this->timeBar = lifeBG->getChildByName<Sprite*>( "lifeBar" );

	resetGameState();

    return true;
}

void MainScene::setupTouchHandling()
{
	auto touchListener = EventListenerTouchOneByOne::create();

	touchListener->onTouchBegan = [ & ]( Touch* touch, Event* event )
	{
		switch( this->gameState )
		{
			case GameState::Title:
				this->triggerReady();
				break;

			case GameState::Ready:
				this->triggerPlaying();
				// fall through

			case GameState::Playing:
				{
					// get the location of the touch in the MainScene's coordinate system
					Vec2 touchLocation = this->convertTouchToNodeSpace( touch );

					// check if the touch was on the left or right side of the screen
					// move the character to the appropriate side
					if( touchLocation.x < this->getContentSize().width / 2.0f )
					{
						this->character->setSide( Side::Left );
					}
					else
					{
						this->character->setSide( Side::Right );
					}

					if( isGameOver() )
					{
						triggerGameOver();
						return true;
					}

					this->stepTower();
					this->character->runChopAnimation();

					if( isGameOver() )
					{
						triggerGameOver();
						return true;
					}

					setScore( this->score + 1 );
					setTimeLeft( this->timeLeft + cBonusTimeLeft );
				}
				break;

			case GameState::GameOver:
				if( !this->isAnimatingGameOver )
				{
					this->resetGameState();
					this->triggerReady();
				}
				break;
		}

		return true;		
	};

	this->getEventDispatcher()->addEventListenerWithSceneGraphPriority( touchListener, this );
}

void MainScene::setupKeyboardHandling()
{
	auto keyboardListener = EventListenerKeyboard::create();
	keyboardListener->onKeyPressed = [ & ]( EventKeyboard::KeyCode keyCode, Event* event )
	{
		switch( this->gameState )
		{
			case GameState::Title:
				this->triggerReady();
				break;

			case GameState::Ready:
				this->triggerPlaying();
				// fall through

			case GameState::Playing:
				{
					if( keyCode == EventKeyboard::KeyCode::KEY_LEFT_ARROW )
					{
						this->character->setSide( Side::Left );
					}
					else if( keyCode == EventKeyboard::KeyCode::KEY_RIGHT_ARROW )
					{
						this->character->setSide( Side::Right );
					}
					else
					{
						return true;
					}

					if( isGameOver() )
					{
						triggerGameOver();
						return true;
					}

					this->stepTower();
					this->character->runChopAnimation();

					if( isGameOver() )
					{
						triggerGameOver();
						return true;
					}

					setScore( this->score + 1 );
					setTimeLeft( this->timeLeft + cBonusTimeLeft );
				}
				break;

			case GameState::GameOver:
				if( !this->isAnimatingGameOver )
				{
					this->resetGameState();
					this->triggerReady();
				}
				break;
		}

		return true;
	};

	this->getEventDispatcher()->addEventListenerWithSceneGraphPriority( keyboardListener, this );
}

void MainScene::onEnter()
{
	Layer::onEnter();

	this->setupTouchHandling();
	this->setupKeyboardHandling();
	this->triggerTitle();
	this->scheduleUpdate();

	this->flyingPiecePosition = this->pieceNode->getPosition();
}

void MainScene::update( float dt )
{
	Layer::update( dt );

	// 1. Check if the game is in the Playing state.
	if( this->gameState == GameState::Playing )
	{
		// 2. If it is, decrement the timeLeft by dt.
		setTimeLeft( this->timeLeft - dt );

		// 3. Then check if timeLeft <= 0.0f.
		if( timeLeft <= 0.0f )
		{
			// 4. If it is, end the game by calling triggerGameOver().
			triggerGameOver();
		}
	}
}

Side MainScene::getSideForObstacle( Side lastSide )
{
	// 1. A piece has no obstacle if the previous piece had one
	// 2. Right should appear 45% of the time an obstacle can be added
	// 3. Left should appear 45% of the time an obstacle can be added
	// 4. No obstacle should appear 10% of the time an obstacle can be added

	Side side;

	switch( lastSide )
	{
		case Side::None:
			{
				const float random = CCRANDOM_0_1();

				if( random < 0.45f )
				{
					side = Side::Right;
				}
				else if( random < 0.90f )
				{
					side = Side::Left;
				}
				else
				{
					side = Side::None;
				}
			}
			break;

		case Side::Left:
		case Side::Right:
			side = Side::None;	
			break;
	}
	
	return side;
}

void MainScene::stepTower()
{
	// 1. Grab a pointer to the currentPiece from the pieces array.
	Piece* currentPiece = this->pieces.at( this->pieceIndex );

	animateHitPiece( currentPiece->getObstacleSide() );

	// 2. Move currentPiece to top of tower
	currentPiece->setPosition( currentPiece->getPosition() + Vec2( 0.0f, currentPiece->getSpriteHeight() / 2.0f * cNumberOfSuchi ) );

	// 3. Increase its z-order by one
	currentPiece->setZOrder( currentPiece->getZOrder() + 1 );

	// 4. Randomize its obstacle
	this->lastObstacleSide = getSideForObstacle( this->lastObstacleSide );
	currentPiece->setObstacleSide( this->lastObstacleSide );

	// 5. Move piecesNode down by the height of a piece
	cocos2d::MoveBy* moveAction = cocos2d::MoveBy::create( 0.15f, Vec2( 0.0f, -currentPiece->getSpriteHeight() / 2.0f ) );
	this->pieceNode->runAction( moveAction );

	// 6. Increment pieceIndex
	this->pieceIndex = ( this->pieceIndex + 1 ) % cNumberOfSuchi;
}

bool MainScene::isGameOver()
{
	bool gameOver = false;

	const Piece* currentPiece = this->pieces.at( this->pieceIndex );
	if( currentPiece->getObstacleSide() == this->character->getSide() )
	{
		gameOver = true;
	}

	return gameOver;
}

void MainScene::triggerTitle()
{
	this->gameState = GameState::Title;

	cocostudio::timeline::ActionTimeline* titleTimeline = CSLoader::createTimeline( "MainScene.csb" );
	this->stopAllActions();
	this->runAction( titleTimeline );
	titleTimeline->play( "title", false );
}

void MainScene::triggerReady()
{
	this->gameState = GameState::Ready;

	cocostudio::timeline::ActionTimeline* titleTimeline = CSLoader::createTimeline( "MainScene.csb" );
	this->stopAllActions();
	this->runAction( titleTimeline );
	titleTimeline->play( "ready", true );
}

void MainScene::triggerGameOver()
{
	this->gameState = GameState::GameOver;

	// get a reference to the top-most node
	auto scene = this->getChildByName( "Scene" );

	// get a reference to the mat sprite
	auto mat = scene->getChildByName( "mat" );

	// get areference to the game over score label
	cocos2d::ui::Text* gameOverScoreLabel = mat->getChildByName<cocos2d::ui::Text*>( "gameOverScoreLabel" );

	// set the score label to the user's score
	gameOverScoreLabel->setString( std::to_string( this->score ) );

	// load and run the game over animation	
	cocostudio::timeline::ActionTimeline* gameOverTimeline = CSLoader::createTimeline( "MainScene.csb" );
	this->stopAllActions();
	this->runAction( gameOverTimeline );
	gameOverTimeline->play( "gameOver", false );

	this->isAnimatingGameOver = true;
	gameOverTimeline->setLastFrameCallFunc( [ this ]() {
		this->isAnimatingGameOver = false;
	} );

}

void MainScene::triggerPlaying()
{
	this->gameState = GameState::Playing;

	// get a reference to the top-most node
	auto scene = this->getChildByName( "Scene" );

	// get references to the left and right tap sprite
	cocos2d::Sprite* tapLeft = scene->getChildByName<cocos2d::Sprite*>( "tapLeft" );
	cocos2d::Sprite* tapRight = scene->getChildByName<cocos2d::Sprite*>( "tapRight" );

	// create two fade actions
	cocos2d::FadeOut* leftFade = cocos2d::FadeOut::create( 0.35f );
	cocos2d::FadeOut* rightFade = cocos2d::FadeOut::create( 0.35f );

	// run the fade actions
	tapLeft->runAction( leftFade );
	tapRight->runAction( rightFade );

	this->scoreLabel->setVisible( true );
}

void MainScene::resetGameState()
{
	// Make sure that the lowest piece doesn't have an obstacle on it.
	Piece* currentPiece = this->pieces.at( this->pieceIndex );
	currentPiece->setObstacleSide( Side::None );

	setScore( 0 );
	setTimeLeft( cTimeLeftCap / 2.0f );
}

void MainScene::setScore( int score )
{
	// update this score instance variable
	this->score = score;

	// update the score label
	this->scoreLabel->setString( std::to_string( this->score ) );
}

void MainScene::setTimeLeft( float timeLeft )
{
	this->timeLeft = clampf( timeLeft, 0, cTimeLeftCap );

	this->timeBar->setScaleX( timeLeft / cTimeLeftCap );
}

void MainScene::animateHitPiece( Side obstacleSide )
{
	// 1. Create a new piece called flyingPiece
	Piece* flyingPiece = dynamic_cast< Piece* >( CSLoader::createNode( "Piece.csb" ) );

	// 2. Set the obstacle on the correct side
	flyingPiece->setObstacleSide( obstacleSide );

	// 3. Set the position of the flyingPiece so that it looks like it's flying from the correct place
	flyingPiece->setPosition( this->flyingPiecePosition );

	// 4. Add flyingPiece to the scene
	this->addChild( flyingPiece );

	// 5. Create a new ActionTimeLine from "Piece.csb" called pieceTimeline
	cocostudio::timeline::ActionTimeline* pieceTimeline = CSLoader::createTimeline( "Piece.csb" );
	
	// 6. Figure out, based on the Side the character is on, whether or not the piece should fly to the right or left
	Side characterSide = character->getSide();
	std::string animationName = ( characterSide == Side::Left ) ? std::string( "moveRight" ) : std::string( "moveLeft" );

	// 7. Have flyingPiece run pieceTimeLine
	flyingPiece->runAction( pieceTimeline );

	// 8. Tell the pieceTimeline to play the correct animation
	pieceTimeline->play( animationName, false );

	// 9. on the last frame of the animation, remove the piece from the scene
	pieceTimeline->setLastFrameCallFunc( [ this, &flyingPiece ]() {
		this->removeChild( flyingPiece );
	} );
}
