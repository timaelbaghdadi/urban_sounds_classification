function [features_extracted, features_mfcc]= ExtractionFeatures(data)

features_extracted = zeros(1,14);
features_mfcc = zeros(13,1);

    %Obtain the sound from the audio
    audio = miraudio(data);

     %Extract the feature Tempo    
     if isempty(mirgetdata(mirtempo(audio)))==1
         features_extracted(1,1) = NaN;
     else
        features_extracted(1,1) = mirgetdata(mirtempo(audio));
     end
    
    %Extract the feature zero Crossing Rate
    features_extracted(1,2) = mirgetdata(mirzerocross(audio));
    
    %Extract the feature Spectral Centroid
    features_extracted(1,3) = mirgetdata( mircentroid(audio));
    
    %Extract the feature Spectral Rollof
    features_extracted(1,4) = mirgetdata( mirrolloff(audio));
    
    %Extract the feature Spectral Flatness
    features_extracted(1,5) = mirgetdata(mirflatness(audio));
    
    %Extract the feature mirskewness
    features_extracted(1,6) = mirgetdata(mirskewness(audio));
   
    %Extract the feature Sepctral Entroypy
    features_extracted(1,7) = mirgetdata(mirentropy(audio));
    
    %Extract the features Kurtosis
    features_extracted(1,8) = mirgetdata(mirkurtosis(audio));
    
    %Extract the mirhcdf: Tonal centroids
    if isempty(mirgetdata(mirtonalcentroid(audio)))==1
         features_extracted(1,9:14) = NaN;
     else
        features_extracted(1,9:14) = mirgetdata(mirtonalcentroid(audio));
    end
    
    %Extract the mfcc
    features_mfcc = mirgetdata(mirmfcc(audio));
end