/**
 * Created by Bervianto Leo P on 26/05/2016.
 */
package {

import events.NavigationEvent;

import feathers.controls.Button;
import feathers.themes.MetalWorksMobileTheme;

import screens.InGame;
import screens.Welcome;

import starling.display.Sprite;
import starling.events.Event;

public class Game extends Sprite {
    /** Screen - Welcome or YouCanUseIt Menu. */
    private var screenWelcome:Welcome;

    /** Screen - InGame. */
    private var screenInGame:InGame;

    public function Game() {
        //Setup FeatherUI Themes
        new MetalWorksMobileTheme();

        super();
        this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
    }

    /**
     * On Game class added to stage.
     * @param event
     */
    private function onAddedToStage(event:Event):void {
        trace("Starling Framework Initialized!");

        this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

        //Initialize screens.
        initScreens();
    }

    private function initScreens():void {
        this.addEventListener(NavigationEvent.CHANGE_SCREEN, onChangeScreen);

        screenInGame = new InGame();
        screenInGame.addEventListener(NavigationEvent.CHANGE_SCREEN, onInGameNavigation);
        this.addChild(screenInGame);

        screenWelcome = new Welcome();
        this.addChild(screenWelcome);

        screenWelcome.initialize();
    }

    /**
     * On navigation from different screens.
     * @param event
     */
    private function onInGameNavigation(event:NavigationEvent):void {
        switch (event.params.id) {
            case "mainMenu" :
                screenWelcome.initialize();
                break;
            case "about" :
                screenWelcome.initialize();
                screenWelcome.showAbout();
                break;
        }
    }

    /**
     * On change of screen.
     * @param event
     */
    private function onChangeScreen(event:NavigationEvent):void {
        switch (event.params.id) {
            case "play" :
                screenWelcome.disposeTemporarily();
                screenInGame.initialize();
                break;
        }
    }

}
}
