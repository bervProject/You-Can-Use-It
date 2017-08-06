/**
 * Created by Bervianto Leo P on 26/05/2016.
 */
package main.youcanuseit {

import feathers.controls.Drawers;
import feathers.controls.StackScreenNavigator;
import feathers.controls.StackScreenNavigatorItem;
import feathers.layout.Orientation;
import feathers.motion.Slide;
import feathers.system.DeviceCapabilities;
import feathers.themes.MetalWorksMobileTheme;

import main.youcanuseit.data.EmbeddedAssets;
import main.youcanuseit.screens.AboutScreen;
import main.youcanuseit.screens.MainMenuScreen;
import main.youcanuseit.screens.ScreenID;
import main.youcanuseit.screens.TestMenu;
import main.youcanuseit.screens.TutorialMenu;
import main.youcanuseit.screens.demo.hardware.HardwareTest;
import main.youcanuseit.screens.demo.software.SoftwareTest;
import main.youcanuseit.screens.tutorial.android.AndroidTutorial;
import main.youcanuseit.screens.tutorial.hardware.HardwareTutorial;
import main.youcanuseit.screens.tutorial.linux.LinuxTutorial;
import main.youcanuseit.screens.tutorial.windows.ShutdownWindows;
import main.youcanuseit.screens.tutorial.windows.WindowsTutorial;

import starling.core.Starling;
import starling.events.Event;

public class Main extends Drawers {

    /** Stack Screen Navigator. */
    private var _navigator:StackScreenNavigator;

    /** Main Menu Object. */
    private var _menu:MainMenuScreen;

    public function Main() {
        //Setup FeatherUI Themes
        new MetalWorksMobileTheme();

        super();
    }

    override protected function initialize():void {
        super.initialize();

        EmbeddedAssets.initialize();

        this._navigator = new StackScreenNavigator();
        this.content = this._navigator;

        // ABOUT CONTENT

        var aboutItem:StackScreenNavigatorItem = new StackScreenNavigatorItem(AboutScreen);
        aboutItem.addPopEvent(Event.COMPLETE);
        this._navigator.addScreen(ScreenID.ABOUT, aboutItem);

        // TEST MENU AND CONTENT
        var softwareTestItem:StackScreenNavigatorItem = new StackScreenNavigatorItem(SoftwareTest);
        softwareTestItem.addPopEvent(Event.COMPLETE);
        this._navigator.addScreen(ScreenID.SOFTWARE_TEST, softwareTestItem);

        var hardwareTestItem:StackScreenNavigatorItem = new StackScreenNavigatorItem(HardwareTest);
        hardwareTestItem.addPopEvent(Event.COMPLETE);
        this._navigator.addScreen(ScreenID.HARDWARE_TEST, hardwareTestItem);

        var testModeItem:StackScreenNavigatorItem = new StackScreenNavigatorItem(TestMenu);
        testModeItem.addPopEvent(Event.COMPLETE);
        testModeItem.setFunctionForPushEvent(Event.CHANGE, testMenuChange);
        this._navigator.addScreen(ScreenID.TEST, testModeItem);

        // TUTORIAL MENU AND CONTENT

        var tutorialMenuItem:StackScreenNavigatorItem = new StackScreenNavigatorItem(TutorialMenu);
        tutorialMenuItem.addPopEvent(Event.COMPLETE);
        tutorialMenuItem.setFunctionForPushEvent(Event.CHANGE, tutorialMenuChange);
        this._navigator.addScreen(ScreenID.TUTORIAL, tutorialMenuItem);

        var androidTutorialMenuItem:StackScreenNavigatorItem = new StackScreenNavigatorItem(AndroidTutorial);
        androidTutorialMenuItem.addPopEvent(Event.COMPLETE);
        this._navigator.addScreen(ScreenID.ANDROID_TUTORIAL, androidTutorialMenuItem);

        // ANDROID DETAIL

        var hardwareTutorialMenuItem:StackScreenNavigatorItem = new StackScreenNavigatorItem(HardwareTutorial);
        hardwareTutorialMenuItem.addPopEvent(Event.COMPLETE);
        this._navigator.addScreen(ScreenID.HARDWARE_TUTORIAL, hardwareTutorialMenuItem);

        // HARDWARE DETAIL

        var linuxTutorialMenuItem:StackScreenNavigatorItem = new StackScreenNavigatorItem(LinuxTutorial);
        linuxTutorialMenuItem.addPopEvent(Event.COMPLETE);
        this._navigator.addScreen(ScreenID.LINUX_TUTORIAL, linuxTutorialMenuItem);

        // LINUX DETAIL

        var windowsTutorialMenuItem:StackScreenNavigatorItem = new StackScreenNavigatorItem(WindowsTutorial);
        windowsTutorialMenuItem.addPopEvent(Event.COMPLETE);
        windowsTutorialMenuItem.setFunctionForPushEvent(Event.CHANGE, windowsTutorialMenuChange);
        this._navigator.addScreen(ScreenID.WINDOWS_TUTORIAL, windowsTutorialMenuItem);

        // WINDOWS DETAIL
        var shutdownWindowsItem:StackScreenNavigatorItem = new StackScreenNavigatorItem(ShutdownWindows);
        shutdownWindowsItem.addPopEvent(Event.COMPLETE);
        this._navigator.addScreen(ScreenID.WINDOWS_SHUTDOWN, shutdownWindowsItem);

        if (DeviceCapabilities.isTablet(Starling.current.nativeStage)) {
            //we don't want the screens bleeding outside the navigator's
            //bounds on top of a drawer when a transition is active, so
            //enable clipping.
            this._navigator.clipContent = true;
            this._menu = new MainMenuScreen();
            this._menu.addEventListener(Event.CHANGE, mainMenu_tabletChangeHandler);
            this._menu.height = 200;
            this.leftDrawer = this._menu;
            this.leftDrawerDockMode = Orientation.BOTH;
        }
        else {
            var mainMenuItem:StackScreenNavigatorItem = new StackScreenNavigatorItem(MainMenuScreen);
            mainMenuItem.setFunctionForPushEvent(Event.CHANGE, mainMenu_phoneChangeHandler);
            this._navigator.addScreen(ScreenID.MAIN_MENU, mainMenuItem);
            this._navigator.rootScreenID = ScreenID.MAIN_MENU;
        }

        this._navigator.pushTransition = Slide.createSlideLeftTransition();
        this._navigator.popTransition = Slide.createSlideRightTransition();
    }

    /**
     * Main menu change handler.
     * @param event
     */
    private function mainMenu_phoneChangeHandler(event:Event):void {
        //when MainMenuScreen dispatches Event.CHANGE, its selectedScreenID
        //property has been updated. use that to show the correct screen.
        var screen:MainMenuScreen = MainMenuScreen(event.currentTarget);
        this._navigator.pushScreen(screen.selectedScreenID, event.data);
        //pass the data from the event to save it for when we pop back.
    }

    /**
     * Main menu change handler.
     * @param event
     */
    private function mainMenu_tabletChangeHandler(event:Event):void {
        //since this navigation is triggered by an external menu, we don't
        //want to push a new screen onto the stack. we want to start fresh.
        var screen:MainMenuScreen = MainMenuScreen(event.currentTarget);
        this._navigator.rootScreenID = screen.selectedScreenID;
    }

    /**
     * Test menu change handler.
     * @param event
     */
    private function testMenuChange(event:Event):void {
        var screen:TestMenu = TestMenu(event.currentTarget);
        this._navigator.pushScreen(screen.selectedScreenID, event.data);
    }

    /**
     * Tutorial menu change handler.
     * @param event
     */
    private function tutorialMenuChange(event:Event):void {
        var screen:TutorialMenu = TutorialMenu(event.currentTarget);
        this._navigator.pushScreen(screen.selectedScreenID, event.data);
    }


    private function windowsTutorialMenuChange(event:Event):void {
        var screen:WindowsTutorial = WindowsTutorial(event.currentTarget);
        this._navigator.pushScreen(screen.selectedScreenID, event.data);
    }
}
}