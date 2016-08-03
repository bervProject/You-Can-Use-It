/**
 * Created by Bervianto Leo P on 28/07/2016.
 */
package youcanuseit.screens.demo.hardware {
import feathers.controls.ImageLoader;
import feathers.controls.LayoutGroup;

import starling.events.Event;

import youcanuseit.data.EmbeddedAssets;

public class Soal5 extends LayoutGroup {

    private var questionPic:ImageLoader;

    public function Soal5() {
        super();
        this.addEventListener(Event.ADDED_TO_STAGE, onAddedtoStage);
    }

    private function onAddedtoStage(event:Event):void {
        questionPic = new ImageLoader();
        questionPic.source = EmbeddedAssets.STARLING_LOGO;
        this.addChild(questionPic);
    }
}
}
