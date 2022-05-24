PImage bkImg;
PImage titleImg;
PImage soilImg;
PImage soldierImg;
PImage hogImg;
PImage hogDImg;
PImage hogRImg;
PImage hogLImg;
PImage heartImg;
PImage cabImg;
PImage gameOverImg;
PImage startBtn;
PImage startBtnH;
PImage resetBtn;
PImage resetBtnH;

boolean cabStat;
int lifeCount,timer,gameStat,hogStat;
float soldierX,soldierY,hogX,hogY,cabX,cabY;

final int HOG_IDLE=0,HOG_DOWN=1,HOG_LEFT=2,HOG_RIGHT=3;
final int GAME_START=0,GAME_RUN=1,GAME_OVER=2;
final int BTN_WIDTH=144,BTN_HEIGHT=60;
final int BLOCK=80;

void setup() {
  size(640, 480, P2D);

  bkImg = loadImage("img/bg.jpg");
  titleImg = loadImage("img/title.jpg");
  gameOverImg = loadImage("img/gameover.jpg");
  startBtn = loadImage("img/startNormal.png");
  startBtnH = loadImage("img/startHovered.png");
  resetBtn = loadImage("img/restartNormal.png");
  resetBtnH = loadImage("img/restartHovered.png");
  soilImg = loadImage("img/soil.png");
  heartImg = loadImage("img/life.png");
  hogImg = loadImage("img/groundhogIdle.png");
  hogDImg = loadImage("img/groundhogDown.png");
  hogLImg = loadImage("img/groundhogLeft.png");
  hogRImg = loadImage("img/groundhogRight.png");
  soldierImg = loadImage("img/soldier.png");
  cabImg = loadImage("img/cabbage.png");
  
  gameStat=GAME_START;
  
}

void draw() {
  
  switch(gameStat){
    case GAME_START:
      image(titleImg,0,0);
      
      if(mouseX>248&&mouseX<248+BTN_WIDTH&&mouseY>360&&mouseY<360+BTN_HEIGHT){
        image(startBtnH,248,360);
      }else{
        image(startBtn,248,360);
      }
      
      break;
    case GAME_RUN:

        image(bkImg,0,0);        
        image(soilImg,0,160);
        noStroke();
        fill(124,204,25);
        rect(0,160,640,-15);
        
        
        for(int i=0;i<lifeCount;i++)
        {
          image(heartImg,10+i*70,10);
        }
        

        stroke(255,255,0);
        strokeWeight(5);
        fill(253,184,19);
        ellipse(590,50,120,120);
        
        
        if(timer==15){
          hogStat=HOG_IDLE;
          if(hogY%BLOCK<30){
            hogY=hogY-hogY%BLOCK;
          }else{
            hogY=hogY-hogY%BLOCK+BLOCK;
          }
          if(hogX%BLOCK<30){
            hogX=hogX-hogX%BLOCK;
          }else{
            hogX=hogX-hogX%BLOCK+BLOCK;
          }
          println(hogX);
          println(hogY);
          timer=0;
        }
        
        
        switch(hogStat){
          case HOG_IDLE:
            image(hogImg,hogX,hogY);
            break;
          case HOG_DOWN:
            image(hogDImg,hogX,hogY);
            timer+=1;
            hogY+=80.0/15;
            break;
          case HOG_RIGHT:
            image(hogRImg,hogX,hogY);
            timer+=1;
            hogX+=80.0/15;
            break;
          case HOG_LEFT:
            image(hogLImg,hogX,hogY);
            timer+=1;
            hogX-=80.0/15;
            break;
        }
        
        
        if(timer==15){
          hogStat=HOG_IDLE;
          if(hogY%BLOCK<30){
            hogY=hogY-hogY%BLOCK;
          }else{
            hogY=hogY-hogY%BLOCK+BLOCK;
          }
          if(hogX%BLOCK<30){
            hogX=hogX-hogX%BLOCK;
          }else{
            hogX=hogX-hogX%BLOCK+BLOCK;
          }

          timer=0;
        }
        

        
        image(soldierImg,soldierX-80,soldierY);
        soldierX+=3;
        soldierX%=720;
        
        
        if(cabStat){
          image(cabImg,cabX,cabY);
        
          
          if(hogX<cabX+BLOCK&&hogX+BLOCK>cabX&&hogY<cabY+BLOCK&&hogY+BLOCK>cabY){
            cabStat=false;
            lifeCount++;
          }
        }
        
        
        if(hogX<soldierX-80+BLOCK&&hogX+BLOCK>soldierX-80&&hogY<soldierY+BLOCK&&hogY+BLOCK>soldierY){
          lifeCount--;
          hogStat=HOG_IDLE;
          
         
          hogX=4*BLOCK;
          hogY=BLOCK;
        }
        
        
      
        if(lifeCount==0){
          gameStat=GAME_OVER;
        }
        
        break;
    case GAME_OVER:
      image(gameOverImg,0,0);
      
      if(mouseX>248&&mouseX<248+BTN_WIDTH&&mouseY>360&&mouseY<360+BTN_HEIGHT){
        image(resetBtnH,248,360);
      }else{
        image(resetBtn,248,360);
      }
      break;
  }
}

void keyPressed(){
  if(key ==CODED){
    switch(keyCode){
      case DOWN:
        if(hogY+BLOCK<height&&hogStat==HOG_IDLE){
          hogStat=HOG_DOWN;
          timer=0;
        }
        break;
      case RIGHT:
        if(hogX+BLOCK<width&&hogStat==HOG_IDLE){
          hogStat=HOG_RIGHT;
          timer=0;
        }
        break;
      case LEFT:
        if(hogX>0&&hogStat==HOG_IDLE){
          hogStat=HOG_LEFT;
          timer=0;
        }
        break;
    }
  }
      
}

void keyReleased(){
}

void mouseClicked(){
  if(mouseX>248&&mouseX<248+BTN_WIDTH&&mouseY>360&&mouseY<360+BTN_HEIGHT&&(gameStat==GAME_START||gameStat==GAME_OVER)){
    
    soldierX=0;
    soldierY=BLOCK*(int(random(4)+2));
    
    
    cabX=BLOCK*int(random(8));
    cabY=BLOCK*(int(random(4))+2);
    
    
    cabStat=true;
    
    
    lifeCount=2;
    
    
    hogX=4*BLOCK;
    hogY=BLOCK;
    
    
    hogStat=HOG_IDLE;
    
    
    gameStat=GAME_RUN;
  }
}
