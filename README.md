# COMOTO_Recognition

# Lab setup
Azure DSVM, https://azure.microsoft.com/en-us/services/virtual-machines/data-science-virtual-machines/

## How to connect
SSH, https://www.ssh.com/academy/ssh/command
1. Find cert (under Dropbox\COMOTO\AI\***.pem)
2. Get IP address (Dynamic, check with Leiquan from wechat group)

# DeepLabV3+ model files
Under models/research/deeplab/

# Training sets
Under test_sets/segtest

# Labeling
Labelme, https://github.com/wkentaro/labelme

## Training sets preparation
1. RAW images are under test_sets/segtest/JPEGImages
2. Mask images are under test_sets/segtest/SegmentationClassRaw 
3. Training/validation segmentation files are under test_sets/segtest/Segmentation
4. Replace all above three training resources with your labeled traning sets
4. Run script prepare_trainsets.sh

# Training sets registration
1. Need to replace files in model (a tricky way to manage git submodules)
2. Under replacement/
3. Replace train_utils.py in models/research/deeplab/utils/
4. Replace segmentation_dataset.py in models/research/deeplab/deprecated/ 

# Environment config
1. Navigate in models to models/research
2. Run command: export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim

# Training steps
1. Download initial model xception65_cityscapes_trainfine from https://github.com/tensorflow/models/blob/master/research/deeplab/g3doc/model_zoo.md
2. Put the initial model under test_sets/
3. Modify train_script to point correct initial model (optional)

Execute train_script.sh

# Visualization result
Execute vis_script.sh

# Training instruction
https://blog.csdn.net/jairana/article/details/83900226
