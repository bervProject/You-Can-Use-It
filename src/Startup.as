/**
 * Created by Bervianto Leo P on 26/05/2016.
 */
package {
    import flash.display.Sprite;
    import net.hires.debug.Stats;
    import starling.core.Starling;

    [SWF(frameRate="60", width="600", height="600", backgroundColor="0x333333")]
    public class Startup extends Sprite {
        private var stats:Stats;
        private var myStarling:Starling;

        public function Startup() {
            stats = new Stats();
            this.addChild(stats);

            myStarling = new Starling(Game, stage);
            myStarling.start();
        }
    }
}
