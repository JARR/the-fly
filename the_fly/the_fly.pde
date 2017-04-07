
    boolean end=false;
    boolean intro=true;
    int score=0;
    fly f = new fly();
    muro[] m = new muro[3];
    color g;
   
    void setup(){
          
      size(420,800);
 
      g = color(random(255), random(255), random(255));
      for(int i = 0;i<3;i++){
      m[i]=new muro(i);
      }
    }
    void draw(){

      background(g);
      if(end){
      f.move();
      }
      f.drawFly();
      if(end){
      f.drag();
      }
      f.checkCollisions();
      for(int i = 0;i<3;i++){
      m[i].drawMuro();
      m[i].checkPosition();
      }
      fill(0);
      stroke(255);
      strokeWeight(2);
      textSize(32);
      if(end){
      rect(20,20,100,50);
      fill(255);
      text(score,30,58);
      }else{
      rect(150,100,200,50);
      rect(150,200,200,50);
      fill(255);
      if(intro){
        text("The Fly",155,140);
        text("Clic para iniciar",155,240);
      }else{
      text("fin del juego",170,140);
      text("score",180,240);
      text(score,280,240);
      }
      }
    }
    class fly{
      float xPos,yPos,ySpeed;
    fly(){
    xPos = 250;
    yPos = 400;
    }
    void drawFly(){
      stroke(255);
      noFill();
      strokeWeight(2);
      ellipse(xPos,yPos,20,20);
      ellipse(xPos,yPos,13,45);
  
    }
    void salto(){
     ySpeed=-10; 
    }
    void drag(){
     ySpeed+=0.4; 
    }
    void move(){
     yPos+=ySpeed; 
     for(int i = 0;i<3;i++){
      m[i].xPos-=3;
     }
    }
    void checkCollisions(){
     if(yPos>800){
      end=false;
     }
    for(int i = 0;i<3;i++){
    if((xPos<m[i].xPos+10&&xPos>m[i].xPos-10)&&(yPos<m[i].opening-100||yPos>m[i].opening+100)){
     end=false; 
    }
    }
    } 
    }
    class muro{
      float xPos, opening;
      boolean cashed = false;
     muro (int i){
      xPos = 100+(i*200);
      opening = random(600)+100;
     }
     void drawMuro(){
       strokeWeight(20);
       line(xPos,0,xPos,opening-100);  
       line(xPos,opening+100,xPos,800);
     }
     void checkPosition(){
      if(xPos<0){
       xPos+=(200*3);
       opening = random(600)+100;
       cashed=false;
      } 
      if(xPos<250&&cashed==false){
       cashed=true;
       score++; 
      }
     }

    }
    void reinicio(){
     end=true;
     score=0;
     f.yPos=400;
     for(int i = 0;i<3;i++){
      m[i].xPos+=550;
      m[i].cashed = false;
     }
    }
    void mousePressed(){
      g = color(random(255), random(255), random(255));
     f.salto();
     intro=false;
     if(end==false){
       reinicio();
     }
    }
    void keyPressed(){
      g = color(random(255), random(255), random(255));
     f.salto(); 
     intro=false;
     if(end==false){
       reinicio();
     }
    }