%      Sound classification of the UrbanSound8K
% Pattern Recognition and Machine Learning course 2019/2020
%  Authors: David Perez Ruiz, Gerard Franco Panades, Fatima el Baghdadi
%%
close all;
clear all;

%Read the data: https://urbansounddataset.weebly.com/urbansound8k.html
data = readtable("C:\Users\Usuario\Documents\2N_QUATRI\PATTERN RECOGNITION\UrbanSound8K\metadata\UrbanSound8K.csv");
data = table2struct(data);

%Obtain the audio files of the dataset names
features_train = [];
mfcc_train = [];
target_train = [];
for i=1: length(data)
    
    %Read the fold of the selected audio
    n_fold = data(i).fold;
    
    %Read the name of the selected audio
    name = data(i).slice_file_name;
    
    %Select the audio.wav from the directory
    filename =['C:\Users\Usuario\Documents\2N_QUATRI\PATTERN RECOGNITION\UrbanSound8K\audio\fold',...
        int2str(n_fold),'\',name];  
    
    %Extract the features of the audio
    [features_extracted, feature_mfcc] = ExtractionFeatures(filename);
    
    %Store the features in a vector
    features_train = [features_train; features_extracted];
    mfcc_train = [mfcc_train; feature_mfcc'];
        
    %Get the target of the data
    target_train = [target_train; data(i).classID];
end

%Normalize the features of the audios
features_train = normalization(features_train);
mfcc_train = normalization(mfcc_train);

%Delete all the observations that have 'NaN' to avoid problems
[features_train, mfcc_train, target_train] = delete_nan(features_train,...
                                              mfcc_train, target_train);
    
A = [features_train, mfcc_train, target_train];

%Split the data into train and test data
[m,n] = size(A) ;
P = 0.80 ;
idx = randperm(m)  ;
features_train = A(idx(1:round(P*m)),1:end-1) ; 
target_train= A(idx(1:round(P*m)),end:end);
features_test = A(idx(round(P*m)+1:end),1:end-1) ;
target_test= A(idx(round(P*m)+1:end),end:end);


%1st approach with all the features
%Use a neural network to train the model, test it and have a performance
[accuracy1,accuracy2, accuracy3, accuracy4, accuracy5, accuracy6,...
 accuracy7, accuracy8,accuracy9, accuracy10, accuracy11, accuracy12,...
 net1 ,  net2,  net3,  net4,  net5,  net6,  net7,  net8, net9,  net10,...
 net11,  net12, classes1, classes2, classes3, classes4, classes5,...
 classes6, classes7, classes8, classes9, classes10, classes11, classes12] =...
 NN_complete(features_train, target_train, features_test, target_test);

%PCA to reduce the data
[score_train, score_test] = pca_features(features_train, target_train,...
                                         features_test, target_test);

%Obtain the accuracy and performance reducing the data with the same NN
[ac1, ac2, ac3, ac4, ac5, ac6, ac7, ac8, ac9, ac10, ac11, ac12,...
 nt1, nt2, nt3, nt4, nt5, nt6, nt7, nt8, nt9, nt10, nt11, nt12,...
 cl1, cl2, cl3, cl4, cl5, cl6, cl7, cl8, cl9, cl10, cl11, cl12] =...
 NN_complete(score_train, target_train, score_test, target_test);

%Obtain the accuracy and performance with the reduced data using SVM
[pred_svm, pred_num, puntuation, acc, Mdl] = SVM_complete(score_train,...   
                                    target_train, score_test, target_test);
