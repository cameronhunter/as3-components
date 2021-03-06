package uk.co.cameronhunter.as3.components {

  import flash.display.Bitmap;
  import flash.display.Loader;
  import flash.display.Sprite;
  import flash.display.DisplayObject;
  import flash.events.Event;
  import flash.net.URLRequest;
  import uk.co.cameronhunter.as3.utils.Uri;

  public class Image extends Sprite {

    public function Image(url: String, width: uint, height: uint) {
      Uri.isSafe(url);

      var loader: Loader = new Loader();

      loader.contentLoaderInfo.addEventListener(Event.COMPLETE, function(e: Event): void {
        var image: DisplayObject = trySmoothing(loader);
        image.width = width;
        image.height = height;
        addChild(image);
      });

      loader.load(new URLRequest(url));

      graphics.beginFill(0x000000, 0);
      graphics.drawRect(0, 0, width, height);
      graphics.endFill();
    }

    /**
     * Smoothing only works if a valid crossdomain.xml exists on the image domain.
     * So we give it a go, and fallback to the unsmoothed image.
     */
    private static function trySmoothing(loader: Loader): DisplayObject {
      try {
        var bitmap: Bitmap = loader.content as Bitmap;
        bitmap.smoothing = true;
        return bitmap;
      } catch(e: Error) {
        // Ignore
      }
      return loader;
    }

  }

}
