float calcOffset(int x, int y){
  float ret=0;
  float d;
  for(int i=0;i<waveSourceCnt;i++){
    d=sqrt((x-X[i])*(x-X[i])+(y-Y[i])*(y-Y[i]));
    ret+=sin(k[i]*d-w[i]*t)*a[i]/sqrt(d);
    //ret+=sin(k[i]*d);
    //ret+=sin(d);
  }
  return ret;
}
