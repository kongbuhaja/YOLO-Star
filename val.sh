log_directory_check(){
    log_dir=$1
    if [ -d "$log_dir" ]; then
        :
    else
        mkdir -p "$log_dir"
    fi
}

start_background_task() {
    echo "Evaluation for $1 has begun."
    nohup python3 val.py --model "$1" > "$2" 2>&1 &
    sleep 5
}

wait_for_completion() {
    while pgrep -f "python3 val.py --model $1" > /dev/null; do
        sleep 10
    done
    echo "Evaluation for $1 has Done.\n"
}

task() {
    start_background_task "$1" "$2"
    wait_for_completion "$1"
}
log_dir="./logs/val"
log_directory_check "$log_dir"

dir='val'
#origin
# task yolov8n.pt ./logs/$dir/yolo8n.log
# task yolov10n.pt ./logs/$dir/yolo10n.log
# task yolo11n.pt ./logs/$dir/yolo11n.log
# task yolo12n.pt ./logs/$dir/yolo12n.log

# task yolo11x.pt ./logs/$dir/yolo11x.log
# task yolo12x.pt ./logs/$dir/yolo12x.log

# #up
# task runs/detect/star2_up-yolo8n_1000/weights/best.pt ./logs/$dir/star2_up-yolo8n_1000.log #old
# task runs/detect/star2_up-yolo10n_1000/weights/best.pt ./logs/$dir/star2_up-yolo10n_1000.log #old
# task runs/detect/star2_up-yolo11n_1000/weights/best.pt ./logs/$dir/star2_up-yolo11n_1000.log
# task runs/detect/star2_up-yolo12n_1000/weights/best.pt ./logs/$dir/star2_up-yolo12n_1000.log #old
#du
## task runs/detect/star2_du-yolo8n_1000/weights/best.pt ./logs/$dir/star2_du-yolo8n_1000.log
## task runs/detect/star2_du-yolo10n_1000/weights/best.pt ./logs/$dir/star2_du-yolo10n_1000.log
# task runs/detect/star2_du-yolo11n_1000/weights/best.pt ./logs/$dir/star2_du-yolo11n_1000.log
## task runs/detect/star2_du-yolo12n_1000/weights/best.pt ./logs/$dir/star2_du-yolo12n_1000.log
#ud
## task runs/detect/star2_ud-yolo8n_1000/weights/best.pt ./logs/$dir/star2_ud-yolo8n_1000.log
## task runs/detect/star2_ud-yolo10n_1000/weights/best.pt ./logs/$dir/star2_ud-yolo10n_1000.log
# task runs/detect/star2_ud-yolo11n_1000/weights/best.pt ./logs/$dir/star2_ud-yolo11n_1000.log
## task runs/detect/star2_ud-yolo12n_1000/weights/best.pt ./logs/$dir/star2_ud-yolo12n_1000.log
#down
## task runs/detect/star2_down-yolo8n_1000/weights/best.pt ./logs/$dir/star2_down-yolo8n_1000.log
## task runs/detect/star2_down-yolo10n_1000/weights/best.pt ./logs/$dir/star2_down-yolo10n_1000.log
# task runs/detect/star2_down-yolo11n_1000/weights/best.pt ./logs/$dir/star2_down-yolo11n_1000.log
## task runs/detect/star2_down-yolo12n_1000/weights/best.pt ./logs/$dir/star2_down-yolo12n_1000.log
#epoch

# task runs/detect/star2_up-yolo12n_800/weights/best.pt ./logs/$dir/star2_up-yolo12n_800.log

# task runs/detect/star2_up-yolo11n_500/weights/best.pt ./logs/$dir/star2_up-yolo11n_500.log #old

# task runs/detect/star2_du-yolo11n_600/weights/best.pt ./logs/$dir/star2_du-yolo11n_600.log
# task runs/detect/star2_du-yolo11n_800/weights/best.pt ./logs/$dir/star2_du-yolo11n_800.log
# task runs/detect/star2_du-yolo11n_1000/weights/best.pt ./logs/$dir/star2_du-yolo11n_1000.log

# task runs/detect/star2_ud-yolo11n_600/weights/best.pt ./logs/$dir/star2_ud-yolo11n_600.log
# task runs/detect/star2_ud-yolo11n_800/weights/best.pt ./logs/$dir/star2_ud-yolo11n_800.log
# task runs/detect/star2_ud-yolo11n_1000/weights/best.pt ./logs/$dir/star2_ud-yolo11n_1000.log

# task runs/detect/star2_down-yolo11n_800/weights/best.pt ./logs/$dir/star2_down-yolo11n_800.log
# task runs/detect/star2_down-yolo11n_1000/weights/best.pt ./logs/$dir/star2_down-yolo11n_1000.log

# task runs/detect/star3_up-yolo11n_1000/weights/best.pt ./logs/$dir/star3_up-yolo11n_1000.log

#PAN
# task runs/detect/PAN_add-yolo11n_1000/weights/best.pt ./logs/$dir/PAN_add-yolo11n_1000.log
# task runs/detect/PAN_add2-yolo11n_1000/weights/best.pt ./logs/$dir/PAN_add2-yolo11n_1000.log

#BIFPN
# task runs/detect/BiFPN_wadd-yolo11n_1000/weights/best.pt ./logs/$dir/BiFPN_wadd-yolo11n_1000.log
# task runs/detect/BiFPN_wadd2-yolo11n_1000/weights/best.pt ./logs/$dir/BiFPN_wadd2-yolo11n_1000.log
# task runs/detect/BiFPN_concat-yolo11n_1000/weights/best.pt ./logs/$dir/BiFPN_concat-yolo11n_1000.log
# task runs/detect/BiFPN_star2-yolo11n_1000/weights/best.pt ./logs/$dir/BiFPN_star2-yolo11n_1000.log

#large
# task runs/detect/star2_up-yolo11x_1000/weights/best.pt ./logs/$dir/star2_up-yolo11x_1000.log
# task runs/detect/star2_up-yolo11x_600/weights/best.pt ./logs/$dir/star2_up-yolo11x_600.log

# task runs/detect/star2_Dd2-yolo11n_1000/weights/best.pt ./logs/$dir/star2_Dd2-yolo11n_1000.log
# task runs/detect/D2-yolo11n_1000/weights/best.pt ./logs/$dir/D2-yolo11n_1000.log

# task runs/detect/star2_up-yolo11s_1000_0.01/weights/best.pt ./logs/$dir/star2_up-yolo11s_1000_0.01.log
task runs/detect/star_up-yolo8n_1000_new/weights/best.pt ./logs/$dir/star_up-yolo8n_1000_new_1000.log