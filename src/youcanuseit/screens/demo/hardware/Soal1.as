/**
 * Created by Bervianto Leo P on 28/07/2016.
 */
package youcanuseit.screens.demo.hardware {
import feathers.controls.ImageLoader;
import feathers.controls.Label;
import feathers.controls.LayoutGroup;
import feathers.dragDrop.IDragSource;
import feathers.dragDrop.IDropTarget;
import feathers.layout.TiledRowsLayout;
import feathers.layout.VerticalAlign;
import feathers.layout.VerticalLayout;

import starling.display.Image;

import starling.events.Event;
import youcanuseit.data.EmbeddedAssets;
import youcanuseit.draggable.DragSource;
import youcanuseit.draggable.DropTarget;
import youcanuseit.event.HardwareTestEvent;


public class Soal1 extends LayoutGroup implements IDragSource, IDropTarget {

    public static const DRAG_FORMAT_USB:String = "draggableUSB";
    public static const DRAG_FORMAT_VGA:String = "draggableVGA";
    public static const DRAG_FORMAT_RJ45:String = "draggableRJ45";
    public static const DRAG_FORMAT_HDMI:String = "draggableHDMI";

    public static var vgaCable:ImageLoader;
    public static var rj45Cable:ImageLoader;
    public static var usbCable:ImageLoader;
    public static var hdmiCable:ImageLoader;

    private var _dragpath1:DragSource;
    private var _dragpath2:DragSource;
    private var _dragpath3:DragSource;
    private var _dragpath4:DragSource;

    private var _droppath1:DropTarget;
    private var _droppath2:DropTarget;
    private var _droppath3:DropTarget;
    private var _droppath4:DropTarget;

    private var _stat1:Boolean;
    private var _stat2:Boolean;
    private var _stat3:Boolean;
    private var _stat4:Boolean;

    private const size:int = 65;

    private var instruction:Label;

    public function Soal1() {
        super();
        this.addEventListener(Event.ADDED_TO_STAGE, onAddedtoStage);
    }

    private function onAddedtoStage(event:Event):void {

        // Config Soal 1 Global Layout
        var globalLayout:VerticalLayout = new VerticalLayout();
        globalLayout.horizontalAlign = "center";
        globalLayout.gap = 5;
        this.layout = globalLayout;

        this.instruction = new Label();
        this.instruction.styleNameList.add(Label.ALTERNATE_STYLE_NAME_HEADING);
        this.instruction.wordWrap = true;
        this.instruction.text = "Drag bottom picture to box below the correct image of port.";
        this.addChild(this.instruction);

        // Main Layout
        var soalContainer:LayoutGroup = new LayoutGroup();

        var myLayout:TiledRowsLayout = new TiledRowsLayout();
        myLayout.requestedColumnCount = 4;
        myLayout.requestedRowCount = 3;
        myLayout.horizontalAlign = "center";
        myLayout.verticalAlign = "middle";
        myLayout.horizontalGap = 10;
        myLayout.verticalGap = 5;
        myLayout.tileHorizontalAlign = "center";
        myLayout.tileVerticalAlign = "middle";

        soalContainer.layout = myLayout;

        var usbPort:Image = new Image(EmbeddedAssets.USB_PORT1);
        usbPort.width = size;
        usbPort.height = size;
        soalContainer.addChild(usbPort);

        var vgaPort:Image = new Image(EmbeddedAssets.VGA_PORT);
        vgaPort.width = size;
        vgaPort.height = size - 25;
        soalContainer.addChild(vgaPort);

        var rj45Port:Image = new Image(EmbeddedAssets.RJ45_LAN_PORT);
        rj45Port.width = size;
        rj45Port.height = size;
        soalContainer.addChild(rj45Port);

        var hdmiPort:Image = new Image(EmbeddedAssets.HDMI_PORT);
        hdmiPort.width = size;
        hdmiPort.height = size - 25;
        soalContainer.addChild(hdmiPort);

        _droppath1 = new DropTarget(DRAG_FORMAT_USB);
        _droppath2 = new DropTarget(DRAG_FORMAT_VGA);
        _droppath3 = new DropTarget(DRAG_FORMAT_RJ45);
        _droppath4 = new DropTarget(DRAG_FORMAT_HDMI);

        _droppath1.width = size;
        _droppath1.height = size;
        _droppath2.width = size;
        _droppath2.height = size;
        _droppath3.width = size;
        _droppath3.height = size;
        _droppath4.width = size;
        _droppath4.height = size;

        soalContainer.addChild(_droppath1);
        soalContainer.addChild(_droppath2);
        soalContainer.addChild(_droppath3);
        soalContainer.addChild(_droppath4);

        _dragpath1 = new DragSource(DRAG_FORMAT_VGA);
        _dragpath2 = new DragSource(DRAG_FORMAT_RJ45);
        _dragpath3 = new DragSource(DRAG_FORMAT_USB);
        _dragpath4 = new DragSource(DRAG_FORMAT_HDMI);

        vgaCable = new ImageLoader();
        vgaCable.source = EmbeddedAssets.VGA_CABLE;
        _dragpath1.width = size;
        _dragpath1.height = size - 25;
        _dragpath1.addChild(vgaCable);

        rj45Cable = new ImageLoader();
        rj45Cable.source = EmbeddedAssets.RJ45_LAN;
        _dragpath2.width = size;
        _dragpath2.height = size - 25;
        _dragpath2.addChild(rj45Cable);

        usbCable = new ImageLoader();
        usbCable.source = EmbeddedAssets.USB1;
        _dragpath3.width = size - 25;
        _dragpath3.height = size;
        _dragpath3.addChild(usbCable);

        hdmiCable = new ImageLoader();
        hdmiCable.source = EmbeddedAssets.HDMI;
        _dragpath4.width = size;
        _dragpath4.height = size - 25;
        _dragpath4.addChild(hdmiCable);

        soalContainer.addChild(_dragpath1);
        soalContainer.addChild(_dragpath2);
        soalContainer.addChild(_dragpath3);
        soalContainer.addChild(_dragpath4);

        this.addChild(soalContainer);

        _droppath1.addEventListener(Event.ADDED, success1);
        _droppath2.addEventListener(Event.ADDED, success2);
        _droppath3.addEventListener(Event.ADDED, success3);
        _droppath4.addEventListener(Event.ADDED, success4);
    }

    private function success1(event:Event):void {
        _stat1 = true;
        if (isFinished()) {
            dispatchEvent(new HardwareTestEvent(HardwareTestEvent.FINISHED, "soal1", true));
        }
    }

    private function success2(event:Event):void {
        _stat2 = true;
        if (isFinished()) {
            dispatchEvent(new HardwareTestEvent(HardwareTestEvent.FINISHED, "soal1", true));
        }
    }

    private function success3(event:Event):void {
        _stat3 = true;
        if (isFinished()) {
            dispatchEvent(new HardwareTestEvent(HardwareTestEvent.FINISHED, "soal1", true));
        }
    }

    private function success4(event:Event):void {
        _stat4 = true;
        if (isFinished()) {
            dispatchEvent(new HardwareTestEvent(HardwareTestEvent.FINISHED, "soal1", true));
        }
    }

    private function isFinished():Boolean {
        if (_stat1 && _stat2 && _stat3 && _stat4) {
            return true;
        } else {
            return false;
        }
    }

}
}
