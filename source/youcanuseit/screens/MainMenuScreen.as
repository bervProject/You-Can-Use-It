/**
 * Created by Bervianto Leo P on 13/07/2016.
 */
package youcanuseit.screens {
import feathers.controls.List;
import feathers.controls.PanelScreen;
import feathers.controls.renderers.DefaultListItemRenderer;
import feathers.controls.renderers.IListItemRenderer;
import feathers.data.ListCollection;
import feathers.events.FeathersEventType;
import feathers.layout.AnchorLayout;
import feathers.layout.AnchorLayoutData;
import feathers.system.DeviceCapabilities;

import flash.system.Capabilities;

import starling.core.Starling;
import starling.events.Event;

public class MainMenuScreen extends PanelScreen {

    /** List of Main Menu. */
    private var _list:List;

    /** Saved Vertical Scroll Position. */
    public var savedVerticalScrollPosition:Number = 0;

    /** Saved Selected Index. */
    public var savedSelectedIndex:int = -1;

    /** Selected Screen ID. */
    private var _selectedScreenID:String = null;
    
    public function MainMenuScreen()
    {
        super();
    }

    /**
     * Getter selected ScreenID.
     */
    public function get selectedScreenID():String {
        return this._selectedScreenID;
    }
    
    override protected function initialize():void {
        super.initialize();

        this.title = "You Can Use It";

        this.layout = new AnchorLayout();

        this._list = new List();
        this._list.dataProvider = new ListCollection(
                [
                    { label: "Test Mode", screen: ScreenID.TEST },
                    { label: "Tutorial", screen: ScreenID.TUTORIAL },
                    { label: "About", screen: ScreenID.ABOUT },
                ]
        );
        if(Capabilities.playerType == "Desktop") //this means AIR, even for mobile
        {
            this._list.dataProvider.addItem( { label: "Web View", screen: ScreenID.WEB_VIEW } );
        }
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
}
}
