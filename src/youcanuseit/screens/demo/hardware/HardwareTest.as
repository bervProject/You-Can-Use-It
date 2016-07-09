/**
 * Created by Bervianto Leo P on 14/07/2016.
 */
package youcanuseit.screens.demo.hardware {
import feathers.controls.Button;
import feathers.controls.Header;
import feathers.controls.LayoutGroup;
import feathers.controls.PanelScreen;
import feathers.controls.TabBar;
import feathers.data.ListCollection;
import feathers.dragDrop.IDragSource;
import feathers.dragDrop.IDropTarget;
import feathers.layout.AnchorLayout;
import feathers.system.DeviceCapabilities;
import starling.core.Starling;
import starling.display.DisplayObject;
import starling.events.Event;


[Event(name="complete",type="starling.events.Event")]
public class HardwareTest extends PanelScreen implements IDragSource, IDropTarget {

    private static const DRAG_FORMAT:String = "draggableQuad";

    /** TabBar. */
    private var _tabs:TabBar;

    private var _soal1:LayoutGroup;
    private var _soal2:LayoutGroup;

    public var soal1stat:Boolean;
    public var soal2stat:Boolean;
    public var soal3stat:Boolean;
    public var soal4stat:Boolean;
    public var soal5stat:Boolean;

    public function HardwareTest() {
        super();
    }

    override protected function initialize():void {
        //never forget to call super.initialize()
        super.initialize();

        this.title = "Hardware Test";

        this.layout = new AnchorLayout();

        this._tabs = new TabBar();
        this._tabs.dataProvider = new ListCollection(
                [
                    { label: "1" },
                    { label: "2" },
                    { label: "3" },
                    { label: "4" },
                    { label: "5" },
                ]);
        this._tabs.width = stage.stageWidth;
        this._tabs.addEventListener(Event.CHANGE, tabs_changeHandler);
        this.addChild(this._tabs);

        _soal1 = new Soal1();
        _soal2 = new Soal2();
        //_soal3 = new Soal3();
        //_soal4 = new Soal4();
        //_soal5 = new Soal5();

        this.addChild(_soal1);
        this.addChild(_soal2);
        //this.addChild(_soal3);
        //this.addChild(_soal4);
        //this.addChild(_soal5);

        _soal2.visible = false;
        //_soal3.visible = false;
       // _soal4.visible = false;
       // _soal5.visible = false;


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
     * @return
     */
    private function customHeaderFactory():Header {
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
    private function onBackButton():void {
        this.dispatchEventWith(Event.COMPLETE);
    }

    /**
     * TabBar change handler.
     * @param event
     */
    private function tabs_changeHandler(event:Event):void {
        trace("selectedIndex:", _tabs.selectedIndex);

        hideall();
        if (_tabs.selectedIndex == 0) {
            _soal1.visible = true;
        } else if (_tabs.selectedIndex == 1) {
            _soal2.visible = true;
        } else if (_tabs.selectedIndex == 2) {
            //_soal3.visible = true;
        } else if (_tabs.selectedIndex == 3) {
            //_soal4.visible = true;
        } else if (_tabs.selectedIndex == 4) {
           // _soal5.visible = true;
        } else {

        }

    }

    /**
     * Back button trigerred.
     * @param event
     */
    private function backButton_triggeredHandler(event:Event):void {
        this.onBackButton();
    }

    private function hideall():void {
        _soal1.visible = false;
        _soal2.visible = false;
       // _soal3.visible = false;
       // _soal4.visible = false;
     //   _soal5.visible = false;
    }

}
}
