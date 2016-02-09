void setup() 
{
  size(500, 500);
  Brick paddle= new Brick(widthScreen/2, heightScreen - 50, 100, 10, color(215, 14, 195));
  gameObjects.add(paddle);
  Ball gameBall= new Ball(widthScreen/2, heightScreen/2, 20, 20, color(255, 0, 0), 0, random(1, 10));
  gameObjects.add(gameBall);
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
color blockColours[]= {
  color(255, 0, 0), color(255, 125, 0), color(255, 255, 0), 
  color(0, 255, 0), color(0, 0, 255), color(125, 0, 125), color(255, 0, 0), 
  color(255, 125, 0), color(255, 255, 0), color(0, 255, 0), color(0, 0, 255)
};
color blockColour= color(255, 255, 0);


ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
void draw() 
{
  background(255);

  if (option == 0)
  {
    fill(0);
    textSize(40);
    text("Menu!", width/2-55, height/2);
  } else
  {
    if (run = true);
    {
      if (lives>0) 
      {
        drawBall(); 
        for (int i = gameObjects.size () - 1; i >= 0; i --)
        {
          GameObject go = gameObjects.get(i);
          if (go instanceof Ball)
          {
            go.render();
            go.update(mouseX, heightScreen - 50, go.x, go.y, go.speedY);
          }//end if
        }//end for
        checkCollisions();
      } //end if 
      else 
      {
        drawLose();
      }//end else
    }//end if
  }//end else
}//end draw

//draw the ball
void drawBall() 
{ 
  for (int i = gameObjects.size () - 1; i >= 0; i --)
  {
    GameObject go = gameObjects.get(i);
    if (go instanceof Ball)
    {
      if (go.wallCollision() == 0) 
      {
        lives--;
        go.move(width/2, height/2);
      }
    }
  }
}
//
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
    }
  }
}

void keyPressed() // Contains all the controls
{
    for (int i = gameObjects.size () - 1; i >= 0; i --)
  {
    GameObject go = gameObjects.get(i);
    if (key == '1' && option==0)
    {
      option = 1;
      go.speedY = 7;
      run = true;
    }//end if
  
    if (key == '2' && option==0)
    {
      option = 2;
     go.speedY = 5;
      run = true;
    }//end if
  
    if (key == '3' && option==0)
    {
      option = 3;
      go.speedY = 3;
      run = true;
    }//end if
  
    if (key == 'm')
    {
     option = 0;
    }//end if
  }
}

void checkCollisions()
{
  for (int i = gameObjects.size ()-1; i>=0; i--)
  {
    GameObject ball = gameObjects.get(i);

    if (ball instanceof Ball)
    {
      for (int j = gameObjects.size ()-1; j>=0; j--)
      {
        GameObject block = gameObjects.get(j);

        if (block instanceof Block)
        {
          if (ball.x > block.x && ball.x<block.x + block.w && ball.y + 40> block.y && ball.y + 40 < block.y + block.h)
          {
            gameObjects.remove(i);
          }
        }//end if
      }//end for
    }//end if
  }//end for
}

