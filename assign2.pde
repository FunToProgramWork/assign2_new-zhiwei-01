PImage title; 
PImage bgImg; 
PImage soilImg; 
PImage lifeImg; 
PImage soldierImg; 
int s = 0; 

PImage groundhogDownImg; 
PImage groundhogIdleImg; 
PImage groundhogLeftImg; 
PImage groundhogRightImg; 
int g = 0;

PImage cabbageImg; 
PImage gameoverImg; 

PImage startHoveredImg;

int xPos=200, yPos=120;

void setup(){
  size(640, 480, P2D); 
      
    bgImg = loadImage("img/bg.jpg"); 
    soilImg = loadImage("img/soil.png"); 
    lifeImg = loadImage("img/life.png"); 
    soldierImg = loadImage("img/soldier.png"); 
        
    groundhogDownImg = loadImage("img/groundhogDown.png");
    groundhogIdleImg = loadImage("img/groundhogIdle.png"); 
    groundhogLeftImg = loadImage("img/groundhogLeft.png");
    groundhogIdleImg = loadImage("img/groundhogIdle.png");
    groundhogRightImg = loadImage("img/groundhogRight.png");
      
    cabbageImg = loadImage("img/cabbage.png");
    
    startHoveredImg= loadImage("img/startHovered.png");  
    
}

void draw(){   
     
  image(bgImg,0,0);  
   
  image(soilImg,0,160);  
  image(lifeImg,10,10);   
  image(lifeImg,80,10);   
  
  image(soldierImg,s,320);   
    s=s+1;  
    if(s>640){  
      s = 0;  
    }  
    
  image(cabbageImg,560,160); 

  strokeWeight(15.0); 
  stroke(124,204,25); 
  line(0,152.5,640,152.5); 
 
  stroke(255,255,0); 
  fill(253, 184, 19); 
  ellipse(590,50, 120, 120); 
  
  image(groundhogIdleImg,xPos-40, yPos-40); 
  delay(100);  
  if (keyPressed) {
    if (keyCode == UP) {
      yPos -= 80;
      image(groundhogDownImg,xPos-40, yPos-40);
    }
    if (keyCode == DOWN) {
      yPos += 80;
      image(groundhogDownImg,xPos-40, yPos-40);
    }
    if (keyCode == LEFT) {
      xPos -= 80;
      image(groundhogLeftImg,xPos-40, yPos-40);
    }
    if (keyCode == RIGHT) {
      xPos += 80;
      image(groundhogRightImg,xPos-40, yPos-40);
    }
  } 
  
  
}
