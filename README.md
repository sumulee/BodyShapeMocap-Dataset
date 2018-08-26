# BodyShapeMocap-Dataset
One motion capture dataset with human body scans. Aim at learning human motion in PFNN.  
People in different proportion move differently. Many properties can lead to this phenomenon, such as mass, moment of inertia, amount of muscles, bone length, moving style, etc. This project is focusing on learning how those variations inﬂuence the ways of moving by using the data captured from the lab. These data contains two parts: motion capture data and 3D body scanning data. Since neural networks are widely used to ﬁgure out the relationship between different set of data,a novel machine learning technique called phase-functioned neural network (PFNN) will be implemented to learn the particular manner in human motion.  

## Achievements
212 minutes of motion recording.  
More than 0.7 million frames.  
17 body scans from 17 participants.  
![](https://github.com/sumulee/BodyShapeMocap-Dataset/raw/master/Images/tab1.png)  
Compare BodyShapeMocap dataset with another three major mocap datasets.  
![](https://github.com/sumulee/BodyShapeMocap-Dataset/raw/master/Images/tab1.png)  
Details of Mocap dataset.

## Devices
Mocap devices: 17 MTw Awinda wireless motion trackers   
Body scan devices: Kinect for Xbox One

## Data-precessing
Mocap: recording selection, motion labelling, phase labelling and trajectory labelling  
Body scan: rotation, scalling and removing obstacles  

## Code source
PFNN: [PFNN](https://github.com/sebastianstarke/AI4Animation/tree/master/TensorFlow/SIGGRAPH_2017)
Unity: [Demo](https://github.com/sebastianstarke/AI4Animation/tree/master/AI4Animation/Assets)
