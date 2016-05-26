/**
 * Created by Bervianto Leo P on 26/05/2016.
 */
package {
import starling.display.Sprite;
import starling.events.Event;

public class Game extends Sprite {
    public function Game() {
        super();
        this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
    }

    private function onAddedToStage(event:Event):void {
        trace("Starling Framework Initialized!");
    }
}
}
