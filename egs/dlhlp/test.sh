#!/bin/bash

. ./path.sh || exit 1;

model_name=ctc_libri-10h_char
ckpt= model/ctc_libri-10h_char/epoch=44-step=3869.ckpt

echo "Stage 4: Test E2E ASR"
mkdir -p model

if [ -z "$ckpt" ]; then
    echo "Error: ckpt must be specified during testing!" || exit 1
else
    run_asr.py \
        --config config/test.yaml \
        --test \
        --ckpt $ckpt
fi

