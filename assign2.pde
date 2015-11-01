/* please implement your assign1 code in this file. */
final int game_start1=1,game_start2=2,game_run=3,game_end1=4,game_end2=5;
final int HP=36;
PImage ship,hp,treasure,enemy,bg1,bg2,end1,end2,start1,start2;
int x,y,z,w,h,a,speed,k,l,b,c,d,speed2;
int gamestate;
boolean upPressed=false,rightPressed=false,leftPressed=false,downPressed=false;

void setup () {
  size(640,480) ;  // must use this size.
  gamestate=game_start1;
  ship=loadImage("img/fighter.png");
  hp=loadImage("img/hp.png");
  treasure=loadImage("img/treasure.png");
  enemy=loadImage("img/enemy.png");
  bg1=loadImage("img/bg1.png");
  bg2=loadImage("img/bg2.png");
  end1=loadImage("img/end1.png");
  end2=loadImage("img/end2.png");
  start1=loadImage("img/start1.png");
  start2=loadImage("img/start2.png");
  x=floor(random(0,599));
  y=floor(random(0,439));
  a=HP;
  w=0;
  b=100;
  k=width*5/6;
  l=height*1/2;
  h=0;
  speed=2;
  speed2=2;
}

void draw() {
  

  switch (gamestate){
    case game_start1:
    if(mouseX<455&&mouseX>205&&mouseY<416&&mouseY>375){
     gamestate=game_start2;
    }
    else{
     gamestate=game_start1; 
    }
    image(start1,0,0);
    
    break;
    case game_start2:
    if(mouseX<455&&mouseX>205&&mouseY<416&&mouseY>375){
     gamestate=game_start2;
    }
    else{
     gamestate=game_start1; 
    }
    if(mouseX<455&&mouseX>205&&mouseY<416&&mouseY>375){
    if(mousePressed){
    gamestate=game_run;
  
    }
    }
    image(start2,0,0);
    break;
    case game_run:
      a=36;
    if(upPressed){
      l-=speed;
    }
    if(downPressed){
    l+=speed;
    }
    if(rightPressed){
    k+=speed;
    }
    if(leftPressed){
    k-=speed;
    }
    if(k<0){
   k=0;
   }
    if(l<0){
      l=0;
    }
    if(l>429){
    l=429;
    }
    if(k>589){
   k=589;
   }

    if(k+51>=z&&k<=z+61&&l<=b+61&&l+51>=b){
      a-=40; 
      z=0;
      b=floor(random(0,419));
      if(a<=0){
        a=0;
    gamestate=game_end1;
    }      
    }
   
 if(k+51>=x&&k<=x+41&&l<=y+41&&l+51>=y){
a+=20;
x=floor(random(0,599));
  y=floor(random(0,439));
 }
 
 
 if(b>l){b--;}
    if(b<l){b++;}

  
  
 if(a>=196){
 a=196;
 }
 
    z=z+2;
   if(z>=641){
   z=0;
    b=floor(random(0,419));
 }
    
    h++;
    if(h>=641){
      h -= 1282;
    }
    if(h>=641 || h<0)
      w++;
    else{
      w = h-641;
    }
     background(0);
    image(bg1,w,0);
    image(bg2,h,0);
    image(ship,k,l);
    image(treasure,x,y);
    image(enemy,z,b);
    rect(10,0,a,30);
    fill(255,0,0);

    image(hp,0,0);
      break;
      case game_end1:
       if(mouseX<433&&mouseX>207&&mouseY<345&&mouseY>311){
     gamestate=game_end2;
    }
    else{
     gamestate=game_end1; 
      
    }
     image(end1,0,0);
      break;
      case game_end2:
       if(mouseX<433&&mouseX>207&&mouseY<345&&mouseY>311){
     gamestate=game_end2;
    }
    else{
     gamestate=game_end1; 
    }
     if(mousePressed){
    gamestate=game_run;
    }
     image(end2,0,0);
      break;
    }

     
     
}

void keyPressed(){
 if(key==CODED) {
   switch(keyCode){
    case UP:
    upPressed=true;   
    break;
    case DOWN :
    downPressed=true;  
    break;
   case RIGHT:
   rightPressed=true;
   break;
   case LEFT:
   leftPressed=true;  
   break;
 }
   
 }
}

void keyReleased(){
 if(key==CODED){
 switch(keyCode){
  case UP:
  upPressed=false;
  break;
  case DOWN :
  downPressed=false;
  break;
  case RIGHT:
  rightPressed=false;
  break;
  case LEFT:
  leftPressed=false;
  break;
 }
 
 }
}
