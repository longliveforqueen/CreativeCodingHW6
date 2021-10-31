int SIZE = 40;
boolean [][] table = new boolean[SIZE][SIZE];
int [][] neighbors = new int[SIZE][SIZE];


void setup() {
  size(800, 800);
  background(255);
  for (int i=0; i<SIZE; i++) {
    for (int j=0; j<SIZE; j++)
    {
      neighbors[i][j] = 0;
      table[i][j] = false;
    }
  }
  //glider();
  //queenBeeShuttle();
  gosperGliderGun();
}

void draw() {
  for (int i=0; i<SIZE; i++) {
    for (int j=0; j<SIZE; j++)
    {
      if (table[i][j]) {
        noStroke();
        fill(0);
        rect(i*20, j*20, 20, 20);
      } else {
        noStroke();
        fill(255);
        rect(i*20, j*20, 20, 20);
      }
    }
  }//end doubleLoop

  getNeighbors();
  nextWorld();
  delay(200);
}

void getNeighbors() {
  for (int r = 0; r < SIZE; r++) {//row
    for (int c = 0; c < SIZE; c++) {//col
      if (r-1 >= 0 && c-1 >= 0   && table[r-1][c-1] )
        neighbors[r][c]++;
      if (r-1 >= 0 && table[r-1][c])             
        neighbors[r][c]++;
      if (r-1 >= 0 && c+1 < SIZE && table[r-1][c+1])
        neighbors[r][c]++;
      if (c-1 >= 0 && table[r][c-1]) 
        neighbors[r][c]++;
      if (c+1 < SIZE && table[r][c+1]) 
        neighbors[r][c]++;
      if (r+1 < SIZE && table[r+1][c]) 
        neighbors[r][c]++;
      if (r+1 < SIZE && c+1 < SIZE && table[r+1][c+1])    
        neighbors[r][c]++;
      if (r+1 < SIZE && c-1 >=0 && table[r+1][c-1])       
        neighbors[r][c]++;
    }
  }//end doubleLoop
}

void nextWorld() {
  for (int r = 0; r < SIZE; r++) {//row
    for (int c = 0; c < SIZE; c++) {//col
      if (neighbors[r][c] == 3) {
        table[r][c] = true;
      }
      //if (neighbors[r][c] == 2) table[r][c] will not change
      if (neighbors[r][c] < 2)
        table[r][c] = false;
      if (neighbors[r][c] >= 4)
        table[r][c] = false;
      neighbors[r][c] = 0;
    }
  }
}

void glider(){
  //glider
  table[2][0]=true;
  table[0][1]=true;
  table[2][1]=true;
  table[1][2]=true;
  table[2][2]=true;
}
void queenBeeShuttle(){
  table[1][4]=true;
  table[1][5]=true;
  table[2][4]=true;
  table[2][5]=true;
  table[6][4]=true;
  table[7][3]=true;
  table[7][5]=true;
  table[8][2]=true;
  table[8][6]=true;
  table[9][3]=true;
  table[9][4]=true;
  table[9][5]=true;
  table[10][1]=true;
  table[10][2]=true;
  table[10][6]=true;
  table[10][7]=true;
  table[21][4]=true;
  table[21][5]=true;
  table[22][4]=true;
  table[22][5]=true;
  
}
void gosperGliderGun(){
  table[1][5]=table[1][6]=true;
  table[2][5]=table[2][6]=true;
  table[11][5]=table[11][6]=table[11][7]=true;
  table[12][4]=table[12][8]=true;
  table[13][3]=table[13][9]=true;
  table[14][3]=table[14][9]=true;
  table[15][6]=true;
  table[16][4]=table[16][8]=true;
  table[17][5]=table[17][6]=table[17][7]=true;
  table[18][6]=true;
  table[21][3]=table[21][4]=table[21][5]=true;
  table[22][3]=table[22][4]=table[22][5]=true;
  table[23][2]=table[23][6]=true;
  table[25][1]=table[25][2]=table[25][6]=table[25][7]=true;
  table[35][3]=table[35][4]=true;
  table[36][3]=table[36][4]=true;
}
