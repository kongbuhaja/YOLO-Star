import os, argparse, psutil
import numpy as np
from ultralytics.utils.benchmarks import benchmark

parser = argparse.ArgumentParser(description='YOLO_Star')
parser.add_argument('--model', dest='model', type=str, default='yolov10n')
parser.add_argument('--data', dest='data', type=str, default='coco')
parser.add_argument('--cpus', dest='cpus', type=str, default='0-15', help='How many cpus do you want to use')
parser.add_argument('--gpus', dest='gpus', type=str, default='0', help='which device do you want to use')
parser.add_argument('--n', dest='n', type=int, default=3, help='how many time to run for test')

args = parser.parse_args()

cores = [int(core) for core in args.cpus.split('-')]
p = psutil.Process()
p.cpu_affinity(list(range(cores[0], cores[1]+1)))

os.environ['CUDA_VISIBLE_DEVICES'] = args.gpus

from ultralytics import YOLO
from ultralytics.utils.benchmarks import benchmark
import torch 

if torch.cuda.is_available():
    device = torch.device("cuda")
    print(f"Using GPU(s): {args.gpus}")
    for i in range(torch.cuda.device_count()):
        print(f"  GPU {i}: {torch.cuda.get_device_name(i)}")
else:
    device = torch.device("cpu")
    print("CUDA is not available. Using CPU.")

model_file = args.model if '.pt' in args.model else f'{args.model}.yaml'
model = YOLO(f"{model_file}")

# values = []
# for _ in range(args.n):
#     trt = model.benchmark(data=f'{args.data}.yaml', format='engine', half=True, imgsz=640, device=0)
#     values += [trt.values[0][3:]]
# values = np.array(sorted(values, key=lambda x : x[1])[1:-1]).T
# values = np.array(sorted(values, key=lambda x : x[1])).T

results = model.val(data = f'{args.data}.yaml',
          save_json=True)

if args.data == "VisDrone":
    from VisDrone import evaluate

    pred_json_file = f"{results.save_dir}/predictions.json"
    evaluate(pred_json_file)

# print(f"avg trt mAP: {np.mean(values[0]):.4f}")
# print(f"avg inference time: {np.mean(values[1]):.4f} ms")
# print(f"avg FPS: {np.mean(values[2]):.2f}")
