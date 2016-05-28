/**
 * Created by Bervianto Leo P on 26/05/2016.
 */
package {
import flash.geom.Rectangle;

import starling.display.Image;

import starling.display.Sprite;
import starling.events.Event;
import starling.text.TextField;
import starling.display.Button;
import starling.textures.Texture;

public class Game extends Sprite {
    public function Game() {
        super();
        this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);

        var frame:Rectangle = new Rectangle(-40,-40,30,30);
        var texture:Texture = Texture.fromColor(100, 40, 0x1C86EE, 1, true);

        var button1:Button = new Button(texture,"Play");
        button1.x = 100;
        button1.y = 40;
        button1.textFormat.color = 0xffffff;
        button1.textFormat.bold = true;
        button1.textFormat.font = "Comic Sans MS";
        button1.textFormat.size = 14;

        button1.addEventListener(Event.TRIGGERED, onClickedButton);
        addChild(button1);

        var textField:TextField = new TextField(300,20,"Welcome to Starling!");
        addChild(textField);
    }

    private function onAddedToStage(event:Event):void {
        trace("Starling Framework Initialized!");
    }

    private function onClickedButton(event:Event):void {
        super.removeChildAt(0);
        super.removeChildAt(0);
        var textField:TextField = new TextField(300,20,"Hello! Are you Ready?");
        addChild(textField);
    }
}
}
