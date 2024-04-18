const timePerFrame = 16;
const sWidth = 1280;
const sHeight = 720;

function getCanvas() {
  const canvas = document.querySelector("canvas");
  const canvasContext = canvas.getContext("2d");
  return [canvas, canvasContext];
}

function drawVideoFrame(video, canvas, canvasContext) {
  canvasContext.drawImage(video, 0, 0, 1280, 720, 0, 0, canvas.width, canvas.height);
}

function drawCanvasEdge(canvas, canvasContext) {
  const imageData = canvasContext.getImageData(0, 0, canvas.width, canvas.height);
  const sobelData = Sobel(imageData);
  const sobelImageData = sobelData.toImageData();
  canvasContext.putImageData(sobelImageData, 0, 0);
}

function updateEdgeCanvas(video, canvas, canvasContext) {
  drawVideoFrame(video, canvas, canvasContext);
  drawCanvasEdge(canvas, canvasContext);
  setTimeout(() => {
    updateEdgeCanvas(video, canvas, canvasContext);
  }, timePerFrame);
}

function start() {
  const video = document.querySelector("video");
  const [canvas, canvasContext] = getCanvas();
  updateEdgeCanvas(video, canvas, canvasContext);
}

start();
