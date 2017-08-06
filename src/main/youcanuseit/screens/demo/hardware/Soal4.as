/**
 * Created by Bervianto Leo P on 28/07/2016.
 */
package main.youcanuseit.screens.demo.hardware {
import feathers.controls.ImageLoader;
import feathers.controls.LayoutGroup;

import main.youcanuseit.data.EmbeddedAssets;

import starling.events.Event;

public class Soal4 extends LayoutGroup {

    private var questionPic:ImageLoader;

    public function Soal4() {
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
