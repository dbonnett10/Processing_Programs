void setup(){
  Matrices matrixA = new Matrices(3, 3);
  Matrices matrixB = new Matrices(3, 3);
  Matrices sum = new Matrices(matrixA.Matrices.length,matrixB.Matrices[0].length);
  Matrices product = new Matrices(matrixA.Matrices.length,matrixB.Matrices[0].length);
  
  //populating matrices
  
  matrixA.add(0,0,1);
  matrixA.add(0,1,2);
  matrixA.add(0,2,3);
  matrixA.add(1,0,2);
  matrixA.add(1,1,3);
  matrixA.add(1,2,1);
  matrixA.add(2,0,3);
  matrixA.add(2,1,2);
  matrixA.add(2,2,3);
  
  matrixB.add(0,0,1);
  matrixB.add(0,1,2);
  matrixB.add(0,2,3);
  matrixB.add(1,0,1);
  matrixB.add(1,1,2);
  matrixB.add(1,2,3);
  matrixB.add(2,0,1);
  matrixB.add(2,1,2);
  matrixB.add(2,2,3);
  
  //display contents of Matrix sum
  System.out.println("The sum of MatrixA and MatrixB is ");
  sum = matrixA.addMatrices(matrixA, matrixB, sum);
  for (int t = 0; t < sum.Matrices.length; t++){
    for (int v = 0; v < sum.Matrices[0].length; v++){
       System.out.println(t + ", " + v + " = " + sum.Matrices[t][v]+ " \n"); 
    }
  }
  
  System.out.println("The product of MatrixA and B is ");
  product = matrixA.multiplyMatrices(matrixA, matrixB, product);
   for (int t = 0; t < product.Matrices.length; t++){
    for (int v = 0; v < product.Matrices[0].length; v++){
       System.out.println(t + ", " + v + " = " + product.Matrices[t][v]+ " \n"); 
    }
  } 
System.out.println("End program.");
} //setup

