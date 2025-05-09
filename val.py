import os, argparse, psutil
import numpy as np

parser = argparse.ArgumentParser(description='DYOLO')
parser.add_argument('--model', dest='model', type=str, default='yolov10n')
parser.add_argument('--data', dest='data', type=str, default='coco')
parser.add_argument('--cpus', dest='cpus', type=str, default='0-15', help='How many cpus do you want to use')
parser.add_argument('--gpus', dest='gpus', type=str, default='0', help='which device do you want to use')
parser.add_argument('--n', dest='n', type=int, default=7, help='how many time to run for test')

args = parser.parse_args()

cores = [int(core) for core in args.cpus.split('-')]
p = psutil.Process()
p.cpu_affinity(list(range(cores[0], cores[1]+1)))

os.environ['CUDA_VISIBLE_DEVICES'] = args.gpus

from ultralytics import YOLO
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

times = []
for _ in range(args.n):
    results = model.val(data = f'{args.data}.yaml')
    times += [[results.speed['preprocess'], results.speed['inference'], results.speed['postprocess'],
              sum([results.speed['preprocess'], results.speed['inference'], results.speed['postprocess']])]]

times = np.array(sorted(times, key=lambda x : x[-1])[1:-1]).T

model.info(verbose=1)
print(f"avg pre-processing time: {np.mean(times[0]):.4f} ms")
print(f"avg inference time: {np.mean(times[1]):.4f} ms")
print(f"avg post-processing time: {np.mean(times[2]):.4f} ms")
print(f"avg total time: {np.mean(times[3]):.4f}")
print(f"FPS: {1000/np.mean(times[3]):.2f}")