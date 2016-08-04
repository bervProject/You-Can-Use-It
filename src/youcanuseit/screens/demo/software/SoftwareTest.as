/**
 * Created by Bervianto Leo P on 14/07/2016.
 */
package youcanuseit.screens.demo.software {
import feathers.controls.Button;
import feathers.controls.Header;
import feathers.controls.ImageLoader;
import feathers.controls.LayoutGroup;
import feathers.controls.PageIndicator;
import feathers.controls.PanelScreen;
import feathers.controls.TabBar;
import feathers.data.ListCollection;
import feathers.layout.AnchorLayout;
import feathers.layout.AnchorLayoutData;
import feathers.system.DeviceCapabilities;

import starling.core.Starling;
import starling.display.DisplayObject;
import starling.events.Event;

import youcanuseit.data.EmbeddedAssets;
import youcanuseit.event.TestEvent;

[Event(name="complete",type="starling.events.Event")]
public class SoftwareTest extends PanelScreen {

    /** Tab Bar. */
    private var _tabs:TabBar;

    private var _soal1:LayoutGroup;
    private var _soal2:LayoutGroup;
    private var _soal3:LayoutGroup;
    private var _soal4:LayoutGroup;
    private var _soal5:LayoutGroup;

    public static var soal1stat:ImageLoader;
    public static var soal2stat:ImageLoader;
    public static var soal3stat:ImageLoader;
    public static var soal4stat:ImageLoader;
    public static var soal5stat:ImageLoader;

    public static var _soal1stat:Boolean;
    public static var _soal2stat:Boolean;
    public static var _soal3stat:Boolean;
    public static var _soal4stat:Boolean;
    public static var _soal5stat:Boolean;

    public function SoftwareTest() {
        super();
    }

    override protected function initialize():void
    {
        //never forget to call super.initialize()
        super.initialize();

        this.title = "Software Test";

        this.layout = new AnchorLayout();

        _soal1 = new LayoutGroup();
        _soal2 = new LayoutGroup();
        _soal3 = new LayoutGroup();
        _soal4 = new LayoutGroup();
        _soal5 = new LayoutGroup();

        var centeredLayoutData:AnchorLayoutData = new AnchorLayoutData();
        centeredLayoutData.horizontalCenter = 0;

        _soal1.layoutData = centeredLayoutData;
        _soal2.layoutData = centeredLayoutData;
        _soal3.layoutData = centeredLayoutData;
        _soal4.layoutData = centeredLayoutData;
        _soal5.layoutData = centeredLayoutData;

        this.addChild(_soal1);
        this.addChild(_soal2);
        this.addChild(_soal3);
        this.addChild(_soal4);
        this.addChild(_soal5);

        _soal2.visible = false;
        _soal3.visible = false;
        _soal4.visible = false;
        _soal5.visible = false;

        this.headerFactory = this.customHeaderFactory;
        this.footerFactory = this.customFooterFactory;

        //this screen doesn't use a back button on tablets because the main
        //app's uses a split layout
        if(!DeviceCapabilities.isTablet(Starling.current.nativeStage))
        {
            this.backButtonHandler = this.onBackButton;
        }
    }

    private function onFinished(event:TestEvent):void {

        if (event.finished == "soal1") {
            soal1stat.source = EmbeddedAssets.SUCCESS;
            _soal1stat = true;
        } else if (event.finished == "soal2") {
            soal2stat.source = EmbeddedAssets.SUCCESS;
            _soal2stat = true;
        } else if (event.finished == "soal3") {
            soal3stat.source = EmbeddedAssets.SUCCESS;
            _soal3stat = true;
        } else if (event.finished == "soal4") {
            soal4stat.source = EmbeddedAssets.SUCCESS;
            _soal4stat = true;
        } else if (event.finished == "soal5") {
            soal5stat.source = EmbeddedAssets.SUCCESS;
            _soal5stat = true;
        } else {

        }

        if (_soal1stat && _soal2stat && _soal3stat && _soal4stat && _soal5stat) {
            // Pop up Complete
        }
    }

    /**
     * Customize Header.
     * @return
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

    private function customFooterFactory():LayoutGroup
    {
        var footer:LayoutGroup = new LayoutGroup();
        footer.styleNameList.add(LayoutGroup.ALTERNATE_STYLE_NAME_TOOLBAR);

        this._tabs = new TabBar();
        this._tabs.dataProvider = new ListCollection(
                [
                    { label: "1" },
                    { label: "2" },
                    { label: "3" },
                    { label: "4" },
                    { label: "5" },
                ]);
        //  this._tabs.width = stage.stageWidth;
        this._tabs.addEventListener(Event.CHANGE, tabs_changeHandler);
        footer.addChild(this._tabs);

        soal1stat = new ImageLoader();
        soal2stat = new ImageLoader();
        soal3stat = new ImageLoader();
        soal4stat = new ImageLoader();
        soal5stat = new ImageLoader();

        soal1stat.source = EmbeddedAssets.FALSE;
        soal2stat.source = EmbeddedAssets.FALSE;
        soal3stat.source = EmbeddedAssets.FALSE;
        soal4stat.source = EmbeddedAssets.FALSE;
        soal5stat.source = EmbeddedAssets.FALSE;

        footer.addChild(soal1stat);
        footer.addChild(soal2stat);
        footer.addChild(soal3stat);
        footer.addChild(soal4stat);
        footer.addChild(soal5stat);

        return footer;
    }

    /**
     * Back button method.
     */
    private function onBackButton():void
    {
        this.dispatchEventWith(Event.COMPLETE);
    }

    /**
     * TabBar change handler.
     * @param event
     */
    private function tabs_changeHandler(event:Event):void
    {
        trace("selectedIndex:", _tabs.selectedIndex);

        hideall();
        if (_tabs.selectedIndex == 0) {
            this.scrollToPosition(0,0,0);
            this._soal1.visible = true;
        } else if (_tabs.selectedIndex == 1) {
            this.scrollToPosition(0,0,0);
            this._soal2.visible = true;
        } else if (_tabs.selectedIndex == 2) {
            this.scrollToPosition(0,0,0);
            this._soal3.visible = true;
        } else if (_tabs.selectedIndex == 3) {
            this.scrollToPosition(0,0,0);
            this._soal4.visible = true;
        } else if (_tabs.selectedIndex == 4) {
            this.scrollToPosition(0,0,0);
            this._soal5.visible = true;
        } else {

        }
    }

    /**
     * Back button trigerred.
     * @param event
     */
    private function backButton_triggeredHandler(event:Event):void
    {
        this.onBackButton();
    }

    private function hideall():void {
        _soal1.visible = false;
        _soal2.visible = false;
        _soal3.visible = false;
        _soal4.visible = false;
        _soal5.visible = false;
    }
}
}
