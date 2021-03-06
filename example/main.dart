import 'package:ArtClicker/ArtClicker.dart';
import 'package:RenderingLib/RendereringLib.dart';
import "dart:html";
import "dart:async";
Element container;

DivElement div;
ArtCanvas artCanvas;
main() {
    div = querySelector("#container");
    start();
}

void clearDiv() {
    List<Element> children = new List.from(div.children);
    children.forEach((f) {
        f.remove();
    });
}

Future<Null> start() async{
    await Loader.preloadManifest();
    ImageElement image = await Loader.getResource("images/1.png");
    div.append(image);
    CanvasElement modelCanvas = new CanvasElement(width: image.width, height: image.height);
    modelCanvas.context2D.drawImage(image, 0, 0);
    artCanvas = new ArtCanvas(div,modelCanvas);
    tick();
}

Future<Null> tick() async {
    artCanvas.drawBrushStroke();
    new Timer(new Duration(milliseconds: 10), () => tick());
}
