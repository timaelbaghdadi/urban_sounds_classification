function [accuracy1,accuracy2, accuracy3, accuracy4, accuracy5, accuracy6,...
 accuracy7, accuracy8,accuracy9, accuracy10, accuracy11, accuracy12,...
 net1 ,  net2,  net3,  net4,  net5,  net6,  net7,  net8, net9,  net10,...
 net11,  net12, classes1, classes2, classes3, classes4, classes5,...
 classes6, classes7, classes8, classes9, classes10, classes11, classes12] = ...
 NN_complete(features_train, target_train, features_test, target_test)

%Add 1 to classes to avoid the index 0
target_train= target_train+1;

%Convert the nº of classes fo vectors.
target_train = ind2vec((target_train).');

% Create a Fitting Network
hiddenSizes= [10, 10, 10];
net1= fitnet(hiddenSizes,'trainlm');
net2= fitnet(hiddenSizes,'trainbr');
net3= fitnet(hiddenSizes,'trainbfg');
net4= fitnet(hiddenSizes,'trainrp');
net5= fitnet(hiddenSizes,'trainscg');
net6= fitnet(hiddenSizes,'traincgb');
net7= fitnet(hiddenSizes,'traincgf');
net8= fitnet(hiddenSizes,'traincgp');
net9= fitnet(hiddenSizes,'trainoss');
net10= fitnet(hiddenSizes,'traingdx');
net11= fitnet(hiddenSizes,'traingdm');
net11.trainParam.epochs= 10000;
net11.trainParam.mc= 0.1;
net11.trainParam.lr = 0.0001;
net12= fitnet(hiddenSizes,'traingd');

% Train the Network
net1 = train(net1,features_train',target_train);
net2 = train(net2,features_train',target_train);
net3 = train(net3,features_train',target_train);
net4 = train(net4,features_train',target_train);
net5 = train(net5,features_train',target_train);
net6 = train(net6,features_train',target_train);
net7 = train(net7,features_train',target_train);
net8 = train(net8,features_train',target_train);
net9 = train(net9,features_train',target_train);
net10 = train(net10,features_train',target_train);
net11 = train(net11,features_train',target_train);
net12 = train(net12,features_train',target_train);

%Predictions with the validation data
y1=net1(features_test');
y2=net2(features_test');
y3=net3(features_test');
y4=net4(features_test');
y5=net5(features_test');
y6=net6(features_test');
y7=net7(features_test');
y8=net8(features_test');
y9=net9(features_test');
y10=net10(features_test');
y11=net11(features_test');
y12=net12(features_test');

%Performance
%Vector the vector to classes
classes1 = vec2ind(y1) -1;
classes2 = vec2ind(y2) -1;
classes3 = vec2ind(y3) -1;
classes4 = vec2ind(y4) -1;
classes5 = vec2ind(y5) -1;
classes6 = vec2ind(y6) -1;
classes7 = vec2ind(y7) -1;
classes8 = vec2ind(y8) -1;
classes9 = vec2ind(y9) -1;
classes10 = vec2ind(y10) -1;
classes11 = vec2ind(y11) -1;
classes12 = vec2ind(y12) -1;

%Calculate the accuracy
accuracy1 = sum(classes1 == target_test')/numel(target_test);
accuracy2 = sum(classes2 == target_test')/numel(target_test);
accuracy3 = sum(classes3 == target_test')/numel(target_test);
accuracy4 = sum(classes4 == target_test')/numel(target_test);
accuracy5 = sum(classes5 == target_test')/numel(target_test);
accuracy6 = sum(classes6 == target_test')/numel(target_test);
accuracy7 = sum(classes7 == target_test')/numel(target_test);
accuracy8 = sum(classes8 == target_test')/numel(target_test);
accuracy9 = sum(classes9 == target_test')/numel(target_test);
accuracy10 = sum(classes10 == target_test')/numel(target_test);
accuracy11 = sum(classes11 == target_test')/numel(target_test);
accuracy12 = sum(classes12 == target_test')/numel(target_test);

end
        
        