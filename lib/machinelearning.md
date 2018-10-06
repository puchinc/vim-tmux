
# Loss
def Hinge(yHat, y): # penalizes predictions y < 1
    return np.max(0, 1 - yHat * y)

# PCA


# Empirical Parameters
* May want to get everything into -1 to +1 range (approximately)
Want to avoid large ranges, small ranges or very different ranges from one another
Rule a thumb regarding acceptable ranges
-3 to +3 is generally fine - any bigger bad
-1/3 to +1/3 is ok - any smaller bad


# Error Metric

## Algorithm predicts some value for class, predicting a value for each example in the test set
* Considering this, classification can be
1. True positive (we guessed 1, it was 1)
2. False positive (we guessed 1, it was 0)
3. True negative (we guessed 0, it was 0)
4. False negative (we guessed 0, it was 1)

## Precision (TP / We Guessed True)
* How often does our algorithm cause a false alarm?
* The higher precision, the smaller false positive
* Of all patients we predicted have cancer, what fraction of them actually have cancer
    * = true positives / # predicted positive
    * = true positives / (true positive + false positive)
* High precision is good (i.e. closer to 1)
* You want a big number, because you want false positive to be as close to 0 as possible

## Recall (TP / Real True)
* How sensitive is our algorithm?
* The higher recall, the smaller false negative
* Of all patients in set that actually have cancer, what fraction did we correctly detect
    * = true positives / # actual positives
    * = true positive / (true positive + false negative)
* High recall is good (i.e. closer to 1)
* You want a big number, because you want false negative to be as close to 0 as possible

## F1Score (fscore)
* 2 * (PR/ [P + R])
* Fscore is like taking the average of precision and recall giving a higher weight to the lower value
Many formulas for computing comparable precision/accuracy values
If P = 0 or R = 0 the Fscore = 0
If P = 1 and R = 1 then Fscore = 1
The remaining values lie between 0 and 1 
