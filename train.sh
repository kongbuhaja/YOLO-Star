log_directory_check(){
    log_dir=$1
    if [ -d "$log_dir" ]; then
        :
    else
        mkdir -p "$log_dir"
    fi
}

start_background_task() {
    local model=$1
    local cpus=$2
    local gpus=$3
    local log_dir=$4

    echo "Training for $1 has begun."
    nohup python3 train.py --model "$model" --cpus "$cpus" --gpus "$gpus" > "$log_dir/$model.log" 2>&1 &
    sleep 10
}

wait_for_completion() {
    local model=$1
    local cpus=$2
    local gpus=$3

    while pgrep -f "python3 train.py --model $model --cpus $cpus --gpus $gpus" > /dev/null; do
        sleep 30
    done
    echo "Training for $model has completed."
    echo ""
}

task() {
    start_background_task "$1" "$2" "$3" "$4"
    wait_for_completion "$1" "$2" "$3"
}

log_dir="./logs"
log_directory_check "$log_dir"

# task deco-yolo8n "$log_dir"
# task deco-yolo10n "$log_dir"
# task deco-yolo11n "$log_dir" 

# 2,724,448     2,775,520     2,624,080


# task star2-yolo12n "0-23" 0 "$log_dir"
# task star2-yolo10n "0-23" 0 "$log_dir"
# task star2-yolo8n "0-23" 0 "$log_dir"

# task star2_up-yolo11n "0-23" 0 "$log_dir" # 기존
# task star2_du-yolo11n "0-23" 0 "$log_dir" 
# task star2_ud-yolo11n "0-23" 0 "$log_dir"
# task star2_down-yolo11n "0-23" 0 "$log_dir"

# task star3_up-yolo11n "0-23" 0 "$log_dir"
# task BiFPN_wadd-yolo11n "0-23" 0 "$log_dir"
task star2_up-yolo11x "0-23" 0 "$log_dir"
