Minim minim;
AudioPlayer player;
AudioMetaData meta;
BeatDetect beat;
Song song;

int r;
//int bsize;
float coef; //Coeficiente de ajuste de los graficos
int time;
boolean info = false;

int sampleRate = 1024;


/* INDEXES */
int mode = 0;
int colorIndex = 0;

/* GFX */
color Color;
int drawOpacity = 200;
boolean blockDrawUP = true;
boolean blockDrawCENTER = true;
boolean blockDrawDOWN = true;

int playpauseX = 150;
int fwdX = 180;
int rwdX = 128;
int volX = 220;
int volQuant;
int buttonsY = 15;


boolean ready = false;
boolean playing = false;