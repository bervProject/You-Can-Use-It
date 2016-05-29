/**
 * Created by Bervianto Leo P on 26/05/2016.
 */
package {

import flash.text.TextFormat;

import mx.core.FlexTextField;

import starling.core.Starling;

import starling.display.Sprite;
    import starling.events.Event;
    import starling.text.TextField;
    import starling.display.Button;
    import starling.textures.Texture;


    public class Game extends Sprite {
        private var inputField:TextField;
        private var welcomemsg:TextField;
        private var nameLabel:TextField;
        private var playButton:Button;
        private var input:FlexTextField;

        public function Game() {
            super();
            this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);

            //Welcome Message
            welcomemsg = new TextField(200,30,"Welcome to Starling!");
            welcomemsg.x = 100;
            welcomemsg.y = 0;
            welcomemsg.format.horizontalAlign = "left";
            welcomemsg.format.verticalAlign = "center";
            welcomemsg.format.font = "Arial";
            addChild(welcomemsg);

            //Name Label
            nameLabel = new TextField(60,30,"Name :");
            nameLabel.x = 100;
            nameLabel.y = 40;
            nameLabel.format.horizontalAlign = "left";
            nameLabel.format.verticalAlign = "center";
            nameLabel.format.font = "Arial";
            addChild(nameLabel);

            input = new FlexTextField();
            input.maxChars = 50;
            input.type = "input";
            input.border = true;
            input.width = 300;
            input.height = 30;
            input.x = 165;
            input.y = 40;
            Starling.current.nativeOverlay.addChild(input);

            //Setting Button
            var texture:Texture = Texture.fromColor(100, 40, 0x1C86EE, 1, true);
            playButton = new Button(texture,"Play");
            playButton.x = 100;
            playButton.y = 80;
            playButton.textFormat.color = 0xffffff;
            playButton.textFormat.bold = true;
            playButton.textFormat.font = "Comic Sans MS";
            playButton.textFormat.size = 14;
            playButton.addEventListener(Event.TRIGGERED, onClickedButton);
            addChild(playButton);

        }

        private function onAddedToStage(event:Event):void {
            trace("Starling Framework Initialized!");
        }

        private function onClickedButton(event:Event):void {
            var output:TextField = new TextField(250,20,"Hello");
            output.x = 100;
            output.y = 0;
            output.format.horizontalAlign = "left";
            output.format.verticalAlign = "center";
            output.format.font = "Arial";

            output.text = output.text + " " + input.text + "!";

            super.removeChild(welcomemsg);
            super.removeChild(nameLabel);
            super.removeChild(inputField);
            super.removeChild(playButton);
            Starling.current.nativeOverlay.removeChild(input);
            addChild(output);
        }

    }
}
