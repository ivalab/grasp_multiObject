# grasp_multiObject

Robotic grasp dataset for multi-object multi-grasp evaluation with RGB-D data.   
This dataset is annotated using the same protocal as [Cornell Dataset](http://pr.cs.cornell.edu/grasping/rect_data/data.php), and can be used as multi-object extension of Cornell Dataset.  

------------------------------

## Usage
Download [RGB-D data](www) and put into `grasp_multiObject/rgbd/`  

Each testing data has one RGB image (rgb_xxxx) and one depth image (depth_xxxx).   
The corresponding grasp annotation (rgb_xxxx_annotations) can be found in `grasp_multiObject/annotation/` 

## Generate RG-D data?
```
mkdir rgd
run rgbd2rgd
```

you will have RG-D data in `grasp_multiObject/rgd/`

## Crop images?
```
mkdir rgd_cropped320
mkdir rgb_cropped320
run image2txt
```

you will have cropped RGB and RGD images in `grasp_multiObject/rgd_cropped320/` and `grasp_multiObject/rgb_cropped320/`, respectively.

also, you will have corresponding annotation files, as well as a full list of image path.

## Visualize grasp?
```
run visualizationGripper
```
this file shows a simple example to visualize ground truth grasps


## Annotate your own data?
```
git clone https://github.gatech.edu/fchu9/grasp_annotation_tool
```

you can annotate grasps on your own data with this simple tool!




