class Winsrc{
  Game g;
  String congrats, win ,winner, restart;
  
  Winsrc(Game g1){
    g = g1;
    winner = "";
    congrats = "Cogratulations!";
    restart = "Click on the screen to restart...";
  }
  
  void display(){
    if(g.xWon){
      winner = "X";
    }else if(g.oWon){
      winner = "O";
    }
    
    win = winner + " won the game!";
    textSize(20);
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    text(congrats, width/2, height/2);
    textSize(15);
    text(win, width/2, height/2+20);
    textSize(10);
    text(restart, width/2, height/2+40);
  }
}
