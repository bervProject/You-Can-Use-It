/**
 * Created by Bervianto Leo P on 28/07/2016.
 */
package youcanuseit.screens.demo.hardware {
import feathers.controls.ImageLoader;
import feathers.controls.LayoutGroup;
import feathers.dragDrop.IDragSource;
import feathers.dragDrop.IDropTarget;
import starling.events.Event;
import youcanuseit.data.EmbeddedAssets;
import youcanuseit.draggable.USBCable;
import youcanuseit.draggable.USBPort;
import youcanuseit.draggable.VGACable;
import youcanuseit.draggable.VGAPort;

public class Soal1 extends LayoutGroup implements IDragSource, IDropTarget {

    private static const DRAG_FORMAT_USB:String = "draggableUSB";
    private static const DRAG_FORMAT_VGA:String = "draggableVGA";

    private var _usbcable:USBCable;
    private var _usbport:USBPort;
    private var _dragusb:ImageLoader;

    private var _dragvga:ImageLoader;
    private var _vgacable:VGACable;
    private var _vgaport:VGAPort;


    public function Soal1() {
        super();
        this.addEventListener(Event.ADDED_TO_STAGE, onAddedtoStage);
    }

    private function onAddedtoStage(event:Event):void {
        this._dragusb = new ImageLoader();
        this._dragusb.source = EmbeddedAssets.USB1;

        this._dragvga = new ImageLoader();
        this._dragvga.source = EmbeddedAssets.VGA_CABLE;

        this._usbcable = new USBCable(DRAG_FORMAT_USB);
        this._usbcable.width = EmbeddedAssets.USB1.width;
        this._usbcable.height = EmbeddedAssets.USB1.height;
        this._usbcable.x = 10;
        this._usbcable.y = stage.stageHeight - 250;
        this.addChild(this._usbcable);

        this._usbport = new USBPort(DRAG_FORMAT_USB);
        this._usbport.width = 300;
        this._usbport.height = 300;
        this._usbport.x = stage.stageWidth - 300;
        this._usbport.y = 10;
        this.addChild(this._usbport);
/*
        this._vgacable = new VGACable(DRAG_FORMAT_VGA);
        this._vgacable.width = EmbeddedAssets.VGA_CABLE.width;
        this._vgacable.height = EmbeddedAssets.VGA_CABLE.height;
        this._vgacable.x = 10 + _usbcable.width + 10;
        this._vgacable.y = stage.stageHeight - 250;
        this.addChild(this._vgacable);

        this._vgaport = new VGAPort(DRAG_FORMAT_VGA);
        this._vgaport.width = 300;
        this._vgaport.height = 300;
        this._vgaport.x = stage.stageWidth - 300 - _usbport.width - 10;
        this._vgaport.y = 10;
        this.addChild(this._vgaport);
*/
        this._usbcable.addChild(this._dragusb);
  //      this._vgacable.addChild(this._dragvga);
    }


}
}
