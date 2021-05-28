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
mkdir -p "${INIT_FOLDER}"
mkdir -p "${TRAIN_LOGDIR}"
mkdir -p "${EVAL_LOGDIR}"
mkdir -p "${VIS_LOGDIR}"
mkdir -p "${EXPORT_DIR}"
 
 
SEG_DATASET="${DATASET_DIR}/tfrecord"
 
# Train 10 iterations.
NUM_ITERATIONS=500
python /home/comotoUser/models/research/deeplab/train.py \
	  --logtostderr \
	    --train_split="train" \
	      --model_variant="xception_65" \
	        --atrous_rates=6 \
		  --atrous_rates=12 \
		    --atrous_rates=18 \
		      --output_stride=16 \
		        --decoder_output_stride=4 \
			  --train_crop_size='1500,1500' \
			      --train_batch_size=1 \
			        --training_number_of_steps="${NUM_ITERATIONS}" \
				  --fine_tune_batch_norm=true \
				    --dataset="segtest" \
				      --tf_initial_checkpoint="${CURRENT_DIR}/deeplabv3_cityscapes_train/model.ckpt.index" \
				        --train_logdir="${TRAIN_LOGDIR}" \
					  --dataset_dir="${SEG_DATASET}" \
					    --initialize_last_layer=False \
					      --last_layers_contain_logits_only=True
