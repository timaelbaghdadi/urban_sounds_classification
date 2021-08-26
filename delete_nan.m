function [features_train, mfcc_train, target_train] = delete_nan(features_train, mfcc_train, target_train)

%Delete the samples that has nan
A= [features_train mfcc_train target_train];
A(any(isnan(A),2),:) = [];

features_train  = A(:,1:size(features_train,2));
mfcc_train = A(:,size(features_train,2)+1:size(features_train,2)+1+size(mfcc_train,2));
target_train = A(:,end:end);

end
