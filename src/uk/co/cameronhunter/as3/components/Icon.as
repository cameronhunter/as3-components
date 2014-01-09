package uk.co.cameronhunter.as3.components {

  import flash.display.Sprite;
  import flash.text.TextField;
  import flash.text.TextFormat;
  import flash.text.TextFieldAutoSize;
  import flash.text.AntiAliasType;

  public final class Icon extends Sprite {

    public function Icon(icon: String, size: uint, color: uint = 0xFFFFFF, opacity: Number = 1, font: String = "icon-font") {
      var field: TextField = new TextField();
      field.embedFonts = true;
      field.name = icon;
      field.autoSize = TextFieldAutoSize.LEFT;
      field.antiAliasType = AntiAliasType.ADVANCED;
      field.defaultTextFormat = new TextFormat(font, size, color);
      field.selectable = false;
      field.text = icon;
      field.width = field.textWidth;
      field.height = field.textHeight;

      this.alpha = opacity;

      addChild(field);
    }

  }

}