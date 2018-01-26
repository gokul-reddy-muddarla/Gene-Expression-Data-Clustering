function C=corrDist(pts1,pts2)

X = pts1 - repmat(mean(pts1,2),1,size(pts1,2));
Y = pts2 - repmat(mean(pts2,2),1,size(pts2,2));


Xnorm = sqrt(sum(X.^2, 2));
Ynorm = sqrt(sum(Y.^2, 2));

a = (X * Y') ;
b = Xnorm * Ynorm';

C=1 - a./b;