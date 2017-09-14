int illusions = 7;
int current = 1;
//toggle illusion activation
boolean active = true;

//2
int num=10;
float[]AngleX=new float[num];
float[]AngleY=new float[num];

//3
int margen = 20;  // margen del dibujo
int esp = 10;     // espaciador
int numElements;  // total de hélices
float[] punto;    // nuevo arreglo para almacenar las rotaciones
int counter = 0;  // contador para recorrer el arreglo de puntos

//inf
int a =0;
int b = 0;
int x,y;

void setup() {
  size(800, 800);
   numElements = ((width-margen*2)/esp) * ((height-margen*2)/esp);
  // println(numElements); /* para saber el número de elementos */

  // inicializar el arreglo de floats "puntos"
  punto = new float[numElements];
  fill(0);
  stroke(0);
  smooth();
}

void draw() {
  background(255);
  pushStyle();
  switch(current) {
  case 1:
    scintillating();
    break;
    // implement from here. Don't forget to add break for each case
  case 2:
    moirecircles();
    break;
  case 3:
    helix();
    break;
  case 4:
    enigma();
    break;
  case 5:
    hering();
    break;
  case 6:
    poggendorff();
    break;
  case 7:
    colorbn();
    break;
    //println("implementation is missed!");
  }
  popStyle();
}

// switch illusion using the spacebar
void keyPressed() {
  if (key == ' ')
    current = current < illusions ? current+1 : 1;
  if (key == 'a')
    active = !active;
}

// Complete info for each illusion
 
/*
 Scintillating Grid
 Author: E. Lingelbach, 1994
 Code adapted from Rupert Russell implementation
 Tags: Physiological illusion, Hermann grid illusion
*/
void scintillating() {
  background(0);          // black background

  //style
  strokeWeight(3);        // medium weight lines 
  smooth();               // antialias lines
  stroke(100, 100, 100);  // dark grey colour for lines

  int step = 25;          // grid spacing

  //vertical lines
  for (int x = step; x < width; x = x + step) {
    line(x, 0, x, height);
  }

  //horizontal lines
  for (int y = step; y < height; y = y + step) {
    line(0, y, width, y);
  }

  // Circles
  if (active) {
    ellipseMode(CENTER);
    stroke(255, 255, 255);  // white circles
    for (int i = step; i < width -5; i = i + step) {
      for (int j = step; j < height -15; j = j + step) {
        strokeWeight(6); 
        point(i, j);
        strokeWeight(3);
      }
    }
  }
}
void lineAndBall(){
  ellipse(56, 46, 55, 55);
  
}

void helix(){
  for (int y = margen; y < height-margen; y += esp) {
    for (int x = margen; x < width-margen; x += esp) {
      helix(x, y, counter);
      counter++;
      
    }
  }
  counter = 0;
}

void helix(int _x, int _y, int rot) {

  // calcula la distancia ente el mouse y las coordenadas de entrada
  float d = dist(mouseX, mouseY, _x, _y); 
   if (d<50){
      stroke(#4d4dff);
    } 
   /* if( d<100 && d>=50){
    stroke(#1a1aff);
  }*/
    else {
      stroke(#0000ff);
    }
  pushMatrix();
  { // resetea el sistema de coordenadas
    translate(_x, _y);

    /* la rotación de cada hélice se incrementa en una
     cantidad proporcional a la distancia 'd' (entre su posición y el mouse)
     acumulando diferencias entre cada una de ellas */

    punto[rot] += d/3000;
    if(active){
    rotate(punto[rot]);
    }
    // el eje
    //stroke(#0000ff);
    beginShape();
    vertex(-esp/2, 0);
    vertex(0, 1);
    vertex(esp/2, 0);
    vertex(0, -1);
    endShape();
    
  }
  popMatrix();
  
}

void moirecircles(){
  //http://www.michaelbach.de/ot/lum-moire1/index.html
  background(250);

  noFill();
  stroke( 0 );
  strokeWeight(3);

  int oneThirdWidth = width / 3;
  int twoThirdsWidth = 2 * width / 3;

  // draw the set of concentric circles on the left:
  for( int n = 0; n < twoThirdsWidth; n = n + 15 ) {
    ellipse( oneThirdWidth, height / 2, n, n );
    stroke(#006600);
  }
  noStroke();  
  if(active){
    float t = millis()/1000.0f;
    if(twoThirdsWidth > width/2 || twoThirdsWidth  < 0 ){
      t *= -1;
    }
    translate(100*cos(t),100*sin(t));
  }
  // draw the set of concentric circles on the right:
  for( int n = 0; n < twoThirdsWidth; n = n + 15 ) {
    ellipse( twoThirdsWidth, height / 2 , n, n);
    stroke(#0000b3);
    }
}

void enigma(){
  //http://www.michaelbach.de/ot/mot-enigma/index.html
  background(250);
smooth();
noStroke();

int diameter = width+350;
int points = 180; //number of points
float pointAngle = 360/points; //angle between points
float angulo = 0 ;

float[] angs = new float[points];
for (int i = 0; i < angs.length; i++){
  angs[i] = angulo + pointAngle;
}
float lastAng = 0;
for (int i = 0; i < angs.length; i++){
  if(i%2==0){
    fill(0);}
  else{
    fill(250);
  }
  arc(width/2, height/2, diameter, diameter, lastAng, lastAng+radians(angs[i]));
  lastAng += radians(angs[i]);  
}
if(active){
  fill(#ffff00);
  ellipse(width/2, height/2, 126,126);
  noFill();
  stroke(#ffff00);
  strokeWeight(22);
  ellipse(width/2, height/2, 230,230);
  noStroke();
  
  stroke(#ffff00);
  strokeWeight(40);
  ellipse(width/2, height/2, 400,400);
  noStroke();
  
  stroke(#ffff00);
  strokeWeight(60);
  ellipse(width/2, height/2, 620,620);
  }
}

void hering(){
  //http://www.michaelbach.de/ot/ang-hering/index.html
  translate(width/2, height/2);
  if(active){
    stroke(0);
    strokeWeight(1.2);
    for (int i=0; i<71; i++) {
      rotate(90);
      line(0, 0, 800, 800);
    }
  }
  strokeWeight(2);
  stroke(#000080);
  //rotate(-245);
  
 // translate(-250, -400);
  /*line(200, 0, 200, 800);
  line(300, 0, 300, 800); */
  translate(-400, -250);
  line(0, 200, 800, 200);
  line(0, 300, 800, 300);
}

void inf(){
  a=400;b=400;
  for(int i=0;i<=(b*b);i++){
    x=(i%b);
    y=(i/b);
    stroke(255*sin(0.5*frameCount*(sqrt(sq(a/2-x)+sq(a/2-y)))));
  //  if(active){
      point(x,y);
      point(a-x,y);
    //}
  }
}

void colorbn(){
  background(255);
  int color1=50;
  strokeWeight(1);
  if(active){
    for(int g=1;g<=800;g++){
      stroke(color1);
      line(g,0,g,800);
      if(g%4==0)
      color1++;
    }
  }
  noStroke();
  fill(119);
  rect(50,height/2-40,700,80);
}

void poggendorff(){
  //http://www.michaelbach.de/ot/ang-poggendorff/index.html
  int bar = 40;
  for(int i=0; i*bar<1500; i++){
    stroke(0);
    line(i*bar,0,0,i*2*bar);
  }
  if(active){
    for(int i=0; i*bar<800; i++){
      noStroke();
      fill(#ffff00);
      if(i%2==0){
        rect(i*bar,0,bar,800);
      }
    }  
  }
}