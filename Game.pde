class Game {
  boolean currPl, xWon, oWon;
  float off;
  PImage x, o;
  PVector[] imgPos;
  float thirdw, thirdh;
  boolean[][] board;

  Game() {
    off = 30;
    currPl = false;
    x = loadImage("x.png");
    o = loadImage("circle.png");
    xWon = false;
    oWon = false;
    thirdw = (width-2*off)/3;
    thirdh = (height-2*off)/3;
    //imgDis = new int[2][9];
    imgPos= new PVector[]{ new PVector(off+10, off+10)         , new PVector(off+thirdw+10, off+10)         , new PVector(off+2*thirdw+10, off+10),
                           new PVector(off+10, off+thirdh+10)  , new PVector(off+thirdw+10, off+thirdh+10)  , new PVector(off+2*thirdw+10, off+thirdh+10),
                           new PVector(off+10, off+2*thirdh+10), new PVector(off+thirdw+10, off+2*thirdh+10), new PVector(off+2*thirdw+10, off+2*thirdh+10)};
                           
    board = new boolean[][]{ {false, false}, {false, false}, {false, false},
                             {false, false}, {false, false}, {false, false},
                             {false, false}, {false, false}, {false, false} };

  }

  void display() {
    strokeWeight(2);
    stroke(10, 10, 255);

    
    //Verical Lines
    line(thirdw+off, off, thirdw+off, height-off);
    line(2*thirdw+off, off, 2*thirdw+off, height-off);

    //Horizontal Lines
    line(off, thirdh+off, width-off, thirdh+off);
    line(off, 2*thirdh+off, width-off, 2*thirdh+off);
    
  }
  
  void drawIn(int n, boolean type){
    if(type){
      image(x, imgPos[n].x, imgPos[n].y, 80, 80);
    }else{
      image(o, imgPos[n].x, imgPos[n].y, 80, 80);
    }
  }
  
  void boxCheck(){
   if(mouseX > off && mouseX < off+thirdw){
     if(mouseY > off && mouseY < off+thirdh){
       if(!board[0][0]){
         board[0][0] = true;
         board[0][1] = currPl;
       }else{
        return; 
       }
     }else if(mouseY > off+thirdh && mouseY < off+2*thirdh){
       if(!board[3][0]){
         board[3][0] = true;
         board[3][1] = currPl;
       }else{
        return; 
       }
     }else if(mouseY > off+2*thirdh && mouseY < height-off){
       if(!board[6][0]){
         board[6][0] = true;
         board[6][1] = currPl;
       }else{
        return; 
       }
     }
     currPl = !currPl;
   }else if(mouseX > off+thirdw && mouseX < off+2*thirdw){
     if(mouseY > off && mouseY < off+thirdh){
       if(!board[1][0]){
         board[1][0] = true;
         board[1][1] = currPl;
       }else{
        return; 
       }
     }else if(mouseY > off+thirdh && mouseY < off+2*thirdh){
       if(!board[4][0]){
         board[4][0] = true;
         board[4][1] = currPl;
       }else{
        return; 
       }
     }else if(mouseY > off+2*thirdh && mouseY < height-off){
       if(!board[7][0]){
         board[7][0] = true;
         board[7][1] = currPl;
       }else{
        return; 
       }
     }
     currPl = !currPl;
   }else if(mouseX > off+2*thirdw && mouseX < width-off){
     if(mouseY > off && mouseY < off+thirdh){
       if(!board[2][0]){
         board[2][0] = true;
         board[2][1] = currPl;
       }else{
        return; 
       }
     }else if(mouseY > off+thirdh && mouseY < off+2*thirdh){
       if(!board[5][0]){
         board[5][0] = true;
         board[5][1] = currPl;
       }else{
        return; 
       }
     }else if(mouseY > off+2*thirdh && mouseY < height-off){
       if(!board[8][0]){
         board[8][0] = true;
         board[8][1] = currPl;
       }else{
        return; 
       }
     }
     currPl = !currPl;
     }
   
  }
  
  void winCheck(){
    for(int x = 0; x < 3; x++){
      //Vertical
      if(board[x][0] && board[x+3][0] && board[x+6][0]){
        if(board[x][1] && board[x+3][1] && board[x+6][1]){
          xWon = true;
          oWon = false;
        }else if(!board[x][1] && !board[x+3][1] && !board[x+6][1]){
          oWon = true;
          xWon = false;
        }
      }
      
      //Horizontal
      if(board[3*x][0] && board[3*x+1][0]&&board[3*x+2][0]){
        if(board[3*x][1] && board[3*x+1][1] && board[3*x+2][1]){
          xWon = true;
          oWon = false;
        }else if(!board[3*x][1] && !board[3*x+1][1] && !board[3*x+2][1]){
          oWon = true;
          xWon = false;
        }
      }
    }
    
    if(board[0][0] && board[4][0]&&board[8][0]){
      if(board[0][1] && board[4][1] && board[8][1]){
          xWon = true;
          oWon = false;
        }else if(!board[0][1] && !board[4][1] && !board[8][1]){
          oWon = true;
          xWon = false;
        }
      }
      
    if(board[2][0] && board[4][0]&&board[6][0]){
      if(board[2][1] && board[4][1] && board[6][1]){
          xWon = true;
          oWon = false;
        }else if(!board[2][1] && !board[4][1] && !board[6][1]){
          oWon = true;
          xWon = false;
        }
      }
    }

  }
