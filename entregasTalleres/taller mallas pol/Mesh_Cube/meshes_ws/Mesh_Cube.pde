class Mesh_Cube{  
  ArrayList<PVector> vertices;
  PShape shape;
  float radius = 100;
  
  // rendering
  boolean retained;

  // visual modes
  // 0. Faces and edges
  // 1. Wireframe (only edges)
  // 2. Only faces
  // 3. Only points
  int mode;
  
  // visual hints
  boolean boundingSphere;
  
  Mesh_Cube() {
    vertices = new ArrayList<PVector>();
    float dist = radius/sqrt(3);
    vertices.add(new PVector(dist, dist, dist));
    vertices.add(new PVector(-dist, dist, dist));   
    vertices.add(new PVector(-dist, -dist, dist));
    vertices.add(new PVector(dist, -dist, dist));
    vertices.add(new PVector(dist, dist, -dist));
    vertices.add(new PVector(-dist, dist, -dist));
    vertices.add(new PVector(-dist, -dist, -dist));
    vertices.add(new PVector(dist, -dist, -dist));

    buildShape();
    shape.disableStyle();
  }

  void buildShape() {
    shape = createShape(GROUP);  
    PShape shape1 = createShape();
    PShape shape2 = createShape();
    PShape shape3 = createShape();
  
    shape1.beginShape(QUAD);
    shape1.vertex(vertices.get(0).x, vertices.get(0).y, vertices.get(0).z);
    shape1.vertex(vertices.get(1).x, vertices.get(1).y, vertices.get(1).z);
    shape1.vertex(vertices.get(2).x, vertices.get(2).y, vertices.get(2).z);
    shape1.vertex(vertices.get(3).x, vertices.get(3).y, vertices.get(3).z);
    shape1.endShape();
    
    shape2.beginShape(QUAD_STRIP);
    shape2.vertex(vertices.get(0).x, vertices.get(0).y, vertices.get(0).z);
    shape2.vertex(vertices.get(4).x, vertices.get(4).y, vertices.get(4).z);
    shape2.vertex(vertices.get(1).x, vertices.get(1).y, vertices.get(1).z);
    shape2.vertex(vertices.get(5).x, vertices.get(5).y, vertices.get(5).z);
    shape2.vertex(vertices.get(2).x, vertices.get(2).y, vertices.get(2).z);
    shape2.vertex(vertices.get(6).x, vertices.get(6).y, vertices.get(6).z);
    shape2.vertex(vertices.get(3).x, vertices.get(3).y, vertices.get(3).z);
    shape2.vertex(vertices.get(7).x, vertices.get(7).y, vertices.get(7).z);
    shape2.vertex(vertices.get(0).x, vertices.get(0).y, vertices.get(0).z);
    shape2.vertex(vertices.get(4).x, vertices.get(4).y, vertices.get(4).z);
    shape2.endShape();
    
    shape3.beginShape(QUAD);
    shape3.vertex(vertices.get(4).x, vertices.get(4).y, vertices.get(4).z);
    shape3.vertex(vertices.get(5).x, vertices.get(5).y, vertices.get(5).z);
    shape3.vertex(vertices.get(6).x, vertices.get(6).y, vertices.get(6).z);
    shape3.vertex(vertices.get(7).x, vertices.get(7).y, vertices.get(7).z);
    shape3.endShape();
    
    shape.addChild(shape1);
    shape.addChild(shape2);
    shape.addChild(shape3);
  }

  void drawImmediate() {
    
    beginShape(QUAD);
    vertex(vertices.get(0).x, vertices.get(0).y, vertices.get(0).z);
    vertex(vertices.get(1).x, vertices.get(1).y, vertices.get(1).z);
    vertex(vertices.get(2).x, vertices.get(2).y, vertices.get(2).z);
    vertex(vertices.get(3).x, vertices.get(3).y, vertices.get(3).z);
    endShape();
    
    beginShape(QUAD_STRIP);
    vertex(vertices.get(0).x, vertices.get(0).y, vertices.get(0).z);
    vertex(vertices.get(4).x, vertices.get(4).y, vertices.get(4).z);
    vertex(vertices.get(1).x, vertices.get(1).y, vertices.get(1).z);
    vertex(vertices.get(5).x, vertices.get(5).y, vertices.get(5).z);
    vertex(vertices.get(2).x, vertices.get(2).y, vertices.get(2).z);
    vertex(vertices.get(6).x, vertices.get(6).y, vertices.get(6).z);
    vertex(vertices.get(3).x, vertices.get(3).y, vertices.get(3).z);
    vertex(vertices.get(7).x, vertices.get(7).y, vertices.get(7).z);
    vertex(vertices.get(0).x, vertices.get(0).y, vertices.get(0).z);
    vertex(vertices.get(4).x, vertices.get(4).y, vertices.get(4).z);
    endShape();
    
    beginShape(QUAD);
    vertex(vertices.get(4).x, vertices.get(4).y, vertices.get(4).z);
    vertex(vertices.get(5).x, vertices.get(5).y, vertices.get(5).z);
    vertex(vertices.get(6).x, vertices.get(6).y, vertices.get(6).z);
    vertex(vertices.get(7).x, vertices.get(7).y, vertices.get(7).z);
    endShape();
       
  }
  void draw() {
    pushStyle();
    
    // mesh visual attributes
    // manipuate me as you wish
    int strokeWeight = 3;
    color lineColor = color(255, retained ? 0 : 255, 0);
    color faceColor = color(0, retained ? 0 : 255, 255, 100);
    
    strokeWeight(strokeWeight);
    stroke(lineColor);
    fill(faceColor);    
    // visual modes
    switch(mode) {
    // 0. Faces and edges
    case 1:
      // 1. Wireframe (only edges)
      noFill();
      break;
    case 2:
      // 2. Only faces
      noStroke();
      break;
    case 3:
    float dist = radius/sqrt(3);
    point(dist, dist, dist);
     point(-dist, dist, dist);
     point(-dist, -dist, dist);
    vertices.add(new PVector(dist, -dist, dist));
    vertices.add(new PVector(dist, dist, -dist));
    vertices.add(new PVector(-dist, dist, -dist));
    vertices.add(new PVector(-dist, -dist, -dist));
    vertices.add(new PVector(dist, -dist, -dist));
      // TODO: implement me
      break;
    }
      // rendering modes
    if (retained)
      shape(shape);
    else
      drawImmediate();
    popStyle();

    // visual hint
    if (boundingSphere) {
      pushStyle();
      noStroke();
      fill(0, 255, 255, 125);
      sphere(radius);
      popStyle();
    
    }
  }
}