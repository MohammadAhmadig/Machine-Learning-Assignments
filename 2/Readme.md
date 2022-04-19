# Boosting & Bagging

In this set of problems, we are going to take a look at ensembles. In machine learning ensembles use multiple learning algorithms to achieve better predictive performance. Bagging, boosting and random forests are 3 forms of ensembles that we are going to get familiar with. Weka (Waikato Environment for Knowledge Analysis) is a popular suite of machine learning software written in Java, developed at the University of Waikato, New Zealand. Weka is free software available under the GNU General Public License. You can use its interface or use its implemented models and classifiers in the body of your java program or other programming languages. You can also use it in Matlab. In order to do so, the “.jar” file of Weka should be added to the path of your program.

Bagging:

Bagging is short for bootstrap aggregation. In this part your task is to implement a bagging classifier. You should use decision trees as base classifiers and use one of the most famous and accurate methods, the C4.5 algorithm, to create decision trees. To do so, you need to connect the Weka software to the Matlab compiler and use Weka’s C4.5 implementations in Matlab environment.

I. Use 50 bootstrap samples to train your model.

II. Change the number of bootstrap samples and see what happens. Write down your observations in your report.

III. Use 5 bootstrap samples to train your model and calculate “Q-statistic”, which is a popular measure of diversity, in your ensemble models just for the test sets.

Random Forests:

Now that you are familiar with the concepts of bagging and how it works, it’s time to work on “Random Forests”.

I. Configure the parameters of your model (max tree depth, number of estimators, number of features, and ...) and use cross validation to evaluate your model.

II. Try increasing the number of trees as much as you can. Does increasing the number of trees result in the algorithm to overfit?!

Boosting:

Boosting is another ensemble algorithm. The way it works is a little different from bagging and random forests. Here we are going to use Adaboost M1 for classification.

I. Use decision tree as base classifier and use C4.5 method to create them.

II. Set max iterations to 30

