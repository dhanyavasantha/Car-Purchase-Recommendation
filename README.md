# Car-Purchase-Recommendation

# Car Evaluation Analysis  

## Project Overview  
This project analyzes the *Car Evaluation Dataset* from the *UCI Machine Learning Repository* to understand the factors influencing car acceptability. The study investigates the impact of *safety, price, luggage boot space, maintenance, and other factors* on car evaluation using *Decision Tree and Random Forest models*.  

### *Objectives*  
1. *Exploratory Data Analysis (EDA):* Identify trends in car acceptability based on various attributes.  
2. *Decision Tree & Random Forest Models:* Determine the most influential factors affecting car acceptability.  
3. *Research Questions:*  
   - What are the most influential factors in car evaluation?  
   - Do higher-priced cars have better safety ratings?  
   - Does luggage boot size influence buying preferences?  

## Dataset Description  
The *Car Evaluation Dataset* contains *1,728 instances* and *7 categorical attributes*, created from a hierarchical decision model.  

| *Feature* | *Description* | *Values* |
|------------|---------------|------------|
| *buying* | Buying price | vhigh, high, med, low |
| *maint* | Maintenance cost | vhigh, high, med, low |
| *doors* | Number of doors | 2, 3, 4, 5more |
| *persons* | Persons capacity | 2, 4, more |
| *lug_boot* | Luggage boot space | small, med, big |
| *safety* | Safety level | low, med, high |
| *class* | Acceptability | unacc, acc, good, vgood |

## Files and Descriptions  

### **1. car_evaluation.csv**  
- *Dataset* containing categorical car evaluation attributes.

### **2. exploratory_analysis.R** ([Code](exploratory_analysis.R))  
- **EDA using ggplot2**:  
  - Analyzes *safety, buying price, maintenance, doors, persons, and luggage boot space* against *class*.  
  - Generates *bar plots* to visualize trends.  
  - *Key Findings:*  
    - Low safety is *strongly associated with rejection*.  
    - Cars with *higher capacity (4+ persons)* have higher acceptability.  
    - Cars with *low and medium maintenance costs* have better acceptance.

### **3. decisiontree.r** ([Code](decisiontree.r))  
- *Implements a Decision Tree Model* using rpart.  
- *Methodology:*  
  - Splits data *80% (train) / 20% (test)*.  
  - Evaluates using a *confusion matrix & accuracy score*.  
  - Visualizes decision tree using rpart.plot.  
- *Key Findings:*  
  - The *root node (most important feature)* is *safety*.  
  - *Persons capacity* is the second most influential factor.  
  - *Decision Tree Accuracy:* ~ *85%*  

### **4. randomforest.r** ([Code](randomforest.r))  
- *Implements a Random Forest Model* using randomForest.  
- *Methodology:*  
  - Uses *500 decision trees* for higher accuracy.  
  - Computes *variable importance* via *Mean Decrease Gini Index*.  
- *Key Findings:*  
  - *Top 3 most influential factors:*  
    1. *Safety*  
    2. *Persons capacity*  
    3. *Buying price*  
  - *Random Forest Accuracy:* ~ *92%*  
  - *Random Forest outperforms Decision Tree due to ensemble learning.*

### **5. researchquestion.r** ([Code](researchquestion.r))  
- Investigates *three research questions* using probability calculations and visualizations.  
- *Findings:*  
  1. *Most Influential Features Affecting Car Evaluation:*  
     - Safety and Persons are the *strongest predictors* of acceptability.  
  2. *Relationship Between Price and Safety:*  
     - Higher-priced cars *do not always have better safety*.  
  3. *Impact of Luggage Boot Size on Buying Preferences:*  
     - *Small luggage boot space cars are mostly rejected*.  
     - Cars with *medium and big luggage boot space* have higher acceptability.

### **6. Final project written paper.pdf** ([Report](Final project written paper.pdf))  
- *Comprehensive project report* covering methodology, results, and conclusions.  
- *Key topics:*  
  - Data source and preprocessing.  
  - Exploratory data analysis findings.  
  - Model training and evaluation.  
  - Research question analysis.

## Software & Libraries Used  
- *R Programming*  
- *Libraries:*  
  - ggplot2 - Data visualization  
  - dplyr - Data manipulation  
  - rpart, rpart.plot - Decision Tree Model & visualization  
  - randomForest - Random Forest Model  
  - caret - Model training & evaluation  

## Conclusion & Future Work  
### *Key Findings:*  
- *Safety* and *Persons Capacity* are the most critical factors in car acceptability.  
- *High maintenance costs & high buying price cars are often rejected.*  
- *Luggage boot space impacts buying preferences, with small boot space cars being less accepted.*  

### *Future Work:*  
- Use *real-time data* instead of a pre-defined hierarchical model.  
- Extend analysis with *other machine learning models*.  
- Test *deep learning models* for improved accuracy.  
