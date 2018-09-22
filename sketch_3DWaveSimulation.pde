final int waveSourceMax=100;
final int planeWidth=100;
final int planeHeight=100;
int waveSourceCnt;
float t;

float[] k=new float[waveSourceMax];
float[] w=new float[waveSourceMax];
float[] a=new float[waveSourceMax];
int[] X=new int[waveSourceMax];
int[] Y=new int[waveSourceMax];

float[][] offset=new float[planeWidth][planeHeight];
float[][] clr=new float[planeWidth][planeHeight];
boolean[][] ch=new boolean[planeWidth][planeHeight];

float curK,  curW, curA;

final int HUDoffsetx=1000, HUDoffsety=450;

PFont nanum;

void setup(){
  size(1800, 1000, P3D);
  waveSourceCnt=0;
  nanum=createFont("NanumGothic", 50);
  textFont(nanum);
  curK=curW=curA=300;
}

void draw(){
  t=(float)millis()/1000;
  println(t);
  background(0);
  int i, j;
  pushMatrix();
  translate(200, -100, -400);
  rotateX(PI/4);
  rotateY(PI/4);
  //rect(0, 0, 100, 100);
  for(i=0;i<planeWidth;i++){
    for(j=0;j<planeHeight;j++){
      offset[i][j]=calcOffset(i, j);
      clr[i][j]=exp(offset[i][j]/8)/(1+exp(offset[i][j]/8))*255;
      fill(clr[i][j], clr[i][j], 255);
      stroke(clr[i][j], clr[i][j], 255);
      if(i>0){
        line((i-1)*10, j*10, offset[i-1][j], i*10, j*10, offset[i][j]);
      }
      if(j>0){
        line(i*10, (j-1)*10, offset[i][j-1], i*10, j*10, offset[i][j]);
      }
      //println(i, j, offset[i][j]);
      //point(i, j, offset[i][j]);
    }
  }
  popMatrix();
  fill(127);
  stroke(127);
  textSize(30);
  text("k", HUDoffsetx, HUDoffsety-140);
  text("w", HUDoffsetx, HUDoffsety-90);
  text("a", HUDoffsetx, HUDoffsety-40);
  rect(HUDoffsetx+50, HUDoffsety-150, 450, 10);
  rect(HUDoffsetx+50, HUDoffsety-100, 450, 10);
  rect(HUDoffsetx+50, HUDoffsety-50, 450, 10);
  rect(HUDoffsetx+100, HUDoffsety-300, 300, 50);
  fill(0);
  stroke(0);
  textSize(40);
  text("RESET", HUDoffsetx+185, HUDoffsety-260);
  fill(255);
  stroke(255);
  rect(HUDoffsetx+50+curK, HUDoffsety-150, 10, 10);
  rect(HUDoffsetx+50+curW, HUDoffsety-100, 10, 10);
  rect(HUDoffsetx+50+curA, HUDoffsety-50, 10, 10);
  //hint(DISABLE_DEPTH_TEST);
  strokeWeight(2);
  for(i=0;i<planeWidth;i++){
    for(j=0;j<planeHeight;j++){
      if(ch[i][j]){
        fill(255, 0, 0);
        stroke(255, 0, 0);
      }
      else{
        fill(clr[i][j]);
        stroke(clr[i][j]);
      }
      point(HUDoffsetx+i*5, HUDoffsety+j*5);
    }
  }
  strokeWeight(1);
  //hint(ENABLE_DEPTH_TEST);
}

void mousePressed(){
  if(HUDoffsetx<=mouseX&&mouseX<=HUDoffsetx+5*(planeWidth-1)&&HUDoffsety<=mouseY&&mouseY<=HUDoffsety+5*(planeHeight-1)){
    addSource((mouseX-HUDoffsetx)/5, (mouseY-HUDoffsety)/5);
  }
  if(HUDoffsetx+100<=mouseX&&mouseX<=HUDoffsetx+400&&HUDoffsety-300<+mouseY&&mouseY<=HUDoffsety-250){
    for(int i=0;i<waveSourceCnt;i++){
      ch[X[i]][Y[i]]=false;
    }
    waveSourceCnt=0;
  }
}

void mouseDragged(){
  if(HUDoffsetx+50<=mouseX&&mouseX<=HUDoffsetx+500&&HUDoffsety-150<=mouseY&&mouseY<=HUDoffsety-140){
    curK=mouseX-HUDoffsetx-50;
  }
  if(HUDoffsetx+50<=mouseX&&mouseX<=HUDoffsetx+500&&HUDoffsety-100<=mouseY&&mouseY<=HUDoffsety-90){
    curW=mouseX-HUDoffsetx-50;
  }
  if(HUDoffsetx+50<=mouseX&&mouseX<=HUDoffsetx+500&&HUDoffsety-50<=mouseY&&mouseY<=HUDoffsety-40){
    curA=mouseX-HUDoffsetx-50;
  }
}
