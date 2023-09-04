import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-recycle',
  templateUrl: './recycle.component.html',
  styleUrls: ['./recycle.component.css']
})
export class RecycleComponent implements OnInit {
  constructor(private router: Router) { }

  ngOnInit(): void {
    const canvasIds = ["chartCanvas1", "chartCanvas2", "chartCanvas3", "chartCanvas4"];
    const dataSets = [
      [
        { label: "2020", value: 10267788 },
        { label: "2021", value: 10430492 },
        { label: "2022", value: 11858324 }
      ],
      [
        { label: "2020", value: 5667484 },
        { label: "2021", value: 6048305 },
        { label: "2022", value: 6570020 }
      ],
      [
        { label: "2020", value: 4096704 },
        { label: "2021", value: 3895150 },
        { label: "2022", value: 4799424 }
      ],
      [
        { label: "2020", value: 503600 },
        { label: "2021", value: 487037 },
        { label: "2022", value: 488880 }
      ]
    ];

    const maxDataValue = Math.max(...dataSets.map(dataset => Math.max(...dataset.map(point => point.value))));

    let animationFrame: number | null = null; // Explicitly set the type as number | null
    let animationStartTime: number | null = null; // Explicitly set the type as number | null
    const animationDuration = 2000; // Animation duration in milliseconds

    function animateCharts(timestamp: number) {
      if (!animationStartTime) {
        animationStartTime = timestamp;
      }

      const elapsedTime = timestamp - animationStartTime;
      const animationProgress = Math.min(elapsedTime / animationDuration, 1);

      for (let i = 0; i < canvasIds.length; i++) {
        drawChart(canvasIds[i], dataSets[i], maxDataValue, animationProgress);
      }

      if (animationProgress < 1) {
        animationFrame = requestAnimationFrame(animateCharts);
      } else {
        cancelAnimationFrame(animationFrame!);
      }
    }

    animationFrame = requestAnimationFrame(animateCharts);
  }

  // 回到首頁，使用 Angular 的路由導航
  navigateToHome(): void {
    this.router.navigateByUrl('/home', { skipLocationChange: true });
  }

}

function drawChart(canvasId: string, dataPoints: any[], maxDataValue: number, animationProgress: number) {
  const canvas = document.getElementById(canvasId) as HTMLCanvasElement;
  const context = canvas.getContext("2d");

  if (!context) {
    console.error("Unable to get 2D context for canvas");
    return;
  }

  const barWidth = 40;
  const barSpacing = 100;
  const originX = 50;
  const originY = canvas.height - 50;

  context.clearRect(0, 0, canvas.width, canvas.height);

  context.beginPath();
  context.moveTo(originX, originY);
  context.lineTo(canvas.width - originX, originY);
  context.moveTo(originX, originY);
  context.lineTo(originX, 50);
  context.strokeStyle = "black";
  context.stroke();

  context.fillStyle = "black";

  const scaleStep = maxDataValue / 5;

  for (let i = 0; i <= maxDataValue; i += scaleStep) {
      const y = originY - (i * (originY - 50) / maxDataValue);
      context.beginPath();
      context.moveTo(originX - 5, y);
      context.lineTo(originX + 5, y);
      context.fillText(Math.floor(i).toString(), originX - 30, y + 5);
      context.strokeStyle = "green";
      context.stroke();
  }

  let x = originX;
  for (let i = 0; i < dataPoints.length; i++) {
      const dataPoint = dataPoints[i];
      const targetHeight = (dataPoint.value * (originY - 50)) / maxDataValue * animationProgress;
      const y = originY - targetHeight;
      context.fillStyle = getColor(i);
      context.fillRect(x, y, barWidth, targetHeight);
      context.fillStyle = "black";
      context.fillText(dataPoint.label, x + barWidth / 2 - 10, originY + 20);
      x += barSpacing;
  }
}

function getColor(index: number): string {
  const colors = ["lightgreen", "lightgreen", "lightgreen"];
  return colors[index];
}
