log_directory_check(){
    log_dir=$1
    if [ -d "$log_dir" ]; then
        :
    else
        mkdir -p "$log_dir"
    fi
}

start_background_task() {
    nohup python3 val.py --model "$1" > "$2" 2>&1 &
}

wait_for_completion() {
    while pgrep -f "python3 val.py --model $1" > /dev/null; do
        sleep 10
    done
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
#up
# task runs/detect/star2_up-yolo8n_1000/weights/best.pt ./logs/$dir/star2_up-yolo8n_1000.log #old
# task runs/detect/star2_up-yolo10n_1000/weights/best.pt ./logs/$dir/star2_up-yolo10n_1000.log #old
task runs/detect/star2_up-yolo11n_1000/weights/best.pt ./logs/$dir/star2_up-yolo11n_1000.log
# task runs/detect/star2_up-yolo12n_1000/weights/best.pt ./logs/$dir/star2_up-yolo12n_1000.log #old
#du
## task runs/detect/star2_du-yolo8n_1000/weights/best.pt ./logs/$dir/star2_du-yolo8n_1000.log
## task runs/detect/star2_du-yolo10n_1000/weights/best.pt ./logs/$dir/star2_du-yolo10n_1000.log
# task runs/detect/star2_du-yolo11n_1000/weights/best.pt ./logs/$dir/star2_du-yolo11n_1000.log
## task runs/detect/star2_du-yolo12n_1000/weights/best.pt ./logs/$dir/star2_du-yolo12n_1000.log
#ud
## task runs/detect/star2_ud-yolo8n_1000/weights/best.pt ./logs/$dir/star2_ud-yolo8n_1000.log
## task runs/detect/star2_ud-yolo10n_1000/weights/best.pt ./logs/$dir/star2_ud-yolo10n_1000.log
## task runs/detect/star2_ud-yolo11n_1000/weights/best.pt ./logs/$dir/star2_ud-yolo11n_1000.log
## task runs/detect/star2_ud-yolo12n_1000/weights/best.pt ./logs/$dir/star2_ud-yolo12n_1000.log
#down
## task runs/detect/star2_down-yolo8n_1000/weights/best.pt ./logs/$dir/star2_down-yolo8n_1000.log
## task runs/detect/star2_down-yolo10n_1000/weights/best.pt ./logs/$dir/star2_down-yolo10n_1000.log
# task runs/detect/star2_down-yolo11n_1000/weights/best.pt ./logs/$dir/star2_down-yolo11n_1000.log
## task runs/detect/star2_down-yolo12n_1000/weights/best.pt ./logs/$dir/star2_down-yolo12n_1000.log
#epoch
# task runs/detect/star2_du-yolo11n_600/weights/best.pt ./logs/$dir/star2_du-yolo11n_600.log
# task runs/detect/star2_du-yolo11n_800/weights/best.pt ./logs/$dir/star2_du-yolo11n_800.log
# task runs/detect/star2_du-yolo11n_1000/weights/best.pt ./logs/$dir/star2_du-yolo11n_1000.log

# task runs/detect/star2_ud-yolo11n_600/weights/best.pt ./logs/$dir/star2_ud-yolo11n_600.log
# task runs/detect/star2_ud-yolo11n_800/weights/best.pt ./logs/$dir/star2_ud-yolo11n_800.log
# task runs/detect/star2_ud-yolo11n_1000/weights/best.pt ./logs/$dir/star2_ud-yolo11n_1000.log

# task runs/detect/star2_down-yolo11n_800/weights/best.pt ./logs/$dir/star2_down-yolo11n_800.log
# task runs/detect/star2_down-yolo11n_1000/weights/best.pt ./logs/$dir/star2_down-yolo11n_1000.log