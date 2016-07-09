/**
 * Created by Bervianto Leo P on 14/07/2016.
 */
package youcanuseit.screens.tutorial.windows {
import feathers.controls.Button;
import feathers.controls.Header;
import feathers.controls.ImageLoader;
import feathers.controls.LayoutGroup;
import feathers.controls.PanelScreen;
import feathers.layout.AnchorLayoutData;
import feathers.layout.HorizontalLayoutData;
import feathers.layout.VerticalLayout;
import feathers.layout.VerticalLayoutData;
import feathers.media.FullScreenToggleButton;
import feathers.media.PlayPauseToggleButton;
import feathers.media.SeekSlider;
import feathers.media.TimeLabel;
import feathers.media.VideoPlayer;
import feathers.media.VolumeSlider;
import feathers.system.DeviceCapabilities;

import flash.filesystem.File;
import flash.net.NetConnection;
import starling.core.Starling;
import starling.display.DisplayObject;
import starling.events.Event;


[Event(name="complete",type="starling.events.Event")]
public class ShutdownWindows extends PanelScreen {

    /** Video Player. */
    private var player:VideoPlayer;
    private var loader:ImageLoader;

    public function ShutdownWindows() {
        super();
    }


    override protected function initialize():void {
        super.initialize();

        this.title = "Shutdown Tutorial - Windows";

        var myLayout:VerticalLayout = new VerticalLayout();
        myLayout.gap = 5;
        myLayout.horizontalAlign = "center";

        this.layout = myLayout;

        player = new VideoPlayer();
        player.autoPlay = false;
        player.setSize(300,300);

        var controls:LayoutGroup = new LayoutGroup();
        controls.styleNameList.add( LayoutGroup.ALTERNATE_STYLE_NAME_TOOLBAR );

        var controlsLayoutData:AnchorLayoutData = new AnchorLayoutData();
        controlsLayoutData.left = 0;
        controlsLayoutData.right = 0;
        controlsLayoutData.bottom = 0;
        controls.layoutData = controlsLayoutData;

        var button:PlayPauseToggleButton = new PlayPauseToggleButton();
        controls.addChild(button);

        var slider:SeekSlider = new SeekSlider();
        slider.layoutData = new HorizontalLayoutData(100, 100);
        controls.addChild(slider);

        var label:TimeLabel = new TimeLabel();
        label.displayMode = TimeLabel.DISPLAY_MODE_CURRENT_TIME;
        controls.addChild(label);

        var volume:VolumeSlider = new VolumeSlider();
        controls.addChild(volume);

        var fullscreen:FullScreenToggleButton = new FullScreenToggleButton();
        controls.addChild(fullscreen);

        player.addChild(controls);

        loader = new ImageLoader();
        var viewLayoutData:AnchorLayoutData = new AnchorLayoutData(0, 0, 0, 0);
        viewLayoutData.bottomAnchorDisplayObject = controls;
        loader.layoutData = viewLayoutData;
        player.addChild(loader);

        player.width = 3 * this.stage.stageWidth / 4;
        this.addChild(player);

        player.addEventListener(Event.READY, function(event:Event):void
        {
            loader.source = player.texture;
        });

       // var videoFile:File = File.applicationDirectory.resolvePath("Windows 10 Demo.mp4");
        player.videoSource = "Windows 10 Demo.mp4";//videoFile.url;

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

    private function videoPlayer_readyHandler( event:Event ):void
    {
        loader.source = player.texture;
    }
}
}
