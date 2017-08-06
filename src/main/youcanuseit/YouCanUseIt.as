/**
 * Created by Bervianto Leo P on 26/05/2016.
 */

package main.youcanuseit {

import feathers.utils.ScreenDensityScaleFactorManager;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.display3D.Context3DProfile;
import flash.display3D.Context3DRenderMode;
import flash.events.Event;

import starling.core.Starling;

[SWF(width="600",height="800",frameRate="60",backgroundColor="#4a4137")]
/**
 * Main class of the project.
 */
public class YouCanUseIt extends Sprite {

    /** Starling object. */
    private var myStarling:Starling;
    private var _scaler:ScreenDensityScaleFactorManager;

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

        if(this.stage)
        {
            this.stage.scaleMode = StageScaleMode.NO_SCALE;
            this.stage.align = StageAlign.TOP_LEFT;
        }
        this.mouseEnabled = this.mouseChildren = false;

        Starling.multitouchEnabled = true;
        // Initialize Starling Object.
        this.myStarling = new Starling(Main, this.stage, null, null, Context3DRenderMode.AUTO, Context3DProfile.BASELINE_EXTENDED);
        this.myStarling.supportHighResolutions = true;
        this.myStarling.skipUnchangedFrames = true;

        // Show statistics for memory usage and fps.
        //this.myStarling.showStats = true;

        // Position stats.
        //this.myStarling.showStatsAt("left","bottom");

        // Start Starling Framework.
        this.myStarling.start();

        this._scaler = new ScreenDensityScaleFactorManager(this.myStarling);

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