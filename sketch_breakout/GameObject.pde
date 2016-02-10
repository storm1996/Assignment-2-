abstract class GameObject
{
  float x, y, w, h, speedY;

  GameObject()
  {
    this(widthScreen/2, heightScreen-50, 50, 50, 0);
  }

  GameObject(int x_paddle, int y_paddle, int w_paddle, int h_paddle, float speedY)
  {
    this.x = x_paddle;
    this.y = y_paddle;
    this.w = w_paddle;
    this.h = h_paddle;
    this.speedY = speedY;
  }
  
  abstract void render();
  abstract boolean wallCollision();
  abstract void move(int W, int H);
  abstract void draw(int X, int Y, float ballx, float bally, float speedY);
}
