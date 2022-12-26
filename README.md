# tilemake

## Create Powerpoint slides with DICOM (or NIfTI) images

### you can create tiled images as shown in the figure only with DICOM or NIFTI images.

![0](2022-11-10-22-58-00.png)

Materials: DICOM files (or NIfTI files)

Tools: MRtrix3, FSL, tilemake.sh

* Click here for installation instructions (very famous and useful software for brain image analysis, but beware of its large size)


  * MRtrix3　<https://github.com/MRtrix3/homebrew-mrtrix3>
  * FSL      <https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FslInstallation>

### Prep.

#### Use mrview's screencapture to create  png files of the images you want to put on your slide

1. for DICOM images, convert to NiFTI (use dcm2niix or similar)
1. open the file in mrview
1. view→Toggle all annotations to remove text and crosshair on the screen
1. adjust the image if necessary (intensity, orientation, etc.)
<img src="2022-11-10-21-17-12.png" width="200"><img src="2022-11-10-21-17-51.png" width="200"><img src="2022-11-11%201.24.44.png" width="200">
1. select Tools→Screen capture
2. To synchronize paging through the cross-sectional images (to make them look like a radiologist's viewer), set parameters as shown in the upper right figure. 

    1. Scroll the image to the desired starting position. 
    2. set the box (Z-axis) at the right end of Translate to a value that matches the end position. If you are not sure, set the same value as in the figure and adjust it later. 
    3. In Capture, set Start Index to 0 and Frames to the number of frames you want. 
    4. choose a name for the image in Output's Prefix (T2, DWI, etc., the simpler the better) 
    5. Select the directory where you want to output the images. 
    6. After setting, perform a test play using the triangle button in the lower left corner to adjust the settings. 
    7. if the conditions i-iii are met, the position can be synchronized regardless of the slice thickness.

3. Press record button (red circle) to save as png.
4. when the images you want to put on the slides are collected, the preparation is complete.

### cooking

#### tilemake.sh to create tiled png files

First, download tilemake.sh. Right click and select "Download Linked File".
Assuming ~/imgdir is the directory where you saved the "pre-cooked" png files

```bash
cp ~/Downloads/tilemake.sh ~/imgdir　#copy to imgdir
cd ~/imgdir
chmod 755 tilemake.sh　#make executable
bash tilemake.sh　#run
```

- How many png files per image? >: Specify the number of pngs per type of image you wish to arrange (in the above case, 22).
- Enter the names of the images separated by spaces in the order in which you want them to be arranged > Enter the names of the images you want to arrange separated by spaces
  - Use the prefix the image is saved in ScreenCapture
  - ex) In the case of the sample image: `T2 T1 fMRI b0 DWI FA`
  - Select 2-6 series
- After processing, tiled png files are output in the "tiles" folder.
  



### Finishing touches

#### Put the resulting tiled images into PowerPoint one at a time.

PowerPoint has a photo album feature to import multiple images one at a time, but the Mac version may not have it. In that case, it is easier to use LibreOffice. (You can download it from here <https://ja.libreoffice.org>)
After installation, open a new file and select Insert > Media > Photo Albums to insert one photo at a time. Then save the file in .pptx format and you can copy and paste the entire slide into PowerPoint.

<img src="2022-11-10-21-13-58.png" width="500">
