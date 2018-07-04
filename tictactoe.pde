Game g;
Winsrc w;
int currentScene, GAME, WIN;

void setup() {
  size(360, 360); 
  g = new Game();
  w = new Winsrc(g);
  GAME = 0;
  WIN = 1;
  currentScene = GAME;
}

void draw() {
  background(34, 139, 34);
  if (currentScene == GAME) {
    g.display();
    g.winCheck();
    if (g.xWon || g.oWon) {
      g = new Game();
      currentScene = WIN;
    }
    for (int i = 0; i < g.board.length; i++) {
      if (g.board[i][0]) {
        g.drawIn(i, g.board[i][1]);
      }
    }
  }else{
    w.display();
  }
}

void mouseClicked() {
  if(currentScene == GAME){
    g.boxCheck();
  }else{
    currentScene = GAME;
  }

}
