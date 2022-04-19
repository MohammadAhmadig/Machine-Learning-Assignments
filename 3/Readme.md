# implementation of SVM

In this assignment you will build an SVM classifier using the quadratic solver in Matlab.Use the Matlab quadratic solver quadprog.m function to write a function that solves the hard margin SVM primal and dual problems discussed in class. Check your function on the data sets given. 

Step1: evaluate your primal and dual codes on the data below:

X=[1 0; 2 1; 2 -1; -1 0 ; -2 1; -2 -1];

Y=[1;1;1;-1;-1;-1];

What is the SVM primal solution? What is the dual solution? What is the training error? 

Step2: Consider the following exclusive-or data set.

X=[2 2; 2 1; 2 3; 1 2; 3 2 ; -2 -2; -2 -1; -2 -3; -1 -2; -3 -2 ; 2 -2; 2 -1;2 -3; 1 -2; 3 -2 ; -2 2; -2 1; -2 3; -1 2; -3 2];


Step3: Use IRIS data in this part. What is the SVM primal solution? What is the dual solution?
