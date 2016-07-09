/**
 * Created by Bervianto Leo P on 14/06/2016.
 */
package screens {

import events.NavigationEvent;

import feathers.controls.Button;
import feathers.controls.Label;
import feathers.controls.LayoutGroup;
import feathers.layout.VerticalLayout;
import feathers.controls.TextArea;

import flash.html.script.Package;

import flash.net.URLRequest;
import flash.net.navigateToURL;
import starling.display.Sprite;
import starling.events.Event;

/**
 * This is the welcome or mainMenu menu class for the game.
 */
public class Welcome extends Sprite {

    // Main Menu Component

    /** Program Title. */
    private var title:Label;
    /** Test button. */
    private var testBtn:Button;
    /** About button. */
    private var aboutBtn:Button;
    /** Tutorial button. */
    private var tutorialBtn:Button;

    // About Menu Component

    /** About Title. */
    private var aboutTitle:Label;
    /** About text field. */
    private var aboutText:TextArea;
    /** Starling Framework button. */
    private var starlingBtn:Button;
    /** Back button. */
    private var backBtn:Button;

    // Tutorial Menu Component

    /** Tutorial Title. */
    private var tutorialTitle:Label;
    /** Windows Button. */
    private var windowsButton:Button;
    /** Linux Button. */
    private var linuxButton:Button;
    /** Android Button. */
    private var androidButton:Button;
    /** Hardware Button. */
    private var hardwareButton:Button;

    // Program Component
    /** Screen mode - "welcome" or "about". */
    private var screenMode:String;
    /** Current date. */
    private var _currentDate:Date;
    /** Selected OS for Tutorial. */
    private var selectedOS:String;

    // Menu Component

    /** Layout Setting. */
    private var myLayout:VerticalLayout;
    /** Main Menu Layout. */
    private var mainMenu:LayoutGroup;
    /** About Menu Layout. */
    private var aboutMenu:LayoutGroup;
    /** Tutorial Menu Layout. */
    private var tutorialMenu:LayoutGroup;

    // Tutorial Sub Menu

    /** Windows Menu Tutorial. */
    private var windowsMenu:LayoutGroup;
    /** Linux Menu Tutorial. */
    private var linuxMenu:LayoutGroup;
    /** Android Menu Tutorial. */
    private var androidMenu:LayoutGroup;

    // Constructor

    public function Welcome() {
        super();
        this.visible = false;
        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    // Event Handler

    /**
     * On added to stage.
     * @param event
     */
    private function onAddedToStage(event:Event):void {
        this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

        drawScreen();
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
     * On Test button click.
     * @param event
     */
    private function onTestClick(event:Event):void {
        this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: "play"}, true));

        //sound

        // set to test mode

    }

    /**
     * On Windows Button Click.
     * @param event
     */
    private function onWindowsButtonClick(event:Event):void {
        selectedOS = "Windows";

        showTutorialChooser();
    }

    /**
     * On Linux Button Click.
     * @param event
     */
    private function onLinuxButtonClick(event:Event):void {
        selectedOS = "Linux";

        showTutorialChooser();
    }

    /**
     * On Android Button Click.
     * @param event
     */
    private function onAndroidButtonClick(event:Event):void {
        selectedOS = "Android";

        showTutorialChooser();
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
     * On Tutorial Button Click.
     * @param event
     */
    private function onTutorialButtonClick(event:Event):void {
        showTutorialMenu();
    }

    private function onHardwareButtonClick(event:Event):void {
        showHardwareMenu();
    }

    // Another method

    /**
     * Dispose objects temporarily.
     */
    public function disposeTemporarily():void {
        this.visible = false;

        //if (this.hasEventListener(Event.ENTER_FRAME))
        //this.removeEventListener(Event.ENTER_FRAME, floatingAnimation);

        //setting sound
    }

    /**
     * Draw all the screen elements.
     */
    private function drawScreen():void {
        // Layout Setting
        myLayout = new VerticalLayout();
        mainMenu = new LayoutGroup();
        aboutMenu = new LayoutGroup();
        tutorialMenu = new LayoutGroup();
        myLayout.gap = 5;
        myLayout.horizontalAlign = "center";
        mainMenu.width = stage.stageWidth;
        mainMenu.height = stage.stageHeight;
        aboutMenu.width = stage.stageWidth;
        aboutMenu.height = stage.stageHeight;
        tutorialMenu.width = stage.stageWidth;
        tutorialMenu.height = stage.stageHeight;
        myLayout.firstGap = 10;
        myLayout.lastGap = 5;
        mainMenu.layout = myLayout;
        aboutMenu.layout = myLayout;
        tutorialMenu.layout = myLayout;

        // Main Menu Setting
        title = new Label();
        title.text = "You Can Use It!";
        mainMenu.addChild(title);

        testBtn = new Button();
        testBtn.label = "Test";
        testBtn.width = 400;
        testBtn.addEventListener(Event.TRIGGERED, onTestClick);
        mainMenu.addChild(testBtn);

        tutorialBtn = new Button();
        tutorialBtn.label = "Tutorial";
        tutorialBtn.width = 400;
        tutorialBtn.addEventListener(Event.TRIGGERED, onTutorialButtonClick);
        mainMenu.addChild(tutorialBtn);

        aboutBtn = new Button();
        aboutBtn.label = "About";
        aboutBtn.width = 400;
        aboutBtn.addEventListener(Event.TRIGGERED, onAboutClick);
        mainMenu.addChild(aboutBtn);

        // About Menu
        aboutTitle = new Label();
        aboutTitle.text = "Thank You for Your Support!";
        aboutMenu.addChild(aboutTitle);

        aboutText = new TextArea();
        aboutText.text = "This application for study about your technology."
        aboutText.isEditable = false;
        aboutText.width = 400;
        aboutText.height = 100;
        aboutMenu.addChild(aboutText);

        starlingBtn = new Button();
        starlingBtn.label = "Starling";
        starlingBtn.width = 400;
        starlingBtn.addEventListener(Event.TRIGGERED, onStarlingBtnClick);
        aboutMenu.addChild(starlingBtn);

        backBtn = new Button();
        backBtn.label = "Back";
        backBtn.width = 400;
        backBtn.addEventListener(Event.TRIGGERED, onAboutBackClick);

        // Tutorial Menu Setting
        tutorialTitle = new Label();
        tutorialTitle.text = "Choose OS or want Hardware Tutorial?"
        tutorialMenu.addChild(tutorialTitle);

        windowsButton = new Button();
        windowsButton.label = "Windows";
        windowsButton.width = 400;
        windowsButton.addEventListener(Event.TRIGGERED, onWindowsButtonClick);
        tutorialMenu.addChild(windowsButton);

        linuxButton = new Button();
        linuxButton.label = "Linux";
        linuxButton.width = 400;
        linuxButton.addEventListener(Event.TRIGGERED, onLinuxButtonClick);
        tutorialMenu.addChild(linuxButton);

        androidButton = new Button();
        androidButton.label = "Android";
        androidButton.width = 400;
        androidButton.addEventListener(Event.TRIGGERED, onAndroidButtonClick);
        tutorialMenu.addChild(androidButton);

        hardwareButton = new Button();
        hardwareButton.label = "Hardware";
        hardwareButton.width = 400;
        hardwareButton.addEventListener(Event.TRIGGERED, onHardwareButtonClick);
        tutorialMenu.addChild(hardwareButton);


        // Drawing All
        this.addChild(mainMenu);
        this.addChild(aboutMenu);
        this.addChild(tutorialMenu);
    }

    /**
     * Initialize welcome screen.
     */
    public function initialize():void {
        disposeTemporarily();

        this.visible = true;

        // sound setting

        // Show Main Menu
        screenMode = "welcome";
        mainMenu.visible = true;

        // Hide another menu
        aboutMenu.visible = false;
        tutorialMenu.visible = false;
        //this.addEventListener(Event.ENTER_FRAME, floatingAnimation);
    }

    /**
     * Show about screen.
     */
    public function showAbout():void {
        aboutMenu.addChild(backBtn);

        screenMode = "about";
        mainMenu.visible = false;

        aboutMenu.visible = true;
    }

    /**
     * Show Tutorial Screen Menu.
     */
    public function showTutorialMenu():void {
        tutorialMenu.addChild(backBtn);

        screenMode = "tutorial";
        mainMenu.visible = false;

        tutorialMenu.visible = true;

    }

    /**
     * Tutorial Menu for Software.
     */
    public function showTutorialChooser():void {

    }

    /**
     * Tutorial Menu for Hardware.
     */
    public function showHardwareMenu():void {

    }

    /**
     * Animate floating objects.
     * @param event
     *//*
    private function floatingAnimation(event:Event):void {
        _currentDate = new Date();
        testBtn.y = 50 + (Math.cos(_currentDate.getTime() * 0.002)) * 10;
        aboutBtn.y = 50 + (Math.cos(_currentDate.getTime() * 0.002)) * 10;
    }*/

}
}
