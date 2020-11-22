int[] snake = new int[2];
String direction = "right";
int[] food = new int[2];
int x = 20*(int) random(-30,30);
int y = 20*(int) random(-30,30);

// snake[1] er y-aksen og snake[0] er x-aksen

void setup(){
  size(600,600); // size of canves
  frameRate(5); // hvor hurtigt slangen skal bevæge sig
  initGame();
}

void draw(){
  background(180); // baggrund på spillet
  drawGrid(); // laver felter
  drawFood();
  drawSnake(); //tegner slangen
  moveSnake(); // bevæger slangen
  if (gameOver()){ // tjekker om spillet er vre
    frameRate(0); // Får spillet til at stå stille
    fill(0);
    rect(175,260,250,80);
    fill(255);
    textSize(30);
    text("Game Over",225,310); // skriver "game over"
  }
}
 
 void keyPressed(){ // Får spillet til at reagere på de forskellige knapper der skal bruges
   if(key == 'w')
     direction = "up";
   else if(key == 'a')
     direction = "left";
   else if(key == 'd')
     direction = "right";
   else if(key == 's')
     direction = "down";
   else if(key == 't')
     direction = "restart";
    
 }
 
void initGame(){
  snake[0] = width/2; // slangens x koordinat
  snake[1] = height/2; // slangens y koordinat
}

void drawGrid(){ // Får den til at tegne linjer for hvert 10. pixel
 for(int i = 0; i<width;i = i+20) // linjer vandret
   line(i,0,i,height);
 for(int i = 0; i<height;i = i+20) // linjer lodret
   line(0,i,width,i);
}

void moveSnake(){ // skriver hvad den skal gøre når en knap er trykket ned
 if(direction == "up")
   snake[1] = snake[1]-20;
 else if(direction == "left")
   snake[0] = snake[0]-20;
 else if(direction == "right")
   snake[0] = snake[0]+20;
 else if(direction == "down")
   snake[1] = snake[1]+20;
 else if(direction == "restart") // starter spillet forfra
   initGame();
   
}

void drawSnake(){ // tegner slange
  fill(0,255,0); // farver den grøn
  rect(snake[0],snake[1],20,20); // hvor stor et felt skal være
  fill(0,0,0); // ryder op
}

void moveFood(){
  if(snake[0] == food[0] && snake[1] == food[1]){
    food[0] = food[0]+x;
    food[1] = food[1]+y;
    
  }
  else if(food[0]!= snake[0] || food[1]!= snake[1]){
  } 
  else if(food[0]>600 || food[0]<600 || food[1]>600 || food[1]<600){
    food[0] = food[0]-(20*(int) random(-30,0));
    food[1] = food[1]-(20*(int) random(-30,0));
  }
  
  fill(0,0,0); // ryder op
}

void drawFood(){
  fill(255,0,0); // farver den grøn
  rect(food[0],food[1],20,20); // hvor stor et felt skal være
  fill(0,0,0); // ryder op
}

boolean gameOver(){ // definere hvornår der er game over
  boolean result = false;
  if(snake[0] < 0 || snake[0] > width-20 || snake[1] < 0 || snake[1] > height-20){ 
  
    result = true;
}
  return result;
}
