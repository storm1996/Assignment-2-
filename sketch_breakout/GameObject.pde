abstract class GameObject
{
  float x, y, w, h;

  GameObject()
  {
    this(widthScreen/2, heightScreen-50, 50, 50);
  }

  GameObject(int x_paddle, int y_paddle, int w_paddle, int h_paddle)
  {
    this.x = x_paddle;
    this.y = y_paddle;
    this.w = w_paddle;
    this.h = h_paddle;
  }

  abstract void update(int X, int Y, Ball game);  
  abstract void render();
}