function [prediction, A, puntuation, accuracy, Mdl] = SVM_complete(features_train, target_train, features_test, target_test)

%Create a model for every class by the training and testing set 
prediction= zeros(length(features_test), 10);
puntuation= [];
y_train = -1*ones(length(target_train),10);
y_test = -1*ones(length(target_test),10);
for i=0:9
    [row,col] = find(target_train==i);
    y_train(row,i+1) = 1;
end
for i=0:9
    [row,col] = find(target_test==i);
    y_test(row,i+1) = 1;
end

for i=0:9

   %It is used the Cross validation
   c = cvpartition(y_train(:,i+1), 'k', 5);
      
   %Select the optimizer to optimize the parameters
   opts = struct('Optimizer','bayesopt','ShowPlots',true,'CVPartition',c,...
    'AcquisitionFunctionName','expected-improvement-plus');

   %Generate the model for each class
    Mdl = fitcsvm(features_train, y_train(:,i+1),'KernelFunction','rbf',...
    'OptimizeHyperparameters','auto','HyperparameterOptimizationOptions',opts);

   %Test the model
   [prediction(:,i+1), scores] = predict(Mdl, features_test);
    
   %Save the score of the prediction
   puntuation = [puntuation scores];
   
   %obtain the class from the binary classification
   A= 10*ones(size(prediction,1),1);
   [x y] = find(prediction ==1);
   A(x,1)= y-1;

   %Clculate the accuracy of the svm models
   accuracy = sum(A == target_test)/numel(target_test);
   
 figure();
 subplot(2, 1, 1)
 hgscatter = gscatter(features_train(:,1), features_train(:,2), y_train(:,i+1));
 xlabel('Feature 1')
 ylabel('Feature 2')
 hold on;
 h_sv = plot(Mdl.SupportVectors(:,1), Mdl.SupportVectors(:,2), 'ko', 'markersize', 8);
 subplot(2, 1, 2)
 hgscatter = gscatter(features_test(:,1), features_test(:,2), y_test(:,i+1));
 xlabel('Feature 1')
 ylabel('Feature 2')
 hold on;
 h_sv = plot(Mdl.SupportVectors(:,1), Mdl.SupportVectors(:,2), 'ko', 'markersize', 8);
 title('Comparison between the training set and the validation')
 
 figure();
 subplot(2, 1, 1)
 hgscatter = gscatter(features_train(:,2), features_train(:,3), y_train(:,i+1));
 xlabel('Feature 2')
 ylabel('Feature 3')
 hold on;
 h_sv = plot(Mdl.SupportVectors(:,2), Mdl.SupportVectors(:,3), 'ko', 'markersize', 8);
 subplot(2, 1, 2)
 hgscatter = gscatter(features_test(:,2), features_test(:,3), y_test(:,i+1));
 xlabel('Feature 2')
 ylabel('Feature 3')
 hold on;
 h_sv = plot(Mdl.SupportVectors(:,2), Mdl.SupportVectors(:,3), 'ko', 'markersize', 8);
 title('Comparison between the training set and the validation')
end

%Create a confusion matrix
C = confusionmat(target_test,A);
confusionchart(C);
end