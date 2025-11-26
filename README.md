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
      <td align="left">37.4</td>
      <td align="left">0.5359</td>
      <td align="left">3.152</td>
      <td align="left">8.7</td>
    </tr>
    <tr>
      <th align="left"><b>YOLO8n-Star</b></th>
      <th align="left">38.4<small>(+1.0%)</small></th>
      <th align="left">0.5460<small>(+1.88%)</small></th>
      <th align="left">3.173<small>(+0.67%)</small></th>
      <th align="left">8.9</th>
    </tr>
    <tr>
      <td align="center"><b>YOLO10n</b></td>
      <td align="center">38.5</td>
      <td align="center">0.6308</td>
      <td align="center">2.763</td>
      <td align="center">8.6</td>
    </tr>
    <tr>
      <th align="center"><b>YOLO10n-Star</b></th>
      <th align="center">39.7<small>(+1.2%)</small></th>
      <th align="center">0.6330<small>(+0.35%)</small></th>
      <th align="center">2.784<small>(+1.2%)</small></th>
      <th align="center">8.7</th>
    </tr>
    <tr>
      <td align="center"><b>YOLO11n</b></td>
      <td align="center">39.4</td>
      <td align="center">0.6480</td>
      <td align="center">2.642</td>
      <td align="center">6.5</td>
    </tr>
    <tr>
      <th align="center"><b>YOLO11n-Star</b></th>
      <th align="center">40.2<small>(+0.8%)</small></th>
      <th align="center">0.6525<small>(+0.69%)</small></th>
      <th align="center">2.642<small>(+0.97%)</small></th>
      <th align="center">6.6</th>
    </tr>
    <tr>
      <td align="center"><b>YOLO12n</b></td>
      <td align="center">40.6</td>
      <td align="center">0.8809</td>
      <td align="center">2.590</td>
      <td align="center">6.5</td>
    </tr>
    <tr>
      <th align="center"><b>YOLO12n-Star</b></th>
      <th align="center">41.7<small>(+1.1%)</small></th>
      <th align="center">0.8839<small>(+0.34%)</small></th>
      <th align="center">2.633<small>(+1.61%)</small></th>
      <th align="center">6.7</th>
    </tr>
  </tbody>
</table>