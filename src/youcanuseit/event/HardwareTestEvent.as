/**
 * Created by Bervianto Leo P on 03/08/2016.
 */
package youcanuseit.event {
import starling.events.Event;

public class HardwareTestEvent extends Event {
    public static const FINISHED:String = "finished";

    private var soalClear:String;

    public function HardwareTestEvent(type:String, finished:String, bubbles:Boolean=false) {
        super(type, bubbles);
        soalClear = finished;
    }

    public function get finished():String { return soalClear; }
}
}
