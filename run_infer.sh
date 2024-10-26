#!/bin/bash

# 実行する回数を設定する
for i in {1..22}; do
  echo "Running iteration $i..."

  # 実行するPythonコマンド
  python3 run_infer.py --gpu='0' \
    --nr_types=6 \
    --type_info_path=type_info.json \
    --batch_size=48 \   # 例として batch_size を変化させる
    --start_index=(i-1)*500 \
    --model_mode=fast \
    --model_path=/home/takagi/program/hover_net/weights/hovernet_fast_pannuke_type_tf2pytorch.tar \
    --nr_inference_workers=8 \
    --nr_post_proc_workers=16 \
    tile \
    --input_dir=/home/takagi/data/iga/roi/img \
    --output_dir=/home/takagi/data/iga/hover_net/roi_original/pannuke \  # 出力先を変化させる
    --mem_usage=0.1 \
    --draw_dot \
    --save_qupath

  echo "Iteration $i finished."
done
