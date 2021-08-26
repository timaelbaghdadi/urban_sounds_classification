function [score_train, score_test] = pca_features(features_train, target_train, features_test, target_test)

%Join the features and the dargets
A=[features_train; features_test];

%Calculate the numbers of features necessary to explain the data
C = cov(A);
e = sort(eig(C), 'descend');
figure()
plot(cumsum(e)/sum(e)); %increasing the value of features you preserve more data
xlabel('nº of principal components');
ylabel('Ratio of preservation of the data');

%It is needded 3 components to explain the 95% the information
[coeff,score,latent] = pca(A,'NumComponents', 3); 

%Return the new data applyed MPC
score_train = score(1:size(features_train, 1), :);
score_test = score(size(features_train, 1)+1:end, :);

% plot PCA 
% figure()
% subplot(3, 1, 1)
% scatter(score(:,1), score(:,2) )
% scatter(score(:,1), score(:,2), 20, [target_train; target_test], 'filled');
% colorbar;
% xlabel('PC1')
% ylabel('PC2')
% title('PCA with 2 components')
% subplot(3, 1, 2)
% scatter(score(:,2), score(:,3) )
% scatter(score(:,2), score(:,3), 20, [target_train; target_test], 'filled');
% colorbar;
% xlabel('PC2')
% ylabel('PC3')
% subplot(3, 1, 3)
% scatter(score(:,3), score(:,1) )
% scatter(score(:,3), score(:,1), 20, [target_train; target_test], 'filled');
% colorbar;
% xlabel('PC3')
% ylabel('PC1')
end