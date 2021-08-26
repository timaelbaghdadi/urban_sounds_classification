# urban_sounds_classification
This is a university project in which we try to classify the different classes in the UrbanSounds dataset.
The aim of the project is to develop a classifier capable of distinguishing between the several classes that the Urban Sound Dataset has. Prior to that, an exploratory analysis of the data is presented here along with the extraction of the features from the sound sources. The aim is to provide the same set of features to properly classify among all classes. The dataset has 10 different classes and two methods will be used to show that it can be classified as a multiclassification problem or as a binary problem. For the multi classification problem it has used the Neural Net and for the binary problem it has computed the support vector machine. These two methods are presented in the following paper explaining the decisions and the steps that are done. The code1 implemented is made available in a Github repository. As previously explained, The Urban Sound Dataset has 10 different classes and are labeled (in the metadata files)
as:
 0 = air conditioner
 1 = car horn
 2 = children playing
 3 = dog bark
 4 = drilling
 5 = engine idling
 6 = gun shot
 7 = jackhammer
 8 = siren
 9 = street music

The main code is in the file "main." and this file calls the functions to filter the data, treat it, extract the futures, train the Neural Network with 80% of the data and predict the sound with the remaining dataset.

