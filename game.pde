float x, y;
int def = 20;
float speed=1.0;
float posY, posX;
int nEnemies = 20;
boolean PlayerDead = false,KeyPress = false;
float score;
Enemy[] vEnemies = new Enemy[200];
//////////////////////////////////////
void setup()
{
  size(1020, 680);
  frameRate(60);
  
  GenerateEnemies();
}
//////////////////////////////////////
void keyPressed()
{
  if (KeyPress == false && PlayerDead == true)
  {
    if (key == CODED) {
      if (keyCode == UP) {
        PlayerDead = false;
      }
    }
  }
  else
  {
    KeyPress = false;
  }
  
}
void draw()
{
  
  if (PlayerDead)
  {
    background(255);
    fill(0);
    text("u ded. press space for dying again ",width/2,height/2);
    textSize(22);
    score = 0;
    keyPressed();
    KeyPress = false;
    GenerateEnemies();
  }
  else
  {
    background(248, 202, 146);
    ActivateEnemies();
    DrawPlayer();
    DrawMap();
    PrintScore();
    HitDetect();
    if (frameCount % 60 == 0)
    {
      nEnemies -= 2;
      score += 1;
    }
  }
  
  
  
}
//////////////////////////////////////
void PrintScore()
{
  fill(0);
  textSize(24);
  text("Score: " + score,20,40);
}
void HitDetect()
{
  for(int i = 0 ; i < vEnemies.length ; i++)
  {
    float r1x = vEnemies[i].eWidth+5;
    float r1y = vEnemies[i].eHeight+5;
    float r1w = vEnemies[i].eMass + 10;
    float r1h = r1w;
    
    if (r1x + r1w >= x && r1x <= x + 12 &&    // r1 left edge past r2 right
    r1y + r1h >= y && r1y <= y + 12) 
    {    // r1 bottom edge past r2 top
      PlayerDead = true;
      KeyPress = false;
    }
  }
}
void DrawMap()
{
  fill(248, 104, 93);
  rect(0,height-180,width,10);
  fill(248, 104, 93);
  rect(0,height-10,width,10);
  fill(248, 104, 93);
  rect(0,500,20,180);
  fill(248, 104, 93);
  rect(width-20,500,20,180);
  
}
void DrawPlayer()
{
  x = lerp(x, mouseX, 0.5);
  y = lerp(y, mouseY, 0.5);
  if (y < height-160) 
    y = height-160;
  
  if (y > height-20) 
    y = height-20;
  
  if (x < 30)
    x = 30;
  
  if (x > width-30)
    x = width-30;
    
  fill(248, 54, 79);
  ellipse(x, y, 12, 12);
}
void GenerateEnemies()
{
  
  for (int i = 0; i < vEnemies.length; i++)
  {
    vEnemies[i] = new Enemy();
  }
}
void ActivateEnemies()
{
  noStroke();
  for (int j = 0; j < vEnemies.length; j++)
  {
    vEnemies[j].makeitFall();
    vEnemies[j].drawEnemy();
    
  }
}
