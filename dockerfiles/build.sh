sudo docker build --force-rm -f /home/dblab/hs/YOLO_star/dockerfiles/env.dockerfile -t yolo:latest .
sudo docker run --gpus '"device=0"' --cpuset-cpus=0-23 -m 256g --shm-size=16g -it -v /home/dblab/hs:/home/ML --name yolo yolo:latest
