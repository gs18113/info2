void addSource(int x, int y){
  k[waveSourceCnt]=curK/300;
  w[waveSourceCnt]=curW/100;
  a[waveSourceCnt]=curA/7;
  X[waveSourceCnt]=x;
  Y[waveSourceCnt]=y;
  ch[x][y]=true;
  waveSourceCnt++;
}
