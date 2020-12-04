ArrayList<FOOD> foodList = new ArrayList<FOOD>();
ArrayList<FOOD> nearByFood = new ArrayList<FOOD>();

float x;
float y;
float speed;
float pr;
String name;
int countCollide = 0;
int numOfFood = 70;
float grow = 1;

float sx;
float sy;
float sd;

void setup(){
  size(1000, 600); 
  x = width/2;
  y = height/2;
  speed = 1.5;
  pr = 20;
  numOfFood -= 1;
  name = "Nathan";
  
}


void draw(){
  background(255);
  if(foodList.isEmpty()){
    for(int i = 0; i<= numOfFood; i++){
    int red = (int) random(20 , 230);
    int green = (int) random(20 , 230);
    int blue = (int) random(20 , 230);
    foodList.add(new FOOD(red, green, blue));    
    }
  }
  //Clear the old nearByFood list
  nearByFood.clear();
  
  //Create a box around the player
  sd = pr * 3;
  sx = x - (sd/2);
  sy = y - (sd/2);
  //stroke(255,0,0);
  //strokeWeight(4);
  //rect(sx, sy, sd, sd);
  //strokeWeight(0.5);
  //stroke(0);
  
  //Draw the food
  for(int i = 0; i < foodList.size(); i++){
    FOOD food = foodList.get(i);
    food.show();
    
    //Check if the food is near by the player 
    if(food.fx >= sx && food.fx <= (sx+sd) && food.fy >= sy && food.fy <= (sy+sd)){
      nearByFood.add(food);
    }
  }
  // Loop through the nearByFood and check for colision
  if(nearByFood.size() > 0){
    for(int j = 0; j < nearByFood.size(); j++){
      FOOD nearBy = nearByFood.get(j);
      //strokeWeight(5);
      //line(x, y, nearBy.fx, nearBy.fy );
      strokeWeight(0.5);
      float dis = sq(nearBy.fx - x) + sq(nearBy.fy - y);
      dis = sqrt(dis);
      dis = dis - (nearBy.rad + pr);
      if(dis <= 0){
       foodList.remove(nearBy); 
       pr += grow;
      }
    }
  }         
  //Draw the player
  strokeWeight(0);
  fill(0, 0, 0);
  ellipseMode(RADIUS);
  ellipse(x, y, pr, pr);
  fill(255);
  textSize(pr/3);
  textAlign(CENTER, CENTER);
  text(name, x, y);
  
  //Player movement
  if(x < mouseX){
   x += speed; 
  }else if(x > mouseX){
   x -= speed; 
  }
  if(y < mouseY){
   y += speed; 
  }else if(y > mouseY){
   y -= speed; 
  }
  
  ////Scoring system
  //String score = "The score is: " + pr;
  //textSize(12);
  //fill(0,0,0);
  //textAlign(RIGHT, TOP);
  //text(score,0,0);  
  
}



class FOOD{
  float fx;
  float fy;
  float rad = (int) random(5, 20);
  float r;
  float g;
  float b;
  
  FOOD(int ir, int ig, int ib){
    fx = (float)random(0, 1001);
    fy = (float)random(0, 601);
    r = ir;
    b = ib;
    g = ig;
  }
  
  void show(){
   ellipseMode(RADIUS);
   fill(r, g, b);
   strokeWeight(0.5);
   ellipse(fx, fy, rad, rad);
  }
}
