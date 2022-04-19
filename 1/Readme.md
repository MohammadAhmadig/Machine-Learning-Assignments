# Decision Tree

In this task, you will implement a basic algorithm for learning a decision tree. (The ID3 algorithm is mentioned in table 3.1 of the Tom Mitchel’s book.)
- Implement your own code from scratch.
- Use gain split and gain ratio methods to find best attribute at each node.
- Use 10-fold cross validation for evaluation.

Dataset:

Dataset is uploaded on Sess. This dataset includes descriptions of hypothetical samples corresponding to 23 species of gilled mushrooms. Each species is identified as definitely edible or definitely poisonous. There are missing values for some attributes that you should handle them in your implementations. In order to do this, you should substitute the missing values by the mode (most common value of an attribute) of the corresponding attribute of the samples of the same class. In categorical (Nominal) attributes, one way is to substitute the missing values with the mode. Mode should be computed form the samples which have the same label with the considered sample’s label.
