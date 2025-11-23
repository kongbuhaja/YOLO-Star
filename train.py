import argparse
import os, psutil
import re

parser = argparse.ArgumentParser(description='YOLO_Star')
parser.add_argument('--model', dest='model', type=str, default='yolov10n')
parser.add_argument('--data', dest='data', type=str, default='coco')
parser.add_argument('--batch_size', dest='batch_size', type=int, default=64, help='n=64, x=8')
parser.add_argument('--workers', dest='workers', type=int, default=8, help='threads')
parser.add_argument('--gpus', dest='gpus', type=str, default='0', help='which device do you want to use')
parser.add_argument('--cpus', dest='cpus', type=str, default='0-23', help='how many cores do you want to use')
parser.add_argument('--epochs', dest='epochs', type=int, default=1000)
parser.add_argument('--lr', dest='lr', type=float, default='0.01', help='start learning rate')

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
model = YOLO(f"{model_file}").to(device)

pat = re.compile(r'([0-9]+)([nslmx])?$')
m = pat.search(model_file.split(".")[0])
version = m.group(1)
size = m.group(2) or "n"

cfg = dict()
if size == "n":
    cfg["batch"] = 64
elif size == "s":
    cfg["batch"] = 48 if version == "12" else 64
# elif size == "m":
#     cfg["batch"] = 8
# elif size == "l":
#     cfg["batch"] = 8
elif size == "x":
    cfg["batch"] = 8

    
cfg.update(dict(
    workers = args.workers,
    data = f'{args.data}.yaml',
    epochs=args.epochs,
    imgsz=640,
    device=device,
    val=True,
    save_period=1,
    name=args.model,
    lr0=args.lr
))

train_results = model.train(**cfg)