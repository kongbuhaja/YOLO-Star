# ==========================================
VAL_IMG_DIR = '/home/ML/datasets/VisDrone/VisDrone2019-DET-val/images'
VAL_LABEL_DIR = '/home/ML/datasets/VisDrone/VisDrone2019-DET-val/labels'
GT_JSON_FILE = '/home/ML/datasets/VisDrone/VisDrone2019-DET-val/annotations/visdrone_gt.json' # 저장될 정답지 파일명
# ==========================================

def convert_visdrone_to_coco(img_dir, label_dir, output_file):
    import os
    import glob
    import json
    import cv2
    from pathlib import Path
    from tqdm import tqdm

    print(f"Start transform: {label_dir} -> {output_file}")
    
    images = []
    annotations = []
    categories = [
        {'id': 0, 'name': 'pedestrian'},
        {'id': 1, 'name': 'people'},
        {'id': 2, 'name': 'bicycle'},
        {'id': 3, 'name': 'car'},
        {'id': 4, 'name': 'van'},
        {'id': 5, 'name': 'truck'},
        {'id': 6, 'name': 'tricycle'},
        {'id': 7, 'name': 'awning-tricycle'},
        {'id': 8, 'name': 'bus'},
        {'id': 9, 'name': 'motor'}
    ]
    
    img_files = sorted(glob.glob(os.path.join(img_dir, '*.jpg')))
    ann_id = 0
    
    print(f"All {len(img_files)} images will be processed")

    for img_path in tqdm(img_files):
        filename = os.path.basename(img_path)
        image_id = os.path.splitext(filename)[0]
        
        img = cv2.imread(img_path)
        if img is None:
            print(f"Reading image fail: {img_path}")
            continue
        h, w, _ = img.shape
        
        images.append({
            "id": image_id,
            "file_name": filename,
            "height": h,
            "width": w
        })
        
        label_file = os.path.join(label_dir, image_id + '.txt')
        if os.path.exists(label_file):
            with open(label_file, 'r') as f:
                lines = f.readlines()
            
            for line in lines:
                parts = line.strip().split(',')
                
                data = list(map(float, line.strip().split()))
                if len(data) >= 5:
                    cls_id = int(data[0])
                    cx, cy, nw, nh = data[1], data[2], data[3], data[4]
                    
                    abs_w = nw * w
                    abs_h = nh * h
                    abs_x = (cx * w) - (abs_w / 2)
                    abs_y = (cy * h) - (abs_h / 2)
                    
                    annotations.append({
                        "id": ann_id,
                        "image_id": image_id,
                        "category_id": cls_id,
                        "bbox": [abs_x, abs_y, abs_w, abs_h],
                        "area": abs_w * abs_h,
                        "iscrowd": 0
                    })
                    ann_id += 1

    coco_format = {
        "images": images,
        "annotations": annotations,
        "categories": categories
    }
    
    with open(output_file, 'w') as f:
        json.dump(coco_format, f)
    
    print(f"Transform completed! json file is saved: {output_file}")


def evaluate(pred_json_file):
    import json
    import os
    from pycocotools.coco import COCO
    from pycocotools.cocoeval import COCOeval

    if not os.path.exists(GT_JSON_FILE):
        print(f"There isn't {GT_JSON_FILE}) file.")
        convert_txt_to_coco_json(VAL_IMG_DIR, VAL_LABEL_DIR, GT_JSON_FILE)
    else:
        pass

    if not os.path.exists(pred_json_file):
        print(f"error: There isn't {pred_json_file}) file.")
        return

    print("\n[COCO Eval Start]")
    try:
        cocoGt = COCO(GT_JSON_FILE)
        cocoDt = cocoGt.loadRes(pred_json_file)
        
        cocoEval = COCOeval(cocoGt, cocoDt, 'bbox')
        cocoEval.evaluate()
        cocoEval.accumulate()
        cocoEval.summarize()
        
    except Exception as e:
        print(f"evalidation error: {e}")