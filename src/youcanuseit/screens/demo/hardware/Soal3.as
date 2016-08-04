/**
 * Created by Bervianto Leo P on 28/07/2016.
 */
package youcanuseit.screens.demo.hardware {
import feathers.controls.Button;
import feathers.controls.ImageLoader;
import feathers.controls.Label;
import feathers.controls.LayoutGroup;
import feathers.controls.TextArea;
import feathers.controls.TextInput;
import feathers.events.FeathersEventType;
import feathers.layout.HorizontalAlign;
import feathers.layout.HorizontalLayout;
import feathers.layout.VerticalLayout;

import starling.events.Event;

import youcanuseit.data.EmbeddedAssets;
import youcanuseit.event.HardwareTestEvent;

public class Soal3 extends LayoutGroup {

    private var questionPic:ImageLoader;
    private var question:Label;
    private var inputBox:TextInput;
    private var inputButton:Button;
    private var result:ImageLoader;

    public function Soal3() {
        super();
        this.addEventListener(Event.ADDED_TO_STAGE, onAddedtoStage);
    }

    private function onAddedtoStage(event:Event):void {
        var myLayout:VerticalLayout = new VerticalLayout();
        myLayout.gap = 5;
        myLayout.horizontalAlign = "center";
        this.layout = myLayout;

        this.question = new Label();
        this.question.styleNameList.add(Label.ALTERNATE_STYLE_NAME_HEADING);
        this.question.wordWrap = true;
        this.question.text = "What the name of picture below?";
        this.addChild(this.question);

        this.questionPic = new ImageLoader();
        this.questionPic.source = EmbeddedAssets.POWER_BUTTON;
        this.addChild(questionPic);

        var inputLayout:LayoutGroup = new LayoutGroup();
        var inputHorizontal:HorizontalLayout = new HorizontalLayout();
        inputHorizontal.gap = 5;
        inputLayout.layout = inputHorizontal;

        this.inputBox = new TextInput();
        this.inputBox.prompt = "Answer in this box";
        this.inputBox.addEventListener(FeathersEventType.ENTER, enterFromBox);
        inputLayout.addChild(this.inputBox);

        this.inputButton = new Button();
        this.inputButton.label = "Answer";
        this.inputButton.addEventListener(Event.TRIGGERED, onButtonClicked);
        inputLayout.addChild(this.inputButton);

        this.result = new ImageLoader();
        inputLayout.addChild(this.result);

        this.addChild(inputLayout);
    }

    private function onButtonClicked(event:Event):void {
        confirmanswer();
    }

    private function enterFromBox(event:Event):void {
        confirmanswer();
    }

    private function confirmanswer():void {
        var answer:String = inputBox.text.toLowerCase();
        if (answer=="power button") {
            this.inputBox.isEnabled = false;
            this.inputButton.isEnabled = false;
            this.result.source = EmbeddedAssets.SUCCESS;
            dispatchEvent(new HardwareTestEvent(HardwareTestEvent.FINISHED, "soal3", true));
        } else {
            this.result.source = EmbeddedAssets.FALSE;
        }
    }
}
}
