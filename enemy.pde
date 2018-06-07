class Enemy
{
  //Attributes
  float hardness = 1;
  float eHeight = random(-10,-100);
  float eWidth = random(30,width-40);
  float eMass = random(0.5,hardness);
  //Methods
  public void drawEnemy()
  {
    fill(253, 86, 100);
    rect(eWidth,eHeight,10+eMass,10+eMass);
    
  }
  public void makeitFall()
  {
    eHeight += eMass;
    if (eHeight > height)
    {
      eHeight = random(-10,-100);
      eWidth = random(30,width-40);
      eMass = random(0.5,hardness);
      hardness++;
    }
  }
  public float positionX()
  {
    return eWidth;
  }
  public float positionY()
  {
    return eHeight;
  }
}
