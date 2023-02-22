#!/bin/bash
#SBATCH -J V2audioGen
#SBATCH -c 40 #number of CPUs needed
#SBATCH --time=48:00:00   

module load gcc6 slurm cmake

#. /alt-asr/shchowdhury/tools/miniconda3/etc/profile.d/conda.sh && conda deactivate && conda activate /jsalt1/exp/wp2/audio_cs_aug/exp1/cs_generated_audio/tmp/dorsaenv_clone


inputlist="/ocean/projects/cis210027p/dzeinali/espnet_cs/egs2/seame/asr1/speechCollage/exp/unigram_improved/text" #input text file 
outdir="/ocean/projects/cis210027p/dzeinali/espnet_cs/egs2/seame/asr1/speechCollage/exp/unigram_improved/audios" #output directory of audios
data="/ocean/projects/cis210027p/dzeinali/espnet_cs/egs2/seame/asr1/speechCollage/exp/unigram_improved/" #where the json files for supervisions and recordings are stored
proc=25
#exp_suffix=$2
#outdir='/jsalt1/exp/wp2/audio_cs_aug/exp1/audio_data_generated_outdir/v2_seame_'$exp_suffix

mkdir -p $outdir

python3 src2/generate_unigram_improved.py \
  --input $inputlist \
  --output $outdir \
  --data $data \
  --process $proc



