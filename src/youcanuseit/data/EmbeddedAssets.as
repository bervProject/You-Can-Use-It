/**
 * Created by Bervianto Leo P on 13/07/2016.
 */
package youcanuseit.data {
import starling.textures.Texture;

public class EmbeddedAssets {

    // ABOUT - TITLE ASSETS

    [Embed(source="/../assets/images/pbsd-450x160.png")]
    private static const STARLING_DARK_EMBEDDED:Class;
    [Embed(source="/../assets/images/pbsl-450x160.png")]
    private static const STARLING_LIGHT_EMBEDDED:Class;
    [Embed(source="/../assets/images/title-logo.png")]
    private static const STARLING_LOGO_EMBEDDED:Class;
    [Embed(source="/../assets/images/feathersUI.png")]
    private static const FEATHERS_UI_EMBEDDED:Class;
    public static var STARLING_TEXTURE_LIGHT:Texture;
    public static var STARLING_TEXTURE_DARK:Texture;
    public static var FEATHERS_UI_LOGO:Texture;
    public static var STARLING_LOGO:Texture;

    // TEST MODE ASSETS

    // HARDWARE ---

    // USB ---
    [Embed(source="/../assets/images/usb1.png")]
    private static const USB1_EMBEDDED:Class;
    [Embed(source="/../assets/images/usb2.png")]
    private static const USB2_EMBEDDED:Class;
    [Embed(source="/../assets/images/usb3.jpg")]
    private static const USB3_EMBEDDED:Class;
    [Embed(source="/../assets/images/USB_Connected.jpg")]
    private static const USB_CONNECTED_EMBEDDED:Class;
    [Embed(source="/../assets/images/portusb1.jpg")]
    private static const USB_PORT1_EMBEDDED:Class;
    public static var USB1:Texture;
    public static var USB2:Texture;
    public static var USB3:Texture;
    public static var USB_CONNECTED:Texture;
    public static var USB_PORT1:Texture;

    // VGA ---
    [Embed(source="/../assets/images/vga-cable.jpg")]
    private static const VGA_CABLE_EMBEDDED:Class;
    [Embed(source="/../assets/images/2000px-DE15_Connector_Pinout.svg.png")]
    private static const VGA_PORT_EMBEDDED:Class;

    public static var VGA_CABLE:Texture;
    public static var VGA_PORT:Texture;

    // RJ-45 LAN ----
    [Embed(source="/../assets/images/RJ45(LAN)1.jpg")]
    private static const RJ45_LAN_EMBEDDED:Class;
    [Embed(source="/../assets/images/RJ45Port1.jpg")]
    private static const RJ45_LAN_PORT_EMBEDDED:Class;

    public static var RJ45_LAN:Texture;
    public static var RJ45_LAN_PORT:Texture;

    // RJ-45 LAN ----
    [Embed(source="/../assets/images/1280px-HDMI_Connector_Pinout.svg.png")]
    private static const HDMI_EMBEDDED:Class;
    [Embed(source="/../assets/images/hdmi-port.jpg")]
    private static const HDMI_PORT_EMBEDDED:Class;

    public static var HDMI:Texture;
    public static var HDMI_PORT:Texture;

    // Audio
    [Embed(source="/../assets/images/audioport.jpg")]
    private static const AUDIO_PORT_EMBEDDED:Class;
    [Embed(source="/../assets/images/Audio-TRS-Mini-Plug.jpg")]
    private static const AUDIO_JACK_EMBEDDED:Class;

    public static var AUDIO_PORT:Texture;
    public static var AUDIO_JACK:Texture;

    // Success or No
    [Embed(source="/../assets/images/148705-essential-collection/png/success.png")]
    private static const SUCCESS_EMBEDDED:Class;
    [Embed(source="/../assets/images/148705-essential-collection/png/error.png")]
    private static const FALSE_EMBEDDED:Class;

    public static var SUCCESS:Texture;
    public static var FALSE:Texture;

    public static function initialize():void {

        // ABOUT - TITLE ASSETS.

        STARLING_TEXTURE_LIGHT = Texture.fromEmbeddedAsset(STARLING_LIGHT_EMBEDDED, false, false, 2);
        STARLING_TEXTURE_DARK = Texture.fromEmbeddedAsset(STARLING_DARK_EMBEDDED, false, false, 2);
        FEATHERS_UI_LOGO = Texture.fromEmbeddedAsset(FEATHERS_UI_EMBEDDED, false, false, 4);
        STARLING_LOGO = Texture.fromEmbeddedAsset(STARLING_LOGO_EMBEDDED, false, false, 2);

        // TEST MODE ASSETS.

        // HARDWARE ----

        // USB ----
        USB1 = Texture.fromEmbeddedAsset(USB1_EMBEDDED, false, false, 5);
        USB2 = Texture.fromEmbeddedAsset(USB2_EMBEDDED, false, false, 5);
        USB3 = Texture.fromEmbeddedAsset(USB3_EMBEDDED, false, false, 5);
        USB_PORT1 = Texture.fromEmbeddedAsset(USB_PORT1_EMBEDDED, false, false, 5);
        USB_CONNECTED = Texture.fromEmbeddedAsset(USB_CONNECTED_EMBEDDED, false, false, 5);

        // VGA
        VGA_PORT = Texture.fromEmbeddedAsset(VGA_PORT_EMBEDDED, false, false, 10);
        VGA_CABLE = Texture.fromEmbeddedAsset(VGA_CABLE_EMBEDDED, false, false, 8);

        // RJ45
        RJ45_LAN = Texture.fromEmbeddedAsset(RJ45_LAN_EMBEDDED, false, false, 20);
        RJ45_LAN_PORT = Texture.fromEmbeddedAsset(RJ45_LAN_PORT_EMBEDDED, false, false, 5);

        // HDMI
        HDMI = Texture.fromEmbeddedAsset(HDMI_EMBEDDED, false, false, 18);
        HDMI_PORT = Texture.fromEmbeddedAsset(HDMI_PORT_EMBEDDED, false, false, 5);

        // AUDIO
        AUDIO_PORT = Texture.fromEmbeddedAsset(AUDIO_PORT_EMBEDDED, false, false, 2);
        AUDIO_JACK = Texture.fromEmbeddedAsset(AUDIO_JACK_EMBEDDED, false, false, 5);

        // SUCCESS OR NO
        SUCCESS = Texture.fromEmbeddedAsset(SUCCESS_EMBEDDED, false, false, 15);
        FALSE = Texture.fromEmbeddedAsset(FALSE_EMBEDDED, false, false, 15);
    }
}
}
