import argparse
import os, psutil

parser = argparse.ArgumentParser(description='DeCo-YOLOs')
parser.add_argument('--model', dest='model', type=str, default='yolov10n')
parser.add_argument('--data', dest='data', type=str, default='coco')
parser.add_argument('--batch_size', dest='batch_size', type=int, default=16, help='n=64, x=8')
parser.add_argument('--workers', dest='workers', type=int, default=12, help='threads')
parser.add_argument('--gpus', dest='gpus', type=str, default='0', help='which device do you want to use')
parser.add_argument('--cpus', dest='cpus', type=str, default='0-23', help='how many cores do you want to use')
parser.add_argument('--epochs', dest='epochs', type=int, default=500)
parser.add_argument('--lr', dest='lr', type=float, default='0.02', help='start learning rate')

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

train_args = dict(
    workers = args.workers,
    data = f'{args.data}.yaml',
    batch=args.batch_size,
    epochs=args.epochs,
    imgsz=640,
    device=device,
    val=True,
    save_period=1,
    name=args.model,
    lr0=args.lr
)
train_results = model.train(**train_args)