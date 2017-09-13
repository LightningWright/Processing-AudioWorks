Minim minim;
AudioPlayer player;
AudioMetaData meta;
BeatDetect beat;
Song song;

int h2;
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

int playpauseX = 180;
int fwdX = 210;
int rwdX = 158;
int volX = 260;
int volQuant;
int openX = 120;
int buttonsY = 15;


boolean ready = false;
boolean playing = false;