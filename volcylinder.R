volcylinder <- function(dia,len){
  vol=pi*dia^2*len/4
  return(vol)
}

#default value
areacylinder<-function(dia=4,len=4){
  area<-pi*dia*len
  return(area)
}
#multiple input mulitple output (MIMO)
cylinder_mimo <- function(dia,len){
  vol=pi*dia^2*len/4
  area<-pi*dia*len
  res<-c('vol'=vol,'area'=area)
  return(res)
}