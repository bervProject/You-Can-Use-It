/**
 * Created by Bervianto Leo P on 13/07/2016.
 */
package youcanuseit.screens {
import feathers.controls.Button;
import feathers.controls.ButtonState;
import feathers.controls.Header;
import feathers.controls.Label;
import feathers.controls.LayoutGroup;
import feathers.controls.PanelScreen;
import feathers.controls.ScrollText;
import feathers.controls.TextArea;
import feathers.layout.AnchorLayoutData;
import feathers.layout.HorizontalLayout;
import feathers.layout.VerticalLayout;
import feathers.system.DeviceCapabilities;

import flash.net.URLRequest;

import flash.net.navigateToURL;

import starling.core.Starling;
import starling.display.DisplayObject;
import starling.display.Image;
import starling.events.Event;

import youcanuseit.data.EmbeddedAssets;

[Event(name="complete",type="starling.events.Event")]

public class AboutScreen extends PanelScreen {

    /** Credits. */
    private var _aboutText:TextArea;

    /** Starling Button. */
    private var _starlingButton:Button;

    /** Feathers UI Button.*/
    private var _featherUIButton:Button;
    
    public function AboutScreen() {
        super();
    }

    override protected function initialize():void
    {
        //never forget to call super.initialize()
        super.initialize();

        this.title = "About";

        var myLayout:VerticalLayout = new VerticalLayout();
        myLayout.gap = 5;
        myLayout.horizontalAlign = "center";

        var thanksToContainer:LayoutGroup = new LayoutGroup();
        var thanksToLayout:HorizontalLayout = new HorizontalLayout();
        thanksToLayout.gap = 5;
        thanksToContainer.layout = thanksToLayout;

        this.layout = myLayout;

        this._aboutText = new TextArea();
        this._aboutText.text = "You Can Use It 0.1\n" +
                "\nThis application will make you know about your technology.\n" +
                "\nCreated by : Bervianto Leo Pratama";
        this._aboutText.isEditable = false;
        this._aboutText.width = 450;
        this._aboutText.height = 130;
        this._aboutText.padding = 15;
        this.addChild(this._aboutText);

        var thanksTo:Label = new Label();
        thanksTo.text = "Thanks To";
        this.addChild(thanksTo);

        this._starlingButton = new Button();
        this._starlingButton.setSkinForState(ButtonState.UP, new Image(EmbeddedAssets.STARLING_TEXTURE_DARK));
        this._starlingButton.setSkinForState(ButtonState.DOWN, new Image(EmbeddedAssets.STARLING_TEXTURE_DARK));
        this._starlingButton.setSkinForState(ButtonState.HOVER, new Image(EmbeddedAssets.STARLING_TEXTURE_DARK));
        this._starlingButton.addEventListener(Event.TRIGGERED, onClickStarlingButton);
        thanksToContainer.addChild(_starlingButton);

        this._featherUIButton = new Button();
        this._featherUIButton.setSkinForState(ButtonState.UP, new Image(EmbeddedAssets.FEATHERS_UI_LOGO));
        this._featherUIButton.setSkinForState(ButtonState.DOWN, new Image(EmbeddedAssets.FEATHERS_UI_LOGO));
        this._featherUIButton.setSkinForState(ButtonState.HOVER, new Image(EmbeddedAssets.FEATHERS_UI_LOGO));
        this._featherUIButton.addEventListener(Event.TRIGGERED, onClickFeatherUIButton);
        thanksToContainer.addChild(_featherUIButton);

        this.addChild(thanksToContainer);

        this.headerFactory = this.customHeaderFactory;

        //this screen doesn't use a back button on tablets because the main
        //app's uses a split layout
        if(!DeviceCapabilities.isTablet(Starling.current.nativeStage))
        {
            this.backButtonHandler = this.onBackButton;
        }
    }

    /**
     * Customize Header.
     * @return header
     */
    private function customHeaderFactory():Header
    {
        var header:Header = new Header();
        //this screen doesn't use a back button on tablets because the main
        //app's uses a split layout
        if(!DeviceCapabilities.isTablet(Starling.current.nativeStage))
        {
            var backButton:Button = new Button();
            backButton.styleNameList.add(Button.ALTERNATE_STYLE_NAME_BACK_BUTTON);
            backButton.label = "Back";
            backButton.addEventListener(Event.TRIGGERED, backButton_triggeredHandler);
            header.leftItems = new <DisplayObject>
                    [
                        backButton
                    ];
        }
        return header;
    }

    /**
     * Back button method.
     */
    private function onBackButton():void
    {
        this.dispatchEventWith(Event.COMPLETE);
    }

    /**
     * Back button triggered.
     * @param event
     */
    private function backButton_triggeredHandler(event:Event):void
    {
        this.onBackButton();
    }

    /** 
     * Starling Button Clicked.
     * @param event
     */
    private function onClickStarlingButton(event:Event): void {
        navigateToURL(new URLRequest("http://www.gamua.com/starling/"));
    }

    /**
     * Feathers UI Button Clicked.
     * @param event
     */
    private function onClickFeatherUIButton(event:Event):void {
        navigateToURL(new URLRequest("http://www.feathersui.com"));
    }
}
}
