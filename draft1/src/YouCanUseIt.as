/**
 * Created by Bervianto Leo P on 26/05/2016.
 */

package {

import flash.display.Sprite;
import flash.events.Event;

import starling.core.Starling;

/**
 * Main class of the project.
 */
public class YouCanUseIt extends Sprite {

    /** Starling object. */
    private var myStarling:Starling;

    public function YouCanUseIt() {
        super();

        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    /**
     * On added to stage.
     * @param event
     */
    protected function onAddedToStage(event:Event):void {
        this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

        // Initialize Starling Object.
        myStarling = new Starling(Game,stage);

        // Define basic anti aliasing.
        myStarling.antiAliasing = 1;

        // Show statistics for memory usage and fps.
        myStarling.showStats = true;

        // Position stats.
        myStarling.showStatsAt("left","bottom");

        // Start Starling Framework.
        myStarling.start();
    }
}
}
