# Original Dataset
The [Human Activity Recognition Using Smartphones Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) of 6 activities on 30 subjects. Detailed information of the dataset can be found in it.

# Transfomations
A new dataset  combined the train data and set data contains only the mean values (mean) and standard deviation (std) of each measurements is generated.  The entries of "activity" are named more descriptive while in the original dataset are represented b numbers. The variable names are also tranformed so that they can describe themselves. Finally, each measurements values are averaged based on the group of activities and subject and form a tidy data set.


# Variables
"activity"
- The activiy of the test, either of the followings: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

"subject"
- The subject that performed the test, numbers between 1-30

"Time.Space.Body.Linear.Acceleration"
- The body part of the linear acceleration signal in three dimensions (X, Y, Z)

"Time.Space.Gravity.Linear.Acceleration"
- The gravity part of the linear acceleration signal in three dimensions (X, Y, Z)

"Time.Space.Body.Linear.Acceleration.Jerk"
- The body linear acceleration were derived in time to obtain Jerk signals in three dimensions (X, Y, Z)

"Time.Space.Body.Angular.Velocity"
- The angular verlocity signals in three dimensions (X, Y, Z)

"Time.Space.Body.Angular.Velocity.Jerk."
- The angular velocity  were derived in time to obtain Jerk signals in three dimensions (X, Y, Z)

"Time.Space.Body.Linear.Acceleration.Magnitude"
- The magnitude of body linear accelearation signals

"Time.Space.Gravity.Linear.Acceleration.Magnitude"
- The magnitude of gravity linear accelearation signals

"Time.Space.Body.Linear.Acceleration.Jerk.Magnitude"
- The magnitude of body linear accelearation Jerk signals

"Time.Space.Body.Angular.Velocity.Magnitude"
- The magnitude of body agular velocity signals

"Time.Space.Body.Angular.Velocity.Jerk.Magnitude"
- The magnitude of body agular velocity Jerk signals

"Frequency.Space.Body.Linear.Acceleration"
- The Fourier transfom of body linear acceleration signals in three dimensions (X, Y, Z)

"Frequency.Space.Body.Linear.Acceleration.Jerk"
- The Fourier transfom of body linear acceleration Jerk signals in three dimensions (X, Y, Z)

"Frequency.Space.Body.Angular.Velocity"
- The Fourier transfom of body angular velocity signals in three dimensions (X, Y, Z)

"Frequency.Space.Body.Linear.Acceleration.Magnitude"
- The magnitude of the Fourier transform of body linear accelatrion signals

"Frequency.Space.Body.Body.Linear.Acceleration.Jerk.Magnitude"
- The magnitude of the Fourier transform of body linear accelatrion Jerk signals

"Frequency.Space.Body.Body.Angular.Velocity.Magnitude "
- The magnitude of the Fourier transform of body angular velocity signals

"Frequency.Space.Body.Body.Angular.Velocity.Jerk.Magnitude"
- The magnitude of the Fourier transform of body angular velocity Jerk signals




