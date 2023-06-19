# Calorie_Tracking_App

This app is a Food Calorie Tracking application developed using Flutter. 

## Object Detection 

The Object detection model used in this app is MobileNet SSD v2 trained on 15 different food classes. The model is added to the application using the TensorFlow Lite library which helps in deploying machine learning models on edge devices. 

Note: The TensorFlow Lite library for flutter was deprecated, so some native java code was inegrated. 
## Weight Estimation

The weight estimation process in this app is based on restricting the user to take a photo 25cm away from the surface that contains the food item. The distance restriction will help in identifying the difference in sizes based on the bounding box size. The volume of the object is caculated using the bounding box dimensions based on the item shape. The density of the detected object is multipied by the volume to calculate the weight and estimate the calories.

## App Demo
![](https://github.com/Noureldin17/Calorie_Tracking_App/blob/_backup/fitness_app/assets/App%20Demo.gif)
