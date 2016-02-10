//C14449168 Assignment 2
void setup() 
{
  size(500, 500);
  zigBlack = createFont("Century Schoolbook L Bold", 40);
  Brick paddle= new Brick(widthScreen/2, heightScreen - 50, 100, 10, color(215, 14, 195)); //reads in values for the variables that make paddle 
  gameObjects.add(paddle);
  Ball gameBall= new Ball(widthScreen/2, heightScreen/2, 20, 20, color(255, 0, 0), random(1, 10), random(1, 10)); //reads in values for the variables that make ball 
  gameObjects.add(gameBall); 
  setupBlocks();// draws up the blocks and reads in variables to the brick class 
}
//Made a variable for screen width for help with ball 
int widthScreen= 500;
int heightScreen= 500;
int score=0;
String score1;
int lives=7;
int option = 0;
boolean run = false;
PFont zigBlack;

//variables for blocks 
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

  if (option == 0) // drawing the main menu 
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
    if (run = true); // when mode selected 
    {
      textSize(20);
      textAlign(LEFT);
      fill(255, 0, 0); //display number of lives 
      text("Lives", 0+10, height-20);
      text(lives, 0+70, height-20);

      textSize(20);
      textAlign(RIGHT);
      fill(255, 0, 0); // display current score 
      text("Score", width-50, height-20);
      text(score, width - 20, height-20);

      if (lives>0) // as long as you're still alive and playing 
      {
        for (int i = gameObjects.size () - 1; i >= 0; i --)
        {
          GameObject go = gameObjects.get(i);

          if (go instanceof Ball) // 
          {
            if (go.wallCollision()) // method used for ball collision with walls, bricks and paddles 
            {
              lives--;
              go.move(width/2, height/2); // go back to start position 
            }
          }//end if
          if (go instanceof Block)
          {
            go.render(); // draw the blocks 
          }//end if
          if (go instanceof Brick)
          {
            go.render(); //draw the paddle 
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
                ball.render(); // draw ball 
                ball.draw(mouseX, heightScreen - 50, ball.x, ball.y, ball.speedY); // ball moving around screen 
              }//brick if
            }//end for j
          }//end go
        }//end second for
      }//end if lives
      for (int i = gameObjects.size ()-1; i>=0; i--)
      {
        if ( gameObjects.size() < 3) // if all blocks have been deleted 
        {
          drawWin(); // you won 
          loadStats(); // highscore loaded 
          int number2 = Integer.parseInt(score1); // string from file changed to int 
          textAlign(CENTER);
          text("Highscore", width/2, (height/10)*2);
          text(score1, width/2, (height/10)*2+40); // display highscore 
          if (score > number2) // if you beat highscore 
          {
            number2 = score;
            String b = str(number2); //overwrite the old score  
            String[] list = split(b, " ");
            saveStrings("record.txt", list);
          }
          for (int j = gameObjects.size () - 1; j >= 0; j --)
          {
            GameObject ball= gameObjects.get(j);
            if (ball instanceof Ball)
            {
              gameObjects.remove(ball); // stop the ball if you won so you don't just keep losing lives 
            }
          }
        }
      }
      if (lives == 0) //if you lost 
      {
        drawLose(); //same as winning
          loadStats();
          int number2 = Integer.parseInt(score1);
          text("Highscore", width/2, (height/10)*2);
          text(score1, width/2, (height/10)*2+40);
          if (score > number2)
          {
            number2 = score;
            String b = str(number2);
            String[] list = split(b, " ");
            saveStrings("record.txt", list);
          }
      }
    }//end if run
  }//end big else
}//end draw 


void drawLose() 
{
  textAlign(CENTER);
  fill(0);
  textSize(40);
  text("You lose!", width/2, height/2);
}

void drawWin() 
{
  textAlign(CENTER);
  background(255);
  fill(0);
  textSize(40);
  text("You Win!", width/2, height/2);
}


void setupBlocks() //reading in the parameters for the blocks 
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

void keyPressed() // Contains all the controls for menu 
{
  for (int i = gameObjects.size () - 1; i >= 0; i --)
  {
    GameObject go = gameObjects.get(i);
    if (key == '1' && option==0)
    {
      option = 1;
      run = true;
    }//end if

    if (key == '2' && option==0)
    {
      option = 2;
      run = true;
    }//end if

    if (key == '3' && option==0)
    {
      option = 3;
      run = true;
    }//end if
  }//end
}
  void loadStats() // 
{
  String[] lines = loadStrings("record.txt");
  for (String line : lines) //convert .txt file to string 
  {
     score1=(line); 
  }

}

