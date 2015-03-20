# getting-and-cleaning-data
Repository for submitting project deliverables for Coursera Data Science uni: Getting and Cleaning Data project.

Objectives of this study
	This study has the primary objective of obtaining the UCI Machine learning dataset from a secondary source
	related to the Coursera course unit and processing this data via an R script named run_analysis.R to obtain
	an output tidy data set.

	The secondary objectives of this study are to apply the learnings from the Coursera Data Science specialisation
	in particular the module Getting and Cleaning Data, to document the study and to make the work from the study
	available for assessment in a Github repository in a way that enables the study and its results to be reproducible.


The raw data set:
	The raw data set was generated in a study by:

	Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. ReyesOrtiz.
	A Public Domain Dataset for Human Activity Recognition Using Smartphones. 
	21th European Symposium on Artificial Neural Networks, Computational Intelligence and 
	Machine Learning, ESANN 2013. Bruges, Belgium 2426 April 2013.

	The raw data set with a detailed codebook about the data is available from:

	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
	https://archive.ics.uci.edu/ml/machinelearningdatabases/00240/UCI HAR Dataset.names

	The raw data set used for this study was downloaded from the link:
		https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

	The raw data set used for this study unzips into a created root directory and sub-directories. If
	the root directory is in the working directory of the processing script then the script takes care
	of locating all its inputs at the appropriate sub-directories.

	Details about the measurment platform, the Samsung Galaxy SII, can be found at the following link:
		http://global.samsungtomorrow.com/what-you-may-not-know-about-galaxy-s4-innovative-techonology/
	
	Details about the measurement units are from the link:https://archive.ics.uci.edu/ml/machinelearningdatabases/
		00240/UCI%20HAR%20Dataset.names

	Units of measurement for acceleration are g (ie standard units of gravity) and rotational movement are in 
		radians per second. 

The processing script:

	The processing script is: run_analysis.R
	Instructions for downloading and unzipping the input raw data are given in 
	the processing script header.

Summary Choices:
	The processing script:
		- ignores the inertial data files. 
		- retains all values of the feature vectors which are a mean or a
			standard deviation value. This results in 88 variables.
		- merges the training and test data of the features vectors.
		- groups the feature data by subject and activity and then
			calculates the mean value of each variable for these groups.

The tidy data set:
	The tidy data set has an 88 variable Mean Feature Vector for each subject and
	activity of the subject. The Code Book below details the variables.

The experimental study used
	This study performed only data gathering, cleaning and tidying as per the requirements
	of the project for the Coursera Data Science module "Getting and Cleaning Data".
	Thus the study relied on the experimental method of the seminal study of Anguita et al which 
	generated a raw data set (the inertial signals) and a processed set (the features vectors).

Study Design
	The original study design that gathered the input data for this is detailed at the UCI
	Machine Learning Laboratory link given above. This study used a source of this data from
	the secondary (cloudfront) source given above to perform data download, unzip, cleaning,
	tidying and output.

Code Book
	The tidy data set contains the following variables:

	Var No	Variable     				Units 		Description

	1	subject				index number	A unique index number for each of the 30 human subjects.
	2	activity			category label	A category label for the activity of the subject during the measurement period.
	3	tBodyAccmeanX			g 		Mean of Feature Vector variable tBodyAcc-mean()-X
	4	tBodyAccmeanY			g		Mean of Feature Vector variable tBodyAcc-mean()-Y
	5	tBodyAccmeanZ			g		Mean of Feature Vector variable tBodyAcc-mean()-Z
	6	tBodyAccstdX			g		Mean of Feature Vector variable tBodyAcc-std()-X
	7	tBodyAccstdY			g		Mean of Feature Vector variable tBodyAcc-std()-Y
	8	tBodyAccstdZ			g		Mean of Feature Vector variable tBodyAcc-std()-Z
	9	tGravityAccmeanX		g		Mean of Feature Vector variable tGravityAcc-mean()-X
	10	tGravityAccmeanY		g		Mean of Feature Vector variable tGravityAcc-mean()-Y
	11	tGravityAccmeanZ		g		Mean of Feature Vector variable tGravityAcc-mean()-Z
	12	tGravityAccstdX			g		Mean of Feature Vector variable tGravityAcc-std()-X
	13	tGravityAccstdY			g		Mean of Feature Vector variable tGravityAcc-std()-Y
	14	tGravityAccstdZ			g		Mean of Feature Vector variable tGravityAcc-std()-Z
	15	tBodyAccJerkmeanX		g		Mean of Feature Vector variable tBodyAccJerk-mean()-X
	16	tBodyAccJerkmeanY		g		Mean of Feature Vector variable tBodyAccJerk-mean()-Y
	17	tBodyAccJerkmeanZ		g		Mean of Feature Vector variable tBodyAccJerk-mean()-Z
	18	tBodyAccJerkstdX		g		Mean of Feature Vector variable tBodyAccJerk-std()-X
	19	tBodyAccJerkstdY		g		Mean of Feature Vector variable tBodyAccJerk-std()-Y
	20	tBodyAccJerkstdZ		g		Mean of Feature Vector variable tBodyAccJerk-std()-Z
	21	tBodyGyromeanX			rad/s		Mean of Feature Vector variable tBodyGyro-mean()-X
	22	tBodyGyromeanY			rad/s		Mean of Feature Vector variable tBodyGyro-mean()-Y
	23	tBodyGyromeanZ			rad/s		Mean of Feature Vector variable tBodyGyro-mean()-Z
	24	tBodyGyrostdX			rad/s		Mean of Feature Vector variable tBodyGyro-std()-X
	25	tBodyGyrostdY			rad/s		Mean of Feature Vector variable tBodyGyro-std()-Y
	26	tBodyGyrostdZ			rad/s		Mean of Feature Vector variable tBodyGyro-std()-Z
	27	tBodyGyroJerkmeanX		rad/s		Mean of Feature Vector variable tBodyGyroJerk-mean()-X
	28	tBodyGyroJerkmeanY		rad/s		Mean of Feature Vector variable tBodyGyroJerk-mean()-Y
	29	tBodyGyroJerkmeanZ		rad/s		Mean of Feature Vector variable tBodyGyroJerk-mean()-Z
	30	tBodyGyroJerkstdX		rad/s		Mean of Feature Vector variable tBodyGyroJerk-std()-X
	31	tBodyGyroJerkstdY		rad/s		Mean of Feature Vector variable tBodyGyroJerk-std()-Y
	32	tBodyGyroJerkstdZ		rad/s		Mean of Feature Vector variable tBodyGyroJerk-std()-Z
	33	tBodyAccMagmean			g		Mean of Feature Vector variable tBodyAccMag-mean()
	34	tBodyAccMagstd			g		Mean of Feature Vector variable tBodyAccMag-std()
	35	tGravityAccMagmean		g		Mean of Feature Vector variable tGravityAccMag-mean()
	36	tGravityAccMagstd		g		Mean of Feature Vector variable tGravityAccMag-std()
	37	tBodyAccJerkMagmean		g		Mean of Feature Vector variable tBodyAccJerkMag-mean()
	38	tBodyAccJerkMagstd		g		Mean of Feature Vector variable tBodyAccJerkMag-std()
	39	tBodyGyroMagmean		rad/s		Mean of Feature Vector variable tBodyGyroMag-mean()
	40	tBodyGyroMagstd			rad/s		Mean of Feature Vector variable tBodyGyroMag-std()
	41	tBodyGyroJerkMagmean		rad/s		Mean of Feature Vector variable tBodyGyroJerkMag-mean()
	42	tBodyGyroJerkMagstd		rad/s		Mean of Feature Vector variable tBodyGyroJerkMag-std()
	43	fBodyAccmeanX			g		Mean of Feature Vector variable fBodyAcc-mean()-X
	44	fBodyAccmeanY			g		Mean of Feature Vector variable fBodyAcc-mean()-Y
	45	fBodyAccmeanZ			g		Mean of Feature Vector variable fBodyAcc-mean()-Z
	46	fBodyAccstdX			g		Mean of Feature Vector variable fBodyAcc-std()-X
	47	fBodyAccstdY			g		Mean of Feature Vector variable fBodyAcc-std()-Y
	48	fBodyAccstdZ			g		Mean of Feature Vector variable fBodyAcc-std()-Z
	49	fBodyAccmeanFreqX		Hz		Mean of Feature Vector variable fBodyAcc-meanFreq()-X
	50	fBodyAccmeanFreqY		Hz		Mean of Feature Vector variable fBodyAcc-meanFreq()-Y
	51	fBodyAccmeanFreqZ		Hz		Mean of Feature Vector variable fBodyAcc-meanFreq()-Z
	52	fBodyAccJerkmeanX		g		Mean of Feature Vector variable fBodyAccJerk-mean()-X
	53	fBodyAccJerkmeanY		g		Mean of Feature Vector variable fBodyAccJerk-mean()-Y
	54	fBodyAccJerkmeanZ		g		Mean of Feature Vector variable fBodyAccJerk-mean()-Z
	55	fBodyAccJerkstdX		g		Mean of Feature Vector variable fBodyAccJerk-std()-X
	56	fBodyAccJerkstdY		g		Mean of Feature Vector variable fBodyAccJerk-std()-Y
	57	fBodyAccJerkstdZ		g		Mean of Feature Vector variable fBodyAccJerk-std()-Z
	58	fBodyAccJerkmeanFreqX		Hz		Mean of Feature Vector variable fBodyAccJerk-meanFreq()-X
	59	fBodyAccJerkmeanFreqY		Hz		Mean of Feature Vector variable fBodyAccJerk-meanFreq()-Y
	60	fBodyAccJerkmeanFreqZ		Hz		Mean of Feature Vector variable fBodyAccJerk-meanFreq()-Z
	61	fBodyGyromeanX			rad/s		Mean of Feature Vector variable fBodyGyro-mean()-X
	62	fBodyGyromeanY			rad/s		Mean of Feature Vector variable fBodyGyro-mean()-Y
	63	fBodyGyromeanZ			rad/s		Mean of Feature Vector variable fBodyGyro-mean()-Z
	64	fBodyGyrostdX			rad/s		Mean of Feature Vector variable fBodyGyro-std()-X
	65	fBodyGyrostdY			rad/s		Mean of Feature Vector variable fBodyGyro-std()-Y
	66	fBodyGyrostdZ			rad/s		Mean of Feature Vector variable fBodyGyro-std()-Z
	67	fBodyGyromeanFreqX		Hz		Mean of Feature Vector variable fBodyGyro-meanFreq()-X
	68	fBodyGyromeanFreqY		Hz		Mean of Feature Vector variable fBodyGyro-meanFreq()-Y
	69	fBodyGyromeanFreqZ		Hz		Mean of Feature Vector variable fBodyGyro-meanFreq()-Z
	70	fBodyAccMagmean			g		Mean of Feature Vector variable fBodyAccMag-mean()
	71	fBodyAccMagstd			g		Mean of Feature Vector variable fBodyAccMag-std()
	72	fBodyAccMagmeanFreq		Hz		Mean of Feature Vector variable fBodyAccMag-meanFreq()
	73	fBodyBodyAccJerkMagmean		g		Mean of Feature Vector variable fBodyBodyAccJerkMag-mean()
	74	fBodyBodyAccJerkMagstd		g		Mean of Feature Vector variable fBodyBodyAccJerkMag-std()
	75	fBodyBodyAccJerkMagmeanFreq	Hz		Mean of Feature Vector variable fBodyBodyAccJerkMag-meanFreq()
	76	fBodyBodyGyroMagmean		g		Mean of Feature Vector variable fBodyBodyGyroMag-mean()
	77	fBodyBodyGyroMagstd		g		Mean of Feature Vector variable fBodyBodyGyroMag-std()
	78	fBodyBodyGyroMagmeanFreq	Hz		Mean of Feature Vector variable fBodyBodyGyroMag-meanFreq()
	79	fBodyBodyGyroJerkMagmean	g		Mean of Feature Vector variable fBodyBodyGyroJerkMag-mean()
	80	fBodyBodyGyroJerkMagstd		g		Mean of Feature Vector variable fBodyBodyGyroJerkMag-std()
	81	fBodyBodyGyroJerkMagmeanFreq	Hz		Mean of Feature Vector variable fBodyBodyGyroJerkMag-meanFreq()
	82	angletBodyAccMeangravity	g		Mean of Feature Vector variable angle(tBodyAccMean,gravity)
	83	angletBodyAccJerkMeangravityMeang		Mean of Feature Vector variable angle(tBodyAccJerkMean),gravityMean)
	84	angletBodyGyroMeangravityMean	g		Mean of Feature Vector variable angle(tBodyGyroMean,gravityMean)
	85	angletBodyGyroJerkMeangravityMeang		Mean of Feature Vector variable angle(tBodyGyroJerkMean,gravityMean)
	86	angleXgravityMean		g		Mean of Feature Vector variable angle(X,gravityMean)
	87	angleYgravityMean		g		Mean of Feature Vector variable angle(Y,gravityMean)
	88	angleZgravityMean		g		Mean of Feature Vector variable angle(Z,gravityMean)

The following details about each feature variable was taken from the file "features_info.txt" provided with the Data Science project
instructions.

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

