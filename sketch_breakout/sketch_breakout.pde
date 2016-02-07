void setup() 
{
  size(500, 500);

  Brick paddle= new Brick(widthScreen/2, heightScreen - 50, 100, 10, color(215, 14, 195));
  gameObjects.add(paddle);
  setupBlocks();
}

//Made a variable for screen width for help with ball 
int widthScreen= 500;
int heightScreen= 500;
int score=0;
int lives=3;

int numberBlocks= 3;
int numberOfBlockRows= 6;
int blockWidth= (widthScreen-20)/numberBlocks;
int blockHeight= 20;
int blockX, blockY;
color blockColours[]= {color(255, 0, 0), color(255, 125, 0), color(255, 255, 0), 
  color(0, 255, 0), color(0, 0, 255), color(125, 0, 125), color(255, 0, 0), 
  color(255, 125, 0), color(255, 255, 0), color(0, 255, 0), color(0, 0, 255)};
color blockColour= color(255, 255, 0);
//ArrayList<Block> BlockLayers= new ArrayList<Block>();

Ball gameBall= new Ball(widthScreen/2, heightScreen/2, 20, color(255, 0, 0));
ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();

void draw() 
{
  background(255);

  if (lives>0) 
  {
    drawBall(); 
    for (int i = gameObjects.size() - 1; i >= 0; i --)
    {
      GameObject go = gameObjects.get(i);
      go.render();
      go.update(mouseX, heightScreen - 50, gameBall);
    }
  } else 
  {
    drawLose();
  }
}

//draw the ball
void drawBall() 
{ 
  gameBall.update();
  gameBall.render();
  if (gameBall.wallCollision()) 
  {
    lives--;
    gameBall.move(width/2, height/2);
  }
}

void drawLose() 
{
  fill(0);
  textSize(40);
  text("You lose!", width/2-100, height/2);
}

void setupBlocks() 
{
  for (int i=0; i<numberBlocks; i++) 
  {
    for (int j=0; j<numberOfBlockRows; j++) 
    {
      blockX = i*(blockWidth+10);
      blockY = 20+j*(blockHeight+10);
      gameObjects.add(new Block(blockX, blockY, blockWidth, blockHeight, blockColours[j]));
    }
  }
}