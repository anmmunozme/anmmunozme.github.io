//Mesh mesh;
Mesh_Cube mesh;

void setup() {
  size(600, 600, P3D);
  //mesh = new Mesh();
  mesh = new Mesh_Cube();
  //cube = new Mesh_Cube();
}

void draw() {
  background(0);
  lights();
  // draw the mesh at the canvas center
  // while performing a little animation
  translate(width/2, height/2, 0);
  rotateX(frameCount*radians(90) / 50);
  rotateY(frameCount*radians(90) / 50);
  // mesh draw method
  mesh.draw();
}

void keyPressed() {
  if (key == ' ')
    mesh.mode = mesh.mode < 3 ? mesh.mode+1 : 0;
  if (key == 'r')
    mesh.retained = !mesh.retained;
  if (key == 'b')
    mesh.boundingSphere = !mesh.boundingSphere;
}