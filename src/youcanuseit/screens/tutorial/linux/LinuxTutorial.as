/**
 * Created by Bervianto Leo P on 14/07/2016.
 */
package youcanuseit.screens.tutorial.linux {
import feathers.controls.Button;
import feathers.controls.Header;
import feathers.controls.List;
import feathers.controls.PanelScreen;
import feathers.controls.renderers.DefaultListItemRenderer;
import feathers.controls.renderers.IListItemRenderer;
import feathers.data.ListCollection;
import feathers.events.FeathersEventType;
import feathers.layout.AnchorLayout;
import feathers.layout.AnchorLayoutData;
import feathers.system.DeviceCapabilities;

import starling.core.Starling;
import starling.display.DisplayObject;
import starling.events.Event;

import youcanuseit.screens.ScreenID;

[Event(name="change", type="starling.events.Event")]

[Event(name="complete",type="starling.events.Event")]

public class LinuxTutorial extends PanelScreen {
    /** List of Linux Tutorial Menu. */
    private var _list:List;

    /** Saved Vertical Scroll Position. */
    public var savedVerticalScrollPosition:Number = 0;

    /** Saved Selected Index. */
    public var savedSelectedIndex:int = -1;

    /** Selected Screen ID. */
    private var _selectedScreenID:String = null;

    public function LinuxTutorial() {
        super();
    }

    public function get selectedScreenID():String {
        return this._selectedScreenID;
    }

    override protected function initialize():void {
        super.initialize();

        this.title = "Linux Tutorial";

        this.layout = new AnchorLayout();

        this._list = new List();
        this._list.dataProvider = new ListCollection([
            {label: "Shutdown Tutorial", screen: ScreenID.LINUX_SHUTDOWN },
            {label: "Opening File Tutorial", screen: ScreenID.LINUX_OPENING_FILE },
        ]);

        this._list.layoutData = new AnchorLayoutData(0, 0, 0, 0);
        this._list.clipContent = false;
        this._list.autoHideBackground = true;
        this._list.verticalScrollPosition = this.savedVerticalScrollPosition;

        this._list.itemRendererFactory = this.createItemRenderer;

        var isTablet:Boolean = DeviceCapabilities.isTablet(Starling.current.nativeStage);
        if(isTablet)
        {
            this._list.addEventListener(Event.CHANGE, list_changeHandler);
            this._list.selectedIndex = 0;
            this._list.revealScrollBars();
        }
        else
        {
            this._list.selectedIndex = this.savedSelectedIndex;
            this.addEventListener(FeathersEventType.TRANSITION_IN_COMPLETE, transitionInCompleteHandler);
        }
        this.addChild(this._list);

        this.headerFactory = this.customHeaderFactory;

        //this screen doesn't use a back button on tablets because the main
        //app's uses a split layout
        if(!DeviceCapabilities.isTablet(Starling.current.nativeStage))
        {
            this.backButtonHandler = this.onBackButton;
        }
    }

    /**
     * Render Item List.
     * @return Item List
     */
    private function createItemRenderer():IListItemRenderer {
        var isTablet:Boolean = DeviceCapabilities.isTablet(Starling.current.nativeStage);

        var renderer:DefaultListItemRenderer = new DefaultListItemRenderer();
        if(!isTablet)
        {
            renderer.styleNameList.add(DefaultListItemRenderer.ALTERNATE_STYLE_NAME_DRILL_DOWN);
        }

        //enable the quick hit area to optimize hit tests when an item
        //is only selectable and doesn't have interactive children.
        renderer.isQuickHitAreaEnabled = true;

        renderer.labelField = "label";
        return renderer;
    }

    /**
     * Transition Handler.
     * @param event
     */
    private function transitionInCompleteHandler(event:Event):void
    {
        if(!DeviceCapabilities.isTablet(Starling.current.nativeStage))
        {
            this._list.selectedIndex = -1;
            this._list.addEventListener(Event.CHANGE, list_changeHandler);
        }
        this._list.revealScrollBars();
    }

    /**
     * List change handler.
     * @param event
     */
    private function list_changeHandler(event:Event):void
    {
        this._selectedScreenID = this._list.selectedItem.screen as String;
        if(DeviceCapabilities.isTablet(Starling.current.nativeStage))
        {
            this.dispatchEventWith(Event.CHANGE);
            return;
        }

        //save the list's scroll position and selected index so that we
        //can restore some context when this screen when we return to it
        //again later.
        this.dispatchEventWith(Event.CHANGE, false,
                {
                    savedVerticalScrollPosition: this._list.verticalScrollPosition,
                    savedSelectedIndex: this._list.selectedIndex
                });
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
}
}
