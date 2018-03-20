import com.sun.xml.internal.bind.v2.schemagen.xmlschema.Particle;
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.dynamics.contacts.*;

float avance; 
float delta;
int attract;

Box2DProcessing box2d;

ArrayList<Particle> Particles;

void setup(){
  
size (700,400);
 box2d = new Box2DProcessing(this);
 box2d.createWorld();
   box2d.createWorld();
  box2d.setGravity(0, 20);
  
 
  bridge = new Bridge(width,width/20);
}

void draw (){
  avance +=delta;
  background(255);
  fill (255,0,0);
  noStroke();
for (int i=0; i<700; i++){
  ellipse (i,200 + sin(i*0.1)*40,2,2);
  
    avance +=delta;
}
  fill (0,255,0);
  noStroke();
for (int n=0; n<700; n++){
  ellipse (i,200 + sin(i*0.3)*50,3,2);
  
   box2d.step();
}

  if (mousePressed) {
    for (Particle b: Particles) {
     b.attract(mouseX,mouseY);
    }
  }
  
  for (Particle b: Particles) {
    b.display();
  }

 
  for (int z = Particles.size()-1; z >= 0; z--) {
    Particle b = Particles.get(i);
    if (b.done()) {
      Particles.remove(i);
    }
  }
}