void setup()
{
  size(500,500);
  strokeWeight(4);
}


void draw()
{
  // person 
  
  ellipseMode(CENTER);
  ellipse(width/2, height/3, 50,50); //head 
  line((width/2), (height/3)+25, (width/2), (height/3)+100); //back
  line((width/2), (height/3)+30,(width/2+15), (height/3)+30); // right shoulder 
  line((width/2), (height/3)+30,(width/2-15), (height/3)+30); // left shoulder 
  line((width/2-15), (height/3)+30, (width/2-25), (height/3)+80); // left arm 
  line((width/2+15), (height/3)+30, (width/2+25), (height/3)+80); // right arm
  line((width/2-10), (height/3)+100, (width/2+10), (height/3)+100); // thigh gap
  line((width/2-10), (height/3)+100, (width/2-20), (height/3)+130); // left thigh
  line((width/2+10), (height/3)+100, (width/2+20), (height/3)+130); // right thigh

  // guns 
  line((width/2-20), (height/3)+76, (width/2-40), (height/3)+66);
}
