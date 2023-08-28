PImage mainImage;
PImage reloadImage;
PImage blurImage;
PImage thresholdImage;
PImage grayImage;
PImage posterImage;
PImage erodeImage;
PImage dilateImage;
PImage pixelateImage;
PImage temp;

PImage [] picArray = new PImage [8];

void setup(){
  //Load main image in fullscreen
  fullScreen();
  mainImage = loadImage("image.jpg");
  mainImage.resize(1440, 900);
  image(mainImage, 0, 0);
  
 //Copies for each filter and adding to pic array
 
  reloadImage = mainImage.copy();
  reloadImage.resize(180, 150);
  picArray[0] = reloadImage; 
 
  blurImage = mainImage.copy();
  blurImage.resize(180, 150);
  blurImage.filter(BLUR, 3);
  picArray[1] = blurImage;  
  //picArray.push();
  
  thresholdImage = mainImage.copy();
  thresholdImage.resize(180, 150);
  thresholdImage.filter(THRESHOLD, 0.5);
  picArray[2] = thresholdImage;  
  
  grayImage = mainImage.copy();
  grayImage.resize(180, 150);
  grayImage.filter(GRAY);
  picArray[3] = grayImage;  
  
  posterImage = mainImage.copy();
  posterImage.resize(180, 150);
  posterImage.filter(POSTERIZE, 4);
  picArray[4] = posterImage;  
  
  erodeImage = mainImage.copy();
  erodeImage.resize(180, 150);
  erodeImage.filter(ERODE);
  picArray[5] = erodeImage;  
  
  dilateImage = mainImage.copy();
  dilateImage.resize(180, 150);
  dilateImage.filter(DILATE);
  picArray[6] = dilateImage;  
  
  pixelateImage = mainImage.copy();
  pixelateImage.resize(180, 150);
  pixelateImage.filter(BLUR, 1);
  picArray[7] = pixelateImage;  
}

void draw(){
 
  for(int i = 0; i< picArray.length; i++) {
    image(picArray[i], i*180, 750);
  }
  
  boxText();
  
  //Line that separates main image from filters
  strokeWeight(5);
  stroke(0);
  line(0, height - 150, width, height - 150);
}

void mousePressed(){
  
    if(mouseY > 750) {
        int n = floor(mouseX/180);
        switch(n) {
          case 0: 
          mainImage = loadImage("image.jpg");
          mainImage.resize(1440, 900);
          image(mainImage, 0, 0);
          break;
          
          case 1: 
          mainImage.filter(BLUR, 3);
          image(mainImage, 0, 0);
          break;
          
          case 2: 
          mainImage.filter(INVERT);
          mainImage.filter(THRESHOLD, 0.5);
          image(mainImage, 0, 0);
          break;
          
          case 3: 
          mainImage.filter(GRAY);
          image(mainImage, 0, 0);
          break;
          
          case 4:
          mainImage.filter(POSTERIZE, 4);
          mainImage.filter(DILATE);
          image(mainImage, 0, 0);
          break;
          
          case 5: 
          mainImage.filter(ERODE);
          mainImage.filter(DILATE);
          image(mainImage, 0, 0);
          break;
          
          case 6: 
          mainImage.filter(DILATE);
          image(mainImage, 0, 0);
          break;
                  
          case 7:
          rainDrop();
          break;
      }
  }

}

void rainDrop() {

         for(int i = 0; i<500; i++){
         float x = random(width);
          float y = random(height - 160);
          color c = mainImage.get(floor(x), floor(y));
          noStroke();
          fill(c);
          circle(x, y, 10); 
          //  image(mainImage, 0, 0);
         }
          
}


void keyPressed(){
    if(key == 's') {
      temp = get(0, 0, width, height - 150);
      temp.save("final.jpg");
    }
}

void boxText() {
 
  textSize(20);
  fill(255);
  strokeWeight(10);
  text("RESET", 60, height - 100);
  text("BLUR", 240, height - 100);
  text("INVERT", 440, height - 100);
  text("B&W", 600, height - 100);
  text("POSTER", 780, height - 100);
  text("DARKEN", 950, height - 100);
  text("BRIGHTEN", 1130, height - 100);
  text("RAINDROP", 1310, height - 100);
     
   }
