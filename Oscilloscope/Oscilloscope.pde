import ddf.minim.*;
import ddf.minim.analysis.*;

void setup()
{
  
  frameRate(120);
  size(1400, 720,JAVA2D);
  surface.setResizable(true);
  
  r = height/2;
  coef = (float)(width+45)/sampleRate;
  
  minim = new Minim(this);
  beat = new BeatDetect();
  song = new Song();
  
  selectInput("Selecciona una canción a reproducir:", "select");
  setMode(mode,colorIndex);
  
}

void draw()
{ 
  if(ready){
  time =  player.position();
  
  //Efecto Fade
  fill(#1A1A1A, 230);
  noStroke();
  rect(0, 0, width, height);
  
  //stroke(-1, 50);
  
  if(!blockDrawUP){drawUP(Color);}
  if(!blockDrawCENTER){drawCENTER(Color);}
  if(!blockDrawDOWN){drawDOWN(Color);}
  drawButtons();
  
  texts();
  }
  else{
    background(255);
  }
  
}

void mousePressed(){
  if(mouseButton == RIGHT && mouseY > 35)
  {
    if (colorIndex == 3){colorIndex = 0;}
    else{colorIndex++;}
    setMode(mode,colorIndex);
  }
  
  if(mouseButton == LEFT && mouseY > 35){ 
    if (mode == 4){mode = 0;}
    else{mode++;}
    setMode(mode,colorIndex);
  }
  
  // PLAY/PAUSE EVENT LOGIC
  if( mouseButton == LEFT && 
      mouseX >= playpauseX &&
      mouseX <= playpauseX+16 &&
      mouseY >= buttonsY &&
      mouseY <= buttonsY+20 )
  {
    if(playing){song.pause();}
    else{song.play();}
  }
  // FWD EVENT LOGIC
  if( mouseButton == LEFT && 
      mouseX >= fwdX &&
      mouseX <= fwdX+16 &&
      mouseY >= buttonsY &&
      mouseY <= buttonsY+20 )
  {
    player.skip(4000);
  }
  
  // RWD EVENT LOGIC
  if( mouseButton == LEFT && 
      mouseX >= rwdX &&
      mouseX <= rwdX+16 &&
      mouseY >= buttonsY &&
      mouseY <= buttonsY+20 )
  {
    player.skip(-4000);
  }

}
void keyPressed() {
  if(key==' ')exit();
  if(key=='s')saveFrame("###.jpeg");
  //if(key == 'w'){player.skip(4000);}
  //if(key == 'q'){player.skip(-4000);}
  //if(key == 'e'){song.pause();}
  //if(key == 'r'){song.play();}
  if(key == 'º'){info = !info; if(drawOpacity == 200){drawOpacity = 80;}else if(drawOpacity == 80){drawOpacity = 200;}}
  if(key == 'l'){song.choose();}
  
}

void setMode( int mode, int colorIndex ){
  
  switch (mode) {
            case 0: blockDrawUP = false; blockDrawCENTER = false; blockDrawDOWN = false; 
              break;
            case 1: blockDrawUP = false; blockDrawCENTER = true; blockDrawDOWN = true; 
              break;
            case 2: blockDrawUP = true; blockDrawCENTER = false; blockDrawDOWN = true;
              break;
            case 3: blockDrawUP = true; blockDrawCENTER = true; blockDrawDOWN = false;
              break;
            case 4: blockDrawUP = false; blockDrawCENTER = true; blockDrawDOWN = false; 
              break;
  }
  
  switch (colorIndex) {
            case 0: Color = #FF0AFF;
              break;
            case 1: Color = #66CC6B;
              break;
            case 2: Color = #12C4F4;
              break;
            case 3: Color = #FFBF00;
              break;
  }
}