/**
 * Created by Bervianto Leo P on 26/05/2016.
 */

package {

import flash.display.Sprite;
import flash.events.Event;
import flash.geom.Rectangle;

import starling.core.Starling;

//[SWF(frameRate="60",height="720",width="1280")]
/**
 * Main class of the project.
 */
public class YouCanUseIt extends Sprite {

    /** Starling object. */
    private var myStarling:Starling;
   // private var base:Class;

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

        var phoneSize:flash.geom.Rectangle = new flash.geom.Rectangle(0, 0, stage.fullScreenWidth, stage.fullScreenHeight);

        // Initialize Starling Object.
        myStarling = new Starling(Main, stage, phoneSize);

        // Define basic anti aliasing.
        myStarling.antiAliasing = 1;

        // Show statistics for memory usage and fps.
        myStarling.showStats = true;

        // Position stats.
        myStarling.showStatsAt("left","bottom");

        // Start Starling Framework.
        myStarling.start();

        this.stage.addEventListener(Event.DEACTIVATE, stage_deactiveHandler, false, 0, true);
    }

    /**
     * Stage deactive handler.
     * @param event
     */
    private function stage_deactiveHandler(event:Event):void {
        this.myStarling.stop(true);
        this.stage.addEventListener(Event.ACTIVATE, stage_activateHandler, false, 0, true);
    }

    /**
     * Stage active handler.
     * @param event
     */
    private function stage_activateHandler(event:Event):void {
        this.stage.removeEventListener(Event.ACTIVATE, stage_activateHandler);
        this.myStarling.start();
    }

}
}