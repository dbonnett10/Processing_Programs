class Matrix {
  
  int rows;
  int columns;
  float[][] Matrix;
  int i, j ,v, one, two, g, m1rows,m1cols,m2rows,m2cols;
  float s, k, three;
  

   Matrix(int r, int col) {
    Matrix = new float[r][col];
    rows = r;
    columns = col;
  } //Matrix
  
  Matrix addMatrix(Matrix m1, Matrix m2, Matrix sum) {
    if (m1.Matrix[0].length == m2.Matrix.length) {
    for (int i = 0; i < m2.Matrix.length; i ++) {
      for(int j = 0; j < m1.Matrix[0].length; j++) {
        s = m1.Matrix[i][j] + m2.Matrix[i][j];
       sum.Matrix[i][j] = s; 
        }
      } 
    } else {
      System.out.println("The rows and columns do not match up");
    }
   return sum; 
  } //addMatrix
  
  Matrix multMatrix(Matrix m1, Matrix m2, Matrix product) {
    if (m1.Matrix[0].length == m2.Matrix.length) {
      g = 0;
    m1rows = m1.Matrix.length;
    m1cols = m1.Matrix[0].length;
    m2rows = m2.Matrix.length;
    m2cols = m2.Matrix[0].length;
    
    for (int i = 0; i < m1rows; i++) {
      
      for (int j = 0; j < m2cols; j++) {
        
        for (int k = 0; k < m1cols; k++) {
          
          product.Matrix[i][j] = product.Matrix[i][j] + m1.Matrix[i][k]*m2.Matrix[k][j];
        }
        }
      }
    } else {
      System.out.println("the rows and columns do not match up");
    }
    return product;
  } //multMatrix   
  
  void add(int one, int two, float three) {
    Matrix[one][two] = three;
  }
  
  float get(int one, int two, float three) {
    return Matrix[one][two];
  }
  
} //Matrix class


