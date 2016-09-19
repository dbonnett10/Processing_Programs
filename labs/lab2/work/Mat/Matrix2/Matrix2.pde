class Matrices{
  float [][] Matrices;
  int row;
  int col;
  float s, p;
  
   Matrices(int r, int c){
    Matrices = new float[r][c];
  }//constructor
   Matrices addMatrices(Matrices matrixA, Matrices matrixB, Matrices sum){
    int m = matrixA.Matrices.length;
    int n = matrixA.Matrices[0].length;
    for(int i = 0; i < m; i++){
       for(int j = 0; j < n; j++){
            s = matrixA.Matrices[i][j] + matrixB.Matrices[i][j];
            sum.Matrices[i][j] = s;
       }//inner for
    }//outer for
    return sum;
  }//add matrix
  
  Matrices multiplyMatrices(Matrices matrixA, Matrices matrixB, Matrices product){
    int matrixArows = matrixA.Matrices.length;
    int matrixAcols = matrixA.Matrices[0].length;
    int matrixBrows = matrixB.Matrices.length;
    int matrixBcols = matrixB.Matrices[0].length;
    for(int i = 0; i < matrixArows; i++){
       for(int j = 0; j < matrixBcols; j++){
         for(int k = 0; k <matrixAcols; k++){ 
           p = product.Matrices[i][j] + matrixA.Matrices[i][k] * matrixB.Matrices[k][j];
           product.Matrices[i][j] = p;
       }//for
      }//inner for
    }//outer for
    return product;
  }//multiply matrix
  
  void add(int row, int col, int value){
    Matrices[row][col] = value;
  } //add
} //matrices
