/**
 * Created by Bervianto Leo P on 28/07/2016.
 */
package youcanuseit.screens.demo.hardware {
import feathers.controls.ImageLoader;
import feathers.controls.LayoutGroup;
import feathers.dragDrop.IDragSource;
import feathers.dragDrop.IDropTarget;
import feathers.layout.TiledRowsLayout;

import starling.display.Image;

import starling.events.Event;
import youcanuseit.data.EmbeddedAssets;
import youcanuseit.draggable.DragSource;
import youcanuseit.draggable.DropTarget;


public class Soal1 extends LayoutGroup implements IDragSource, IDropTarget {

    public static const DRAG_FORMAT_USB:String = "draggableUSB";
    public static const DRAG_FORMAT_VGA:String = "draggableVGA";
    public static const DRAG_FORMAT_RJ45:String = "draggableRJ45";
    public static const DRAG_FORMAT_HDMI:String = "draggableHDMI";

    private var _dragpath1:DragSource;
    private var _dragpath2:DragSource;
    private var _dragpath3:DragSource;
    private var _dragpath4:DragSource;

    private var _droppath1:DropTarget;
    private var _droppath2:DropTarget;
    private var _droppath3:DropTarget;
    private var _droppath4:DropTarget;

    public function Soal1() {
        super();
        this.addEventListener(Event.ADDED_TO_STAGE, onAddedtoStage);
    }

    private function onAddedtoStage(event:Event):void {

        // Config Layout

        var myLayout:TiledRowsLayout = new TiledRowsLayout();
        myLayout.requestedColumnCount = 4;
        myLayout.requestedRowCount = 3;
        myLayout.horizontalAlign = "center";
        myLayout.verticalAlign = "middle";
        myLayout.horizontalGap = 10;
        myLayout.verticalGap = 10;
        myLayout.tileHorizontalAlign = "center";
        myLayout.tileVerticalAlign = "middle";

        this.layout = myLayout;

        var usbPort:Image = new Image(EmbeddedAssets.USB_PORT1);
        usbPort.width = 100;
        usbPort.height = 100;
        this.addChild(usbPort);

        var vgaPort:Image = new Image(EmbeddedAssets.VGA_PORT);
        vgaPort.width = 100;
        vgaPort.height = 50;
        this.addChild(vgaPort);

        var rj45Port:Image = new Image(EmbeddedAssets.RJ45_LAN_PORT);
        rj45Port.width = 100;
        rj45Port.height = 100;
        this.addChild(rj45Port);

        var hdmiPort:Image = new Image(EmbeddedAssets.HDMI_PORT);
        hdmiPort.width = 100;
        hdmiPort.height = 75;
        this.addChild(hdmiPort);

        _droppath1 = new DropTarget(DRAG_FORMAT_USB);
        _droppath2 = new DropTarget(DRAG_FORMAT_VGA);
        _droppath3 = new DropTarget(DRAG_FORMAT_RJ45);
        _droppath4 = new DropTarget(DRAG_FORMAT_HDMI);

        _droppath1.width = 100;
        _droppath1.height = 100;
        _droppath2.width = 100;
        _droppath2.height = 100;
        _droppath3.width = 100;
        _droppath3.height = 100;
        _droppath4.width = 100;
        _droppath4.height = 100;

        this.addChild(_droppath1);
        this.addChild(_droppath2);
        this.addChild(_droppath3);
        this.addChild(_droppath4);

        _dragpath1 = new DragSource(DRAG_FORMAT_VGA);
        _dragpath2 = new DragSource(DRAG_FORMAT_RJ45);
        _dragpath3 = new DragSource(DRAG_FORMAT_USB);
        _dragpath4 = new DragSource(DRAG_FORMAT_HDMI);

        var vgaCable:Image = new Image(EmbeddedAssets.VGA_CABLE);
        vgaCable.width = 100;
        vgaCable.height = 100;
        _dragpath1.width = vgaCable.width;
        _dragpath1.height = vgaCable.height;
        _dragpath1.addChild(vgaCable);

        var rj45Cable:Image = new Image(EmbeddedAssets.RJ45_LAN);
        rj45Cable.width = 100;
        rj45Cable.height = 100;
        _dragpath2.width = rj45Cable.width;
        _dragpath2.height = rj45Cable.height;
        _dragpath2.addChild(rj45Cable);

        var usbCable:Image = new Image(EmbeddedAssets.USB1);
        usbCable.width = 100;
        usbCable.height = 100;
        _dragpath3.width = usbCable.width;
        _dragpath3.height = usbCable.height;
        _dragpath3.addChild(usbCable);

        var hdmiCable:Image = new Image(EmbeddedAssets.HDMI);
        hdmiCable.width = 100;
        hdmiCable.height = 100;
        _dragpath4.width = hdmiCable.width;
        _dragpath4.height = hdmiCable.height;
        _dragpath4.addChild(hdmiCable);

        this.addChild(_dragpath1);
        this.addChild(_dragpath2);
        this.addChild(_dragpath3);
        this.addChild(_dragpath4);
    }


}
}
