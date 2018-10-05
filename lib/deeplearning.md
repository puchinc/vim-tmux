""""""""""""
" APPENDIX "
""""""""""""

# Loss Functions
* Cross-Entropy
    L(y, y') = -y * log(y') + (1 - y) * log(1 - y')
             = - ∑ p(y) * log(p(y'))


# Activation Functions
* Sigmoid [0, 1] can lead us to gradient decent problem where the updates are so low.
    A = 1 / (1 + np.exp(-z)) # Where z is the input matrix
* Tahn [-1, 1], tanh activation usually works better than sigmoid activation function for hidden units because the mean of its output is closer to zero, and so it centers the data better for the next layer.
    A = (np.exp(z) - np.exp(-z)) / (np.exp(z) + np.exp(-z))
* RELU = max(0,z) # so if z is negative the slope is 0 and if z is positive the slope remains linear.


# CONVOLUTION NEURAL NETWORK
Advantages:
1. Parameter sharing.
A feature detector (such as a vertical edge detector) that's useful in one part of the image is probably useful in another part of the image.
2. sparsity of connections.
In each layer, each output value depends only on a small number of inputs which makes it translation invariance.

## Padding
The general rule now, if a matrix nxn is convolved with fxf filter/kernel and padding p give us n+2p-f+1,n+2p-f+1 matrix.
* Same input output size: P = (f-1) / 2
* Convolution with stride s: N * N -> (N+2P-F)/S + 1 * (N+2P-F)/S + 1
* p = (n * s - n + f - s) / 2, When s = 1 ==> P = (f-1) / 2

## Pooling
Example of Max pooling on 3D input:
Input: 4x4x10
Max pooling size = 2 and stride = 2
Output: 2x2x10

