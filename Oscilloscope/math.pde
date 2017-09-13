int precisionRatio(){
  int ratio = 10;
  if(width >= 1920){ ratio = 0;}
  if(width < 1920 && width >= 1024){ ratio = 2;}
  if(width < 1024 && width >= 800){ ratio = 4;}
  if(width < 800){ ratio = 6;}
  return ratio;
}


class Song{
  
  void pause(){ player.pause(); playing = false; }
  void play(){ player.play(); playing = true; }
  void choose(){ selectInput("Selecciona una canción MP3:", "select"); }
  void setVolume(int volQuant){ int x = volQuant/2; player.setGain(-50 + x); }
}

void select(File selection){
    
  if (selection == null) {
      println("No se ha seleccionado cancion, pulse 'L' o haga click en el icono para elegir una.");
  } 
  else {
    
    if(ready){player.pause();}
    
    player = minim.loadFile(selection.getAbsolutePath(),sampleRate);
    meta = player.getMetaData();
    //bsize = player.bufferSize();
    player.loop();
    playing = true;
    player.setGain(-20);
    volQuant = 60;
    ready = true;
  }
}
  
  
  