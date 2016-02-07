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
int option = 0;
boolean run = false;

int numberBlocks= 3;
int numberOfBlockRows= 6;
int blockWidth= (widthScreen-20)/numberBlocks;
int blockHeight= 20;
int blockX, blockY;
color blockColours[]= {color(255, 0, 0), color(255, 125, 0), color(255, 255, 0), 
  color(0, 255, 0), color(0, 0, 255), color(125, 0, 125), color(255, 0, 0), 
  color(255, 125, 0), color(255, 255, 0), color(0, 255, 0), color(0, 0, 255)};
color blockColour= color(255, 255, 0);
ArrayList<Block> BlockLayers= new ArrayList<Block>();

Ball gameBall= new Ball(widthScreen/2, heightScreen/2, 20, color(255, 0, 0));
ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();

void draw() 
{
  background(255);

  if (option == 0)
  {
    //draw menu
  } 
  
  else
  {
    if (run = true);
    {
      if (lives>0) 
      {
        drawBall(); 
        for (int i = gameObjects.size() - 1; i >= 0; i --)
        {
          GameObject go = gameObjects.get(i);
          // Block bo = BlockLayers.get(i);
          go.render();
          go.update(mouseX, heightScreen - 50, gameBall);
        }
      } else 
      {
        drawLose();
      }
    }
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
      Block b = new Block(blockX, blockY, blockWidth, blockHeight, blockColours[j]);
      gameObjects.add(b);
      BlockLayers.add(b);
    }
  }
  //Block g = new Block(game.ballX, game.ballY, game.diameter, game.diameter, game.ballColour);
  //gameObjects.add(g);
  //BlockLayers.add(g);
}

void keyPressed() // Contains all the controls
{
  if (key == '1' && option==0)
  {
    option = 1;
    gameBall.speedY = 7;
    run = true;
  }//end if
  
  if (key == '2' && option==0)
  {
    option = 2;
    gameBall.speedY = 5;
    run = true;
  }//end if
  
  if (key == '3' && option==0)
  {
    option = 3;
    gameBall.speedY = 3;
    run = true;
  }//end if
  
  if (key == 'm')
  {
    option = 0;
  }//end if
}