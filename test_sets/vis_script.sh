CURRENT_DIR=$(pwd)
DATASER_DIR="${CURRENT_DIR}/segtest"

# Set up the working directories.
SEG_FOLDER="mysegtest"
EXP_FOLDER="exp/train_on_trainval_set"
INIT_FOLDER="${DATASET_DIR}/${SEG_FOLDER}/init_models"
TRAIN_LOGDIR="${DATASET_DIR}/${SEG_FOLDER}/${EXP_FOLDER}/train"
EVAL_LOGDIR="${DATASET_DIR}/${SEG_FOLDER}/${EXP_FOLDER}/eval"
VIS_LOGDIR="${DATASET_DIR}/${SEG_FOLDER}/${EXP_FOLDER}/vis"
EXPORT_DIR="${DATASET_DIR}/${SEG_FOLDER}/${EXP_FOLDER}/export"


python /home/comotoUser/models/research/deeplab/vis.py \
        --logtostderr \
        --vis_split="val" \
        --model_variant="xception_65" \
                --atrous_rates=6 \
                --atrous_rates=12 \
                --atrous_rates=18 \
                --output_stride=16 \
                --decoder_output_stride=4 \
                --dataset="segtest" \
                        --vis_crop_size='1500,1500' \
                        --checkpoint_dir="${INIT_FOLDER}" \
                                --vis_logdir="${VIS_LOGDIR}" \
                                --dataset_dir="${DATASER_DIR}/tfrecord" \
                                --max_number_of_iterations=1
