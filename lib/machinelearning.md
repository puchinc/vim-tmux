
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
