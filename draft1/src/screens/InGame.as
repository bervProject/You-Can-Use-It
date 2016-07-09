/**
 * Created by Bervianto Leo P on 04/07/2016.
 */
package screens {
import draggable.DragSource;
import draggable.DropTarget;

import feathers.controls.Button;
import feathers.controls.ImageLoader;
import feathers.controls.Label;
import feathers.dragDrop.IDragSource;
import feathers.dragDrop.IDropTarget;
import feathers.layout.AnchorLayoutData;

import starling.core.Starling;
import starling.display.Quad;
import starling.display.Sprite;
import starling.events.Event;
import starling.textures.Texture;

/**
 * This class is when Test Mode.
 */
public class InGame extends Sprite implements IDragSource, IDropTarget {

    /** Image source location. */
    [Embed(source="/../assets/images/panda.jpg")]
    private static const object1:Class;

    /** Image for dragging. */
    private var content1:ImageLoader;

    /** Drag format. */
    private static const DRAG_FORMAT:String = "draggableQuad";

    /** Drag Source Object. */
    private var _dragSource:DragSource;

    /** Drop Target Object. */
    private var _dropTarget:DropTarget;

    /** Reset Button. */
    private var _resetButton:Button;



    public function InGame() {
        super();

        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        this.visible = false;
    }

    private function reset():void {
        this.content1.x = 40;
        this.content1.y = 40;
        this._dragSource.addChild(this.content1);
    }


    private function onAddedToStage(event:Event):void {
        content1 = new ImageLoader();
        content1.source = Texture.fromEmbeddedAsset(object1, false);
        content1.layoutData = new AnchorLayoutData(0, 0, 0, 0);

        this._dragSource = new DragSource(DRAG_FORMAT);
        this._dragSource.width = 300;
        this._dragSource.height = 300;
        this._dragSource.x = 80;
        this._dragSource.y = 80;
        this.addChild(this._dragSource);

        this._dropTarget = new DropTarget(DRAG_FORMAT);
        this._dropTarget.width = 300;
        this._dropTarget.height = 300;
        this._dropTarget.x = 400;
        this._dropTarget.y = 80;
        this.addChild(this._dropTarget);

        this._resetButton = new Button();
        this._resetButton.label = "Reset";
        this._resetButton.addEventListener(Event.TRIGGERED, resetButton_triggeredHandler);
        this.addChild(this._resetButton);

        this._resetButton.validate();
        this._resetButton.x = (this.stage.stageWidth - this._resetButton.width) / 2;
        this._resetButton.y = this.stage.stageHeight - this._resetButton.height - 20;

        var instructions:Label = new Label();
        instructions.text = "Drag the square from the left container to the right container.";
        this.addChild(instructions);

        instructions.validate();
        instructions.x = (this.stage.stageWidth - instructions.width) / 2;
        instructions.y = (this._dragSource.y - instructions.height) / 2;

        this.reset();
    }

    private function resetButton_triggeredHandler(event:Event):void
    {
        this.reset();
    }

    public function initialize():void {
        this.visible = true;
    }
}
}
