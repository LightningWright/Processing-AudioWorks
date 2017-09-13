void drawUP(color c){
  
  beginShape();
  noFill();
    for (int i = 0; i < sampleRate; i+= 6 + precisionRatio())
    {
      float x2 = i*coef;
      float y2 = (-h2/2 + h2 + player.right.get(i)*height/9);
      stroke(c,drawOpacity);
      vertex(x2, y2);
  
      pushStyle();
        //stroke(-1);
        strokeWeight(4);
        point(x2, y2);
      popStyle();
    }
  endShape();
}

void drawCENTER(color c){
  
  beginShape();
    for (int i = 0; i < sampleRate - 1; i+=8)
    {
      stroke(c,drawOpacity);
      float x = i*coef;
      float y = h2;
      float x2 = i*coef;
      float y2 = h2 + player.mix.get(i)*height/9;
      line(x, y, x2, y2);
    }
    
    noFill();
    //stroke(-1, 50);
    for (int i = 0; i < sampleRate; i+=32)
    {
      float x2 = i*coef;
      float y2 = h2 + player.mix.get(i)*height/9;
      stroke(c,drawOpacity);
      vertex(x2, y2);
  
      pushStyle();
        strokeWeight(4);
        point(x2, y2);
      popStyle();
    }
  endShape();
  
}

void drawDOWN(color c){
  
  for (int i = 0; i < sampleRate - 1; i+= 4 + precisionRatio())
  {
    float x = i*coef;
    float y = h2/2 + h2;
    float x2 = i*coef;
    float y2 = h2/2 + h2 + player.left.get(i)*height/9;
    stroke(c,drawOpacity);
    line(x, y, x2, y2);
  }
}

void drawButtons(){
  
  fill(Color); 
  noStroke();
  int x,y;
  y = buttonsY;
  
  if(!playing){
    beginShape(); //PLAY
      x = playpauseX;  /*Play*/ vertex(x,y); vertex(x,y+20); vertex(x+13,y+10);
    endShape();
  }
  else{
    beginShape(); //PAUSE
      x = playpauseX; vertex(x,y); vertex(x,y+20); vertex(x+5,y+20); vertex(x+5,y);
      x += 10; vertex(x,y); vertex(x,y+20); vertex(x+5,y+20); vertex(x+5,y);
    endShape();
  }
  
  beginShape(); //FWD
    x = fwdX; vertex(x,y); x += 8; vertex(x,y+10); vertex(x,y);
    vertex(x+8,y+10); vertex(x,y+20); vertex(x,y+10); vertex(x-8,y+20); 
  endShape();
  
  beginShape(); //RWD
    x = rwdX; vertex(x+8,y); vertex(x,y+10); vertex(x,y);
    vertex(x-8,y+10); vertex(x,y+20); vertex(x,y+10); vertex(x+8,y+20);
  endShape();
  
  beginShape(); //VOL BACK
  fill(200,200,200);
  vertex(volX,y); vertex(volX,y+20); vertex(volX+100,y+20); vertex(volX+100,y);
  endShape();

  beginShape(); //VOL
  if(mouseButton == LEFT && mouseX >= volX && mouseX <= volX+100 && mouseY >= y && mouseY <= y+20 ){
    volQuant = mouseX-volX;
    song.setVolume(volQuant);
  }  
    fill(Color);
    vertex(volX,y); vertex(volX,y+20); vertex(volX+volQuant,y+20); vertex(volX+volQuant,y);
  endShape();
  pushStyle();
      textSize(12);
      fill(0);
      text(volQuant+"%", volX+38,y+15);
  popStyle();
  
  
  beginShape(); //OPEN
    x = openX; vertex(x,y); vertex(x,y+15); vertex(x+8,y+19); vertex(x+8,y+4);
    stroke(Color); line(x,y,x+12,y+1); line(x+12,y+1,x+12,y+16); line(x+12,y+16,x,y+15);
  endShape();
  
  
}

void texts(){
  
  textSize(30);
  
  fill(255,255,255,50);
  text( (int)(meta.length()/1000-time/1000)/60 + ":"+ (meta.length()/1000-time/1000)%60, 10, 35);
  //
  if(info){
    textSize(20);
    text("FrameRate: " + (int)frameRate,10,80);
    text("SampleRate: " + sampleRate,10,100);
    text("Relación Width/SampleRate: " + coef,10,120);
    
  }
  
  pushStyle();
    textAlign(RIGHT);
    textSize(10);
    text("RIGHT",width-10,6*height/16);
    text("STEREO",width-10,10*height/16);
    text("LEFT",width-10,14*height/16);
  popStyle();
  
}