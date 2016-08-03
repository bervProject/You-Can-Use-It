/**
 * Created by Bervianto Leo P on 01/08/2016.
 */
package youcanuseit.draggable {
import feathers.controls.ImageLoader;
import feathers.controls.LayoutGroup;
import feathers.dragDrop.DragData;
import feathers.dragDrop.DragDropManager;
import feathers.dragDrop.IDragSource;
import feathers.events.DragDropEvent;
import feathers.layout.AnchorLayoutData;
import feathers.layout.VerticalLayout;

import starling.display.DisplayObject;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

import youcanuseit.data.EmbeddedAssets;
import youcanuseit.screens.demo.hardware.Soal1;

public class DragSource extends LayoutGroup implements IDragSource
{

    public function DragSource(dragFormat:String)
    {
        this._dragFormat = dragFormat;
        this.addEventListener(TouchEvent.TOUCH, touchHandler);
        this.addEventListener(DragDropEvent.DRAG_START, dragStartHandler);
        this.addEventListener(DragDropEvent.DRAG_COMPLETE, dragCompleteHandler);
    }

    private var _touchID:int = -1;
    private var _draggedObject:DisplayObject;
    private var _dragFormat:String;
    private var avatar:ImageLoader;

    override protected function initialize():void
    {
        var theLayout:VerticalLayout = new VerticalLayout();
        theLayout.horizontalAlign = "center";
        theLayout.verticalAlign = "middle";
        this.layout = theLayout;
    }

    private function touchHandler(event:TouchEvent):void
    {
        if(DragDropManager.isDragging)
        {
            //one drag at a time, please
            return;
        }
        if(this._touchID >= 0)
        {
            var touch:Touch = event.getTouch(this._draggedObject, null, this._touchID);
            if(touch.phase == TouchPhase.MOVED)
            {
                this._touchID = -1;

                avatar = new ImageLoader();
                if (_dragFormat == Soal1.DRAG_FORMAT_USB) {
                    avatar.source = EmbeddedAssets.USB1;
                } else if (_dragFormat == Soal1.DRAG_FORMAT_VGA) {
                    avatar.source = EmbeddedAssets.VGA_CABLE;
                } else if (_dragFormat == Soal1.DRAG_FORMAT_RJ45) {
                    avatar.source = EmbeddedAssets.RJ45_LAN;
                } else if (_dragFormat == Soal1.DRAG_FORMAT_HDMI) {
                    avatar.source = EmbeddedAssets.HDMI;
                } else {
                    avatar.source = EmbeddedAssets.FALSE;
                }

                avatar.layoutData = new AnchorLayoutData(0, 0, 0, 0);
                avatar.alpha = 0.5;

                var dragData:DragData = new DragData();
                dragData.setDataForFormat(this._dragFormat, this._draggedObject);
                DragDropManager.startDrag(this, touch, dragData, avatar, -avatar.source.width / 2, -avatar.source.height / 2);
            }
            else if(touch.phase == TouchPhase.ENDED)
            {
                this._touchID = -1;
            }
        }
        else
        {
            touch = event.getTouch(this, TouchPhase.BEGAN);
            if(!touch || touch.target == this || touch.target == this.backgroundSkin)
            {
                return;
            }
            this._touchID = touch.id;
            this._draggedObject = touch.target;
        }
    }

    private function dragStartHandler(event:DragDropEvent, dragData:DragData):void
    {
        //the drag was started with the call to DragDropManager.startDrag()
    }

    private function dragCompleteHandler(event:DragDropEvent, dragData:DragData):void
    {
        if(event.isDropped)
        {
            //the object was dropped somewhere
        }
        else
        {
            //the drag cancelled and the object was not dropped
        }
    }
}
}
