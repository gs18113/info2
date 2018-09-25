void addSource(int x, int y){
  if(waveSourceCnt==100) return;
  k[waveSourceCnt]=curK/300;
  w[waveSourceCnt]=curW/100;
  a[waveSourceCnt]=curA/7;
  T[waveSourceCnt]=t;
  X[waveSourceCnt]=x;
  Y[waveSourceCnt]=y;
  ch[x][y]=true;
  waveSourceCnt++;
}
