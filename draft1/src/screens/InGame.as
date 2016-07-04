/**
 * Created by Bervianto Leo P on 04/07/2016.
 */
package screens {
import starling.core.Starling;
import starling.display.Sprite;
import starling.events.Event;

public class InGame extends Sprite {
    private var isHardwareRendering:Boolean;

    public function InGame() {
        super();

        isHardwareRendering = Starling.context.driverInfo.toLowerCase().indexOf("software") == -1;

        this.visible = false;
        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    private function onAddedToStage(event:Event):void {
        this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

        drawGame();
    }

    private function drawGame():void {
        if (isHardwareRendering) {

        }


    }

    public function initialize():void {
        
    }
}
}
