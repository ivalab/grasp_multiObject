# grasp_multiObject

Robotic grasp dataset for multi-object multi-grasp evaluation with RGB-D data.   
This dataset is annotated using the same protocal as [Cornell Dataset](http://pr.cs.cornell.edu/grasping/rect_data/data.php), and can be used as multi-object extension of Cornell Dataset.  

<p align="center">
<img src="https://github.com/ivalab/grasp_multiObject_multiGrasp/blob/master/fig/ivalab_dataset.png" alt="drawing" width="300"/>
</p>

------------------------------

## Usage
Download [RGB-D data](https://www.dropbox.com/s/hrox34p9ymw8jv7/rgbd.tar.gz?dl=0) and put into `grasp_multiObject/rgbd/`  

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
git clone https://github.com/ivalab/grasp_annotation_tool
```

you can annotate grasps on your own data with this simple tool!  
Both dataset and annotation tool can also be found [here](https://www.dropbox.com/s/cwko0qubmqoxehb/multiObj_multiGrasp.tar.gz?dl=0)


## Citation
If you find it helpful for your research, please consider citing:

    @inproceedings{chu2018deep,
      title = {Real-World Multiobject, Multigrasp Detection},
      author = {F. Chu and R. Xu and P. A. Vela},
      journal = {IEEE Robotics and Automation Letters},
      year = {2018},
      volume = {3},
      number = {4},
      pages = {3355-3362},
      DOI = {10.1109/LRA.2018.2852777},
      ISSN = {2377-3766},
      month = {Oct}
    }


If you encounter any questions, please contact me at fujenchu[at]gatech[dot]edu


