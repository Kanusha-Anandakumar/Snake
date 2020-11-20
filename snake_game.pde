int[] snake = new int[2];
String direction = "right";


void setup(){
  size(300,300);
  frameRate(8);
  initGame();
}

void draw(){
  background(180);
  drawGrid();
  drawSnake();
  moveSnake();
  if (gameOver()){
    frameRate(0);
    text("Game Over",width/2,height/2);
  }
}
 
 void keyPressed(){
   if(key == 'w')
     direction = "up";
   else if(key == 'a')
     direction = "left";
   else if(key == 'd')
     direction = "right";
   else if(key == 's')
     direction = "down";
    
 }
 
void initGame(){
  snake[0] = width/2;
  snake[1] = height/2;
}

void drawGrid(){
 for(int i = 0; i<width;i = i+10)
   line(i,0,i,height);
 for(int i = 0; i<height;i = i+10)
   line(0,i,width,i);
}

void moveSnake(){
 if(direction == "up")
   snake[1] = snake[1]-10;
 else if(direction == "left")
   snake[0] = snake[0]-10;
 else if(direction == "right")
   snake[0] = snake[0]+10;
 else if(direction == "down")
   snake[1] = snake[1]+10;
   
}

void drawSnake(){
  fill(0,255,0);
  rect(snake[0],snake[1],10,10);
  fill(0,0,0);
}

boolean gameOver(){
  boolean result = false;
  if(snake[0] < 0 || snake[0] > width-10 || snake[1] < 0 || snake[1] > height-10){
  
    result = true;
}
  return result;
}
