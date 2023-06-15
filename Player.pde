class Player
{
 int x;
 int y;
 PImage[] explosion; //array for explosion images
 int images = 10; // amount of images
 int currImage = 1; // current image
 int delay = 250; // time between images in milliseconds
 boolean playing;

 Player(int images, int delay)
 {
   this.images = images;
   this.delay = delay;
   explosion = new PImage[images];
   
 }
 

 
 void loadImg(){
    for(int i = 0; i < images; i++) {
      explosion[i] = loadImage("./Bubble_Explo/explo" + i + ".png");
   }
 }
 
  void setPosition(int x, int y){
   this.x = x;
   this.y = y;
 }

  void render(){
    
    image(explosion[currImage],x,y);
    
    currImage++;
    if(currImage == images)
    {
      currImage=0;
    }
    delay(delay);
    //explosion sometimes doesn't play for some reason - pressing both mouse buttons simultaneously tends to fix/cause this to happen less.
    //clicking and explosion playing causes slow down - could just be my laptop?
  }
  
  
  
}
