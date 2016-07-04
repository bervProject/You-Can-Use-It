/**
 * Created by Bervianto Leo P on 14/06/2016.
 */
package screens {

import events.NavigationEvent;

import feathers.controls.Button;
import feathers.themes.MetalWorksMobileTheme;

import flash.net.URLRequest;
import flash.net.navigateToURL;

import starling.display.Sprite;
import starling.events.Event;
import starling.text.TextField;

/**
 * This is the welcome or main menu class for the game.
 */
public class Welcome extends Sprite {

    /** Play button. */
    private var playBtn:Button;
    
    /** About button. */
    private var aboutBtn:Button;

    /** About text field. */
    private var aboutText:TextField;
    
    /** Starling Framework button. */
    private var starlingBtn:Button;
    
    /** Back button. */
    private var backBtn:Button;
    
    /** Screen mode - "welcome" or "about". */
    private var screenMode:String;
    
    /** Current date. */
    private var _currentDate:Date;

    public function Welcome() {
        super();
        this.visible = false;
        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    /**
     * On added to stage.
     * @param event
     */
    private function onAddedToStage(event:Event):void {
        this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

        drawScreen();
    }

    /**
     * Draw all the screen elements.
     */
    private function drawScreen():void {
        playBtn = new Button();
        playBtn.label = "Play";
        playBtn.x = 60;
        playBtn.y = 50;
        playBtn.addEventListener(Event.TRIGGERED, onPlayClick);
        this.addChild(playBtn);

        aboutBtn = new Button();
        aboutBtn.label = "About";
        aboutBtn.x = 150;
        aboutBtn.y = 50;
        aboutBtn.addEventListener(Event.TRIGGERED, onAboutClick);
        this.addChild(aboutBtn);

        aboutText = new TextField(300, 100, "");
        aboutText.text = "This application for study about your technology."
        aboutText.x = 100;
        aboutText.y = 50;
        aboutText.format.horizontalAlign = "center";
        aboutText.format.verticalAlign = "top";
        aboutText.height = aboutText.textBounds.height + 30;
        this.addChild(aboutText);

        starlingBtn = new Button();
        starlingBtn.label = "Starling";
        starlingBtn.x = aboutText.bounds.right - starlingBtn.width;
        starlingBtn.y = aboutText.bounds.bottom;
        starlingBtn.addEventListener(Event.TRIGGERED, onStarlingBtnClick);
        this.addChild(starlingBtn);

        backBtn = new Button();
        backBtn.label = "Back";
        backBtn.x = 60;
        backBtn.y = 50;
        backBtn.addEventListener(Event.TRIGGERED, onAboutBackClick);
        this.addChild(backBtn);
    }

    /**
     * On back button click from about screen.
     * @param event
     */
    private function onAboutBackClick(event:Event):void {
        //sound

        initialize();
    }

    /**
     * On credits click on Starling Framework image.
     * @param event
     */
    private function onStarlingBtnClick(event:Event):void {
        navigateToURL(new URLRequest("http://www.gamua.com/starling"), "_blank");
    }

    /**
     * On play button click
     * @param event
     */
    private function onPlayClick(event:Event):void {
        this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: "play"}, true));

        //sound
    }
    
    /**
     * On about button click.
     * @param event
     */
    private function onAboutClick(event:Event):void {
        //sound

        showAbout();
    }

    /**
     * Show about screen.
     */
    public function showAbout():void {
        screenMode = "about";
        playBtn.visible = false;
        aboutBtn.visible = false;

        aboutText.visible = true;
        starlingBtn.visible = true;
        backBtn.visible = true;
    }

    /**
     * Initialize welcome screen.
     */
    public function initialize():void {
        disposeTemporarily();

        this.visible = true;

        // sound setting

        screenMode = "welcome";
        playBtn.visible = true;
        aboutBtn.visible = true;

        aboutText.visible = false;
        starlingBtn.visible = false;
        backBtn.visible = false;

        this.addEventListener(Event.ENTER_FRAME, floatingAnimation);
    }

    /**
     * Animate floating objects.
     * @param event
     */
    private function floatingAnimation(event:Event):void {
        _currentDate = new Date();
        playBtn.y = 50 + (Math.cos(_currentDate.getTime() * 0.002)) * 10;
        aboutBtn.y = 50 + (Math.cos(_currentDate.getTime() * 0.002)) * 10;
    }

    /**
     * Dispose objects temporarily.
     */
    public function disposeTemporarily():void {
        this.visible = false;

        if (this.hasEventListener(Event.ENTER_FRAME))
                this.removeEventListener(Event.ENTER_FRAME, floatingAnimation);

        //setting sound
    }


}
}
