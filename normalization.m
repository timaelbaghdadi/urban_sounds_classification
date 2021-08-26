function [features_normalized] = normalization(features)

%Treat the tempo because there are NAN, and it will substituted  by the
%mean and normalize it
 
min_l = min(features(:,1));
max_l = max(features(:,1));
 for k=1:size(features,1)
     if (isnan(features(k,1)))
     else
         features(k,1)=  (features(k,1)-min_l)/(max_l);
     end
end

%Treat the other features

for j=2:size(features,2)

    %mean_f = mean(features(:,j));
    min_f =  min(features(:,j));
    max_f =  max(features(:,j));
    
    features(:,j)= (features(:,j)-min_f)/(max_f);   
    
end

features_normalized= features;
end