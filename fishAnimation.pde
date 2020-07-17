ArrayList<Bubble> bubbleList;
int bubbleNumber = 50;

Seaweed[] seaweeds;
int numWeeds = 75;

float hue = random(361);
Fish newFish;
Fish newFish2;
Fish newFish3;
Fish newFish4;
Fish newFish5;
Fish newFish6;
Fish newFish7;
Fish newFish8;
Fish newFish9;
Fish newFish10;

void setup(){
  size(750,500);
  bubbleList = new ArrayList<Bubble>();
  for(int i =0;i<bubbleNumber;i++){
    Bubble newBubble = new Bubble();
    bubbleList.add(newBubble);
  }
  //creates a list of numWeeds Seaweed objects
  seaweeds = new Seaweed[numWeeds];
  for (int i = 0; i < numWeeds; i++) {
    seaweeds[i] = new Seaweed();
  }
  
  // create two instances of fish
  newFish = new Fish(hue);
  newFish2 = new Fish(hue);
  newFish3 = new Fish(hue);
  newFish4 = new Fish(hue);
  newFish5 = new Fish(hue);
  newFish6 = new Fish(hue);
  newFish7 = new Fish(hue);
  newFish8 = new Fish(hue);
  newFish9 = new Fish(hue);
  newFish10 = new Fish(hue);
  
}

void draw(){
  background(155,211,219);
  for(Bubble bigB : bubbleList){
    bigB.display();
  }
  //iterates through all the seaweed objects and updates their position
  for (int i = 0; i < numWeeds; i++) {
    seaweeds[i].update();
  }
  
  // updates fish and new color after leaving screen
  newFish.update();
  if (newFish.x >= 780) {
    hue = random(361);
    newFish = new Fish(hue);
  }
  if (frameCount > 100) {
    newFish2.update();
    if (newFish2.x >= 780) {
      hue = random(361);
      newFish2 = new Fish(hue);
    }
  }
  if (frameCount > 250) {
    newFish3.update();
    if (newFish3.x >= 780) {
      hue = random(361);
      newFish3 = new Fish(hue);
    }
  }
  if (frameCount > 500) {
    newFish4.update();
    if (newFish4.x >= 780) {
      hue = random(361);
      newFish4 = new Fish(hue);
    }
  }
  if (frameCount > 550) {
    newFish5.update();
    if (newFish5.x >= 780) {
      hue = random(361);
      newFish5 = new Fish(hue);
    }
  }
  if (frameCount > 600) {
    newFish6.update();
    if (newFish6.x >= 780) {
      hue = random(361);
      newFish6 = new Fish(hue);
    }
  }
  if (frameCount > 625) {
    newFish7.update();
    if (newFish7.x >= 780) {
      hue = random(361);
      newFish7 = new Fish(hue);
    }
  }
  if (frameCount > 625) {
    newFish8.update();
    if (newFish8.x >= 780) {
      hue = random(361);
      newFish8 = new Fish(hue);
    }
  }
  if (frameCount > 695) {
    newFish9.update();
    if (newFish9.x >= 780) {
      hue = random(361);
      newFish9 = new Fish(hue);
    }
  }
  if (frameCount > 700) {
    newFish10.update();
    if (newFish10.x >= 780) {
      hue = random(361);
      newFish10 = new Fish(hue);
    }
  }
  
}

class Bubble {
  
  float x;
  float y;
  float r; 
  PVector speed;
  PShape aShape;
  float t;
  float degree;
  float xTarget;
  float count = random(0,10);
  
  
  Bubble(){
    
    this.speed = new PVector(0, (random(0.5,1)));
    this.t = 0.001;
    this.x = random(0,785);
    this.y = random(0,510);
    this.r = random(10, 26);
    this.aShape = createShape(ELLIPSE,0,0,this.r,this.r);
    this.degree = random(0, 2*PI);
    this.xTarget = random(-20,20) + this.x;
      }
    
  
  void display() { 
      this.aShape.setFill(color(255,255,255,70));
      this.aShape.setStroke(color(255,255,255,130));
      pushMatrix();
      this.move();
      shape(this.aShape, 0, 0);
      this.moveSmallBubble();
      shape(this.aShape,0,0);
      popMatrix();
      //println(this.b.degree);
      this.checker();
      
  }
   
  void move() {
    this.y -= this.speed.y;
    this.t += 0.01;
    if (count <=15){
      count += 1;
      float t2 = (1 - cos(PI*this.t))/2; 
      this.x =  (1 - t2)*this.x + (t2)*this.xTarget;
    }else{
      count = random(0,10);
      this.t = 0.001;
      this.xTarget = random(-20,20) + this.x;
    }
    translate(this.x,this.y);
   }
    
  void moveSmallBubble(){
    this.degree += 0.01;
    rotate(this.degree);
    translate(this.r,0);
    scale(0.50);
  }
  
  
void checker(){
   if (this.y <= -10){
    this.speed = new PVector(0, random(0.5,1));
    this.t = random(0.0004,0.0009);
    this.x = random(0,1685);
    this.y = random(0,1010);
    this.r = random(10, 30);
   }   
 }
 
}

class Fish {
  PShape fish;
  PShape tail;
  float hue;
  color c;
  
  // transform variables
  float arc = 0;
  float angle = 0.0;
  float tailYmove;
  float offset = random(-50, 500);
  float scalar = random(10,30);
  float scalar2 = random(15,20);
  float speed = random(0.10);
  float xspeed = random(2,5);
  
  // location variables
  float x, y;
  
  Fish(float hue) {

    // starting point for fish
    x = -150;
    y = 0;
    
    fish = createShape(GROUP);
    
    colorMode(HSB, 360, 100, 100); // set colormode to HSB to keep same hue of color
    c = color(hue, random(101), random(101));
  
    noStroke();
    fill(c);
    tail = createShape(PShape.PATH);
    tail.beginShape();
    tail.vertex(30,50);
    tail.quadraticVertex(30, 20, 0, 20);
    tail.quadraticVertex(0, 50, 30, 50);
    tail.quadraticVertex(30,80,0,80);
    tail.quadraticVertex(0,50,30,50);
    tail.endShape();
  
    PShape fin1 = createShape(PShape.PATH);
    fin1.beginShape();
    fin1.vertex(60,20);
    fin1.quadraticVertex(60,0,50,0);
    fin1.quadraticVertex(90,0,90,16);
    fin1.endShape();
  
    PShape fin2 = createShape(PShape.PATH);
    fin2.beginShape();
    fin2.vertex(60,80);
    fin2.quadraticVertex(60,90, 50,90);
    fin2.quadraticVertex(90, 90, 90, 80);
    fin2.endShape();
    
    c = color(hue, random(101), random(101));
    fill(c);
    PShape body = createShape(PShape.PATH);
    body.beginShape();
    body.vertex(30,50);
    body.quadraticVertex(80,-20,130,50);
    body.quadraticVertex(80,120,30,50);
    body.endShape();
  
    colorMode(RGB, 255, 255, 255); // Reset colormode back to RGB
    fill(255);
    PShape eye = createShape(ELLIPSE,100,45,30,30);
    fill(0);
    PShape eye2 = createShape(ELLIPSE,100,45,20,20);
    fill(255);
    PShape highlight = createShape(ELLIPSE, 95,40,5,5);
    
    // link all parts of fish together
    fish.addChild(fin1);
    fish.addChild(fin2);
    fish.addChild(body);
    fish.addChild(eye);
    fish.addChild(eye2);
    fish.addChild(highlight);
    
  }
  
  void update() {

    x += xspeed; // x movement of fish from left to right
    y = offset + sin(angle) * scalar; // wave form for motion of fish
    arc = cos(angle) * scalar2; // direction of fish pointing
    
    tailYmove = 0.8 + abs(sin(angle)) * 0.4; // harmonic motion for the tail

    // transform fish
    pushMatrix();
    translate(x,y);
    rotate(radians(arc));
    shape(fish, 0, 0); // draw fish
    popMatrix();
    
    // transform tail
    pushMatrix();
    translate(x,y);
    rotate(radians(arc));
    scale(1,tailYmove);
    shape(tail,0,0); // draw tail
    popMatrix();
    
    arc += speed; // increment based on speed
    angle += speed;
    
  }
  
}

class Leaf {
  float theta, sway, leafHeight;
  PShape leaf;
  
  Leaf(float x, float th, color weedColor) {
    theta = th; 
    sway = random(0.5,3);
    
    //create the leaf with beziers and matching color to stem
    noStroke();
    leaf = createShape(PShape.PATH);
    leaf.beginShape();
      leaf.vertex(0, 0);
      leaf.bezierVertex(108, 11, 69, 57, 100, 100);
      leaf.bezierVertex(57, 69, 11, 108, 0, 0);
    leaf.endShape();
    stroke(0);
    leaf.setFill(weedColor);
    
    //putting leaf at the starting position of the stem
    pushMatrix();
    leaf.translate(x, height+10);
    leaf.rotate(PI + theta);
    leafHeight = random(0,150);
    leaf.translate(0, leafHeight);
    leaf.rotate(PI/4);
    leaf.scale(.25);
    popMatrix();
    
  }
  
  void update(float dtheta) {  
    //4 seperate sections of transforms
    pushMatrix();    
    //transform back to original state (after origin rotation)
    leaf.scale(4);
    leaf.rotate(-PI/4);
    leaf.translate(0, -leafHeight);
    
    //rotate on stem
    leaf.rotate(dtheta);

    //transform to positon on stem
    leaf.translate(0, leafHeight);
    leaf.rotate(PI/4);
    leaf.scale(.25);
    
    //rotate while at origin
    leaf.rotate(sway*dtheta);
    shape(leaf, 0, 0);
    popMatrix();

  }
}

//contains the stem and creates numLeaves leaf objects
class Seaweed {
  float amplitude, frequency, t;
  PShape stem;
  int numLeaves = 10;
  Leaf[] leaves = new Leaf[numLeaves];
  
  Seaweed () {
    //setting values to use in update()
    amplitude = random(0.003, 0.005);
    frequency = random(0.01, 0.02);
    t = 0;
    
    //creating the actual stem and a random color
    noStroke();
    stem = createShape(RECT, 0, 0, 5, 150);
    stroke(0);
    float red = 69 + random(-30,20);
    float green = 192 + random(-30,20);
    float blue = 121 + random(-30,20);
    color weedColor = color(red, green, blue);
    stem.setFill(weedColor);
  
    //placing the stem at a random place and position on the bottom of the screen
    float x = random(-30, 30 + width);
    float theta = random(-PI/8, PI/8);
    pushMatrix();
    stem.translate(x, height+10);
    stem.rotate(PI + theta);
    popMatrix();
    
    //create numLeaves leaf objects
    for (int i = 0; i < numLeaves; i++) {
      leaves[i] = new Leaf(x ,theta, weedColor);
    }
  }
  
  void update() {
    //based on the random values saved per stem move the seaweed
    float dtheta = amplitude*cos(t*frequency);
    pushMatrix();
    stem.rotate(dtheta);
    shape(stem, 0, 0);
    popMatrix();
    
    //next timestep in the cosine
    t++;
    if (t > 2*PI/frequency){ //so that t doesn't get stupid big
      t = 0;
    }
    
    //update position for all leaves
    for (int i = 0; i < numLeaves; i++) {
      leaves[i].update(dtheta);
    }
  }
}