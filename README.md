<div align="center">
<h1>YOLO-Star</h1>
<h3>YOLO-Star: Multi-Scale Feature Fusion via Element-wise Multiplication</h3>


<p align="center">
  <img src="images/image.png" width=90%> <br>
  Comparison with previous YOLO models in terms of process-time (left) and FLOPs-accuracy (right) trade-offs
</p>
</div>

## Experiment Result
All Experiment is processed with RTX 4090 1-way


### Comparison with previous models
<table>
  <thead>
    <tr>
      <th align="center">Model</th>
      <th align="center">mAP<sup>val</sup><br><sup>50-95</sup></th>
      <th align="center">Time (ms)<br><sup>TensorRT(FP16)</sup></th>
      <th align="center">Params<br><sup>(M)</sup></th>
      <th align="center">FLOPs<br><sup>(G)</sup></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td align="left"><b>YOLO8n</b></td>
      <td align="center">37.4</td>
      <td align="center">0.5359</td>
      <td align="center">3.152</td>
      <td align="center">8.7</td>
    </tr>
    <tr>
      <th align="left"><b>YOLO8n-Star</b></th>
      <th align="center">38.4<sub>(+1.0%)</sub></th>
      <th align="center">0.5460<sub>(+1.88%)</sub></th>
      <th align="center">3.173<sub>(+0.67%)</sub></th>
      <th align="center">8.9</th>
    </tr>
    <tr>
      <td align="left"><b>YOLO10n</b></td>
      <td align="center">38.5</td>
      <td align="center">0.6308</td>
      <td align="center">2.763</td>
      <td align="center">8.6</td>
    </tr>
    <tr>
      <th align="left"><b>YOLO10n-Star</b></th>
      <th align="center">39.7<sub>(+1.2%)</sub></th>
      <th align="center">0.6330<sub>(+0.35%)</sub></th>
      <th align="center">2.784<sub>(+1.2%)</sub></th>
      <th align="center">8.7</th>
    </tr>
    <tr>
      <td align="left"><b>YOLO11n</b></td>
      <td align="center">39.4</td>
      <td align="center">0.6480</td>
      <td align="center">2.642</td>
      <td align="center">6.5</td>
    </tr>
    <tr>
      <th align="left"><b>YOLO11n-Star</b></th>
      <th align="center">40.2<sub>(+0.8%)</sub></th>
      <th align="center">0.6525<sub>(+0.69%)</sub></th>
      <th align="center">2.642<sub>(+0.97%)</sub></th>
      <th align="center">6.6</th>
    </tr>
    <tr>
      <td align="left"><b>YOLO12n</b></td>
      <td align="center">40.6</td>
      <td align="center">0.8809</td>
      <td align="center">2.590</td>
      <td align="center">6.5</td>
    </tr>
    <tr>
      <th align="left"><b>YOLO12n-Star</b></th>
      <th align="center">41.7<sub>(+1.1%)</sub></th>
      <th align="center">0.8839<sub>(+0.34%)</sub></th>
      <th align="center">2.633<sub>(+1.61%)</sub></th>
      <th align="center">6.7</th>
    </tr>
  </tbody>
</table>
<br>
  

### Comparison with object scale
<table>
  <thead>
    <tr>
      <th rowspan="2" align="center">Model</th>
      <th colspan="4" align="center">mAP</th>
    </tr>
    <tr>
      <th align="center">All</th>
      <th align="center">Small</th>
      <th align="center">Medium</th>
      <th align="center">Large</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td align="left"><b>YOLO8n</b></td>
      <td align="center">37.4</td>
      <td align="center">18.8</td>
      <td align="center">41.0</td>
      <td align="center">53.5</td>
    </tr>
    <tr>
      <th align="left"><b>YOLO8n-Star</b></th>
      <th align="center">38.4<sub>(+1.0%)</sub></th>
      <th align="center">20.0<sub>(+1.2%)</sub></th>
      <th align="center">42.2<sub>(+1.2%)</sub></th>
      <th align="center">53.5<sub>(+0.0%)</sub></th>
    </tr>
    <tr>
      <td align="left"><b>YOLO10n</b></td>
      <td align="center">38.5</td>
      <td align="center">19.0</td>
      <td align="center">42.3</td>
      <td align="center">54.6</td>
    </tr>
    <tr>
      <th align="left"><b>YOLO10n-Star</b></sub></th>
      <th align="center">39.7<sub>(+1.2%)</sub></th>
      <th align="center">20.4<sub>(+1.4%)</sub></th>
      <th align="center">43.4<sub>(+1.1%)</sub></th>
      <th align="center">56.5<sub>(+1.9%)</sub></th>
    </tr>
    <tr>
      <td align="left"><b>YOLO11n</b></td>
      <td align="center">39.4</td>
      <td align="center">19.8</td>
      <td align="center">43.2</td>
      <td align="center">57.0</td>
    </tr>
    <tr>
      <th align="left"><b>YOLO11n-Star</b></sub></th>
      <th align="center">40.2<sub>(+0.8%)</sub></th>
      <th align="center">21.2<sub>(+1.4%)</sub></th>
      <th align="center">44.5<sub>(+1.3%)</sub></th>
      <th align="center">56.9<sub>(−0.1%)</sub></th>
    </tr>
    <tr>
      <td align="left"><b>YOLO12n</b></td>
      <td align="center">40.6</td>
      <td align="center">20.4</td>
      <td align="center">45.2</td>
      <td align="center">58.4</td>
    </tr>
    <tr>
      <th align="left"><b>YOLO12n-Star</b></sub></th>
      <th align="center">41.7<sub>(+1.1%)</sub></th>
      <th align="center">22.4<sub>(+2.2%)</sub></th>
      <th align="center">46.4<sub>(+1.2%)</sub></th>
      <th align="center">58.9<sub>(+0.5%)</sub></th>
    </tr>