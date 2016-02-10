void setup() 
{
  size(500, 500);
  zigBlack = createFont("Century Schoolbook L Bold", 40);
  Brick paddle= new Brick(widthScreen/2, heightScreen - 50, 100, 10, color(215, 14, 195));
  gameObjects.add(paddle);
  Ball gameBall= new Ball(widthScreen/2, heightScreen/2, 20, 20, color(255, 0, 0), random(1, 10), random(1, 10));
  gameObjects.add(gameBall);
  setupBlocks();
}
//Made a variable for screen width for help with ball 
int widthScreen= 500;
int heightScreen= 500;
int score=0;
int lives=7;
int option = 0;
boolean run = false;
PFont zigBlack;

//test variable
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
    fill(255, 0, 0);
    textFont(zigBlack);
    textSize(60);
    textAlign(CENTER);
    text("Breakout", width/2, height/2-50);

    textSize(20);
    textAlign(CENTER);
    fill(125, 0, 125);
    text("Use the mouse to move the paddle and hit the bricks", width/2, height/2+50);

    textSize(20);
    textAlign(CENTER);
    fill(0, 255, 0);
    text("Click 1 for Easy ", width/2, height/2+100);

    textSize(20);
    textAlign(CENTER);
    fill(255, 125, 0);
    text("Click 2 for Normal ", width/2, height/2+150);

    textSize(20);
    textAlign(CENTER);
    fill(255, 0, 100);
    text("Click 3 for Hard ", width/2, height/2+200);
  } else
  {
    if (run = true);
    {
      textSize(20);
      textAlign(LEFT);
      fill(255, 0, 0);
      text("Lives", 0+10, height-20);
      text(lives, 0+60, height-20);
      if (lives>0) 
      {
        for (int i = gameObjects.size () - 1; i >= 0; i --)
        {
          GameObject go = gameObjects.get(i);

          if (go instanceof Ball)
          {
            if (go.wallCollision()) 
            {
              lives--;
              go.move(width/2, height/2);
            }
          }//end if
          if (go instanceof Block)
          {
            go.render();
            go.draw(mouseX, heightScreen - 50, 0, 0, 0);
          }//end if
          if (go instanceof Brick)
          {
            go.render();
          }//end if
        }//end first for

          for (int i = gameObjects.size () - 1; i >= 0; i --)
        {
          GameObject ball = gameObjects.get(i);
          if (ball instanceof Ball)
          {
            for (int j = gameObjects.size ()-1; j>=0; j--)
            {
              GameObject brick = gameObjects.get(j);

              if (brick instanceof Brick)
              {
                ball.update(mouseX, heightScreen - 50, ball.x, ball.y, ball.speedY);
                ball.render();
                ball.draw(mouseX, heightScreen - 50, ball.x, ball.y, ball.speedY);
                brick.draw(mouseX, heightScreen - 50, ball.x, ball.y, ball.speedY);
              }//brick if
            }//end for j
          }//end go
        }//end second for
      }//end if lives
      for (int i = gameObjects.size ()-1; i>=0; i--)
      {
        if ( gameObjects.size() < 3)
        {
          drawWin();
          for (int j = gameObjects.size () - 1; j >= 0; j --)
          {
            GameObject ball= gameObjects.get(j);
            if(ball instanceof Ball)
            {
              gameObjects.remove(ball);
            }
          }
        }
      }
        if (lives == 0) 
        {
          drawLose();
        }
      }//end if run
    }//end big else
  }//end draw 


  void drawLose() 
  {
    fill(0);
    textSize(40);
    text("You lose!", width/2-100, height/2);
  }

  void drawWin() 
  {
    background(255);
    fill(0);
    textSize(40);
    text("You Win!", width/2-100, height/2);
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
        //go.speedY = 7;
        run = true;
      }//end if

      if (key == '2' && option==0)
      {
        option = 2;
        //go.speedY = 5;
        run = true;
      }//end if

      if (key == '3' && option==0)
      {
        option = 3;
        //go.speedY = 3;
        run = true;
      }//end if

      if (key == 'm')
      {
        option = 0;
        restart();
      }//end if
    }
  }

  void restart()
  {
    int score=0;
    int lives=7;
    boolean run = false;
    setupBlocks();
  }

