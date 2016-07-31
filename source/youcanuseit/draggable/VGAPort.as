/**
 * Created by Bervianto Leo P on 09/07/2016.
 */
package youcanuseit.draggable {
import feathers.controls.ImageLoader;
import feathers.dragDrop.DragData;
import feathers.dragDrop.DragDropManager;
import feathers.dragDrop.IDropTarget;
import feathers.events.DragDropEvent;
import starling.display.DisplayObject;

import youcanuseit.data.EmbeddedAssets;

public class VGAPort extends ImageLoader implements IDropTarget
{

    public function VGAPort(dragFormat:String)
    {
        this._dragFormat = dragFormat;
        this.addEventListener(DragDropEvent.DRAG_ENTER, dragEnterHandler);
        this.addEventListener(DragDropEvent.DRAG_EXIT, dragExitHandler);
        this.addEventListener(DragDropEvent.DRAG_DROP, dragDropHandler);
    }

    private var _dragFormat:String;

    override protected function initialize():void
    {
        this.source = EmbeddedAssets.VGA_PORT;
    }

    private function dragEnterHandler(event:DragDropEvent, dragData:DragData):void
    {
        if(!dragData.hasDataForFormat(this._dragFormat))
        {
            return;
        }
        DragDropManager.acceptDrag(this);
      //  this._backgroundQuad.color = HOVER_COLOR;
    }

    private function dragExitHandler(event:DragDropEvent, dragData:DragData):void
    {
    //    this._backgroundQuad.color = DEFAULT_COLOR;
    }

    private function dragDropHandler(event:DragDropEvent, dragData:DragData):void
    {
        var droppedObject:DisplayObject = DisplayObject(dragData.getDataForFormat(this._dragFormat))
        droppedObject.x = Math.min(Math.max(event.localX - droppedObject.width / 2,
                0), this.actualWidth - droppedObject.width); //keep within the bounds of the target
        droppedObject.y = Math.min(Math.max(event.localY - droppedObject.height / 2,
                0), this.actualHeight - droppedObject.height); //keep within the bounds of the target
        this.addChild(droppedObject);

        //this._backgroundQuad.color = DEFAULT_COLOR;
    }
}
}
