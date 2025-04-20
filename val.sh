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

# task yolov8n.pt ./logs/val/yolo8n.log
# task yolov10n.pt ./logs/val/yolo10n.log
# task yolo11n.pt ./logs/val/yolo11n.log
# task yolo12n.pt ./logs/val/yolo12n.log


# task runs/detect/psd-yolo10n/weights/best.pt ./logs/val/psd-yolo10n.log
# task runs/detect/c2psd-yolo11n/weights/best.pt ./logs/val/c2psd-yolo11n.log

# task runs/detect/star2-yolo11n/weights/best.pt ./logs/val/star2-yolo11n.log

# task runs/detect/star_-yolo11n/weights/best.pt ./logs/val/star_-yolo11n.log
# task runs/detect/star_org-yolo11n/weights/best.pt ./logs/val/star_org-yolo11n.log

# task runs/detect/star_-yolo11n3/weights/best.pt ./logs/val/star_-yolo11n3.log

task runs/detect/star2-yolo10n/weights/best.pt ./logs/val/star2-yolo10n.log
