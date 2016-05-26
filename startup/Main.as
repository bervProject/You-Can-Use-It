package {

import flash.display.Sprite;
import net.hires.debug.Stats;
import starling.core.Starling;

[SWF(frameRate="60", width="800", height="600", backgroundColor="0xffffff")]
public class Main extends Sprite {
    private var stats:Stats;
    private var myStarling:Starling;

    public function Main() {
        stats = new Stats();
        this.addChild(stats);

        myStarling = new Starling(Game,stage);
        myStarling.start();
        
    }
}
}
