#include <iostream>
// #include <conio.h> 
#include <Eigen/Dense>
#include "test2.h"

using namespace std ;
using namespace Eigen;



int main(){
    
    Matrix<float, 3 ,3 > matrixA;
    matrixA.setZero();
    
    int value=addme(4,4);

   
    cout<< "the matrix is......" <<endl;   
    cout<<matrixA<<endl; 
    cout<<value<<endl; 
    cout<< "........." <<endl;  
     
    cout << "Press Enter  to close the program" << endl;

    // while (!_kbhit()) { // Wait for a key press
    //     // Do nothing
    // }
    // _getch(); // Clear the key from buffer
    cin.ignore();
    
    return 0;
}
