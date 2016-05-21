# Resume Starling

## Pendahuluan
[Starling] merupakan sebuah framework berbasis ActionScript 3. [Starling] dikembangkan oleh [Gamua].

## Filosofi Framework
Framework yang berbasis ActionScript 3 ditargetkan untuk penciptaan atau pembuatan game 2D tetapi Starling tetap dapat digunakan untuk aplikasi grafis lainnya. Starling tersedia untuk desktop pada Adobe Flash Player 11 dan Adobe AIR 3. Starling memungkinkan untuk membuat aplikasi dengan GPU yang diaklerasi tanpa harus menulisnya dalam low level Stage3D APIs.
#### Intuitif
Starling mudah untuk dipelajari. Pengembang Flash/Flex akan merasa nyaman, karena Starling mengikuti beberapa dari dogma ActionScript dan abstraksi dari kompleksitas untuk low-level Stage3D APIs. Pengguna akan familiar dengan konsep seperti list tampilan DOM, model kejadian, dan API yang familiar seperti MovieClip, Sprite, TextField, dan lain-lain.
#### Ringan
Starling memiliki kelas yang terbatas (sekitar 80 ribu kode). Tidak ada dependensi luar selain Flash Player 11 atau AIR 3 pada desktop dan AIR 3.2 pada mobile. Ini akan membuat aplikasimu kecil dan memiliki alur kerja yang simpel.
#### Bebas digunakan
Starling bebas digunakan dan terus dikembangkan di Github. Terlisensi oleh Simplified BSD License, Anda dapat menggunakannya dengan bebas bahkan untuk aplikasi komersial.


##  Kelebihan Framework
Framework Starling memiliki kelebihan seperti berikut :
+ Bebas digunakan.
+ Open Source : sehingga developers dapat berkontribusi untuk memperluas keterbatasan framework.
+ Perangkat keras yang teraklerasi (*Hardware Accelerated*) : Starling dibuat di atas teknologi terbaru Stage3D dari Adobe Flash Player, yang menggunakan perangkat keras GPU dari perangkat pengguna untuk me-*render* *game* (permainan).
+ Dapat digunakan untuk berbagai macam layar. Berbasiskan satu kode dapat dikompilasi untuk dijalankan di berbagai macam platform - desktop, web, iOS dan Android.


## Kekurangan Framework
Framework ini akan sulit untuk programmer yang baru, framework ini cocok untuk programmer menengah. Kelebihannya pun dapat menyebabkan kekurangan dari framework. Kekurangannya yaitu perlu adanya flash player yang *"update"* untuk menjalankan program yang disupport oleh framework terbaru ini. Sebagai contohnya pada sistem operasi linux akan mengalami kendala dikarenakan flash yang tersedia oleh Adobe kurang *"update"* sehingga perlu adanya alternatif atau untuk bahkan terancam tidak dapat menjalankannya dengan baik.

## Struktur
Framework yang berbasis ActionScript 3 ini seperti bahasa pemrograman berorientasi objek lainnya. Di balik layar, Starling menggunakan Stage3D APIs, yang merupakan low-level GPU APIs yang berjalan di atas OpenGL dan DirectX pada desktop dan OpenGL ES2 pada preangkat mobile. Sebagai pengembang, Anda harus tahu bahwa Starling adalah port ActionSript 3 dari Sparrow, pustaka yang setara untuk iOS yang mengandalkan pada OpenGL ES2 APIs.

![alt text](https://www.safaribooksonline.com/library/view/introducing-starling/9781449320904/httpatomoreillycomsourceoreillyimages970833.png "Starling Layer")

Gambar 1 -  starling layer ada di atas Stage3D (Molehill)

## Penggunaan
Untuk menggunakan framework ini diperlukan Adobe AIR SDK, yang dapat didownload [di sini](http://www.adobe.com/devnet/air/air-sdk-download.html). Selain itu juga untuk membantu pembuatan diperlukan IDE Flash. Beberapa IDE Flash yang dapat digunakan yaitu : 
+ [Adobe Flash Builder](http://www.adobe.com/products/flash-builder.html)
+ [PowerFlasher FDT](http://fdt.powerflasher.com/)
+ [FlashDevelop](http://www.flashdevelop.org/)
+ [Adobe Flash CS](http://www.adobe.com/sea/products/animate.html)
+ [IntelliJ IDEA Ultimate](https://www.jetbrains.com/idea/download/) 

Sebagai langkah pertama Anda dapat membuka halaman [di sini](http://gamua.com/starling/first-steps/) atau melalui [halaman ini](http://wiki.starling-framework.org/start).

#### Membuat Game
Setelah selesai mengatur IDE Anda. Hubungkan *project* Anda dengan Starling SWC library dan gunakan kelas Startup berikut :

```ActionScript
import flash.display.Sprite;
import starling.core.Starling;

[SWF(width="400", height="300", frameRate="60", backgroundColor="#ffffff")]
public class Startup extends Sprite
{
    private var _starling:Starling;

    public function Startup()
    {
        _starling = new Starling(Game, stage);
        _starling.start();
    }
}
```

Ini akan membuat sebuah instansiasi dari Starling dan memulainya. Parameter "Game" dari konstruktor mengharapkan kelas yang merupakan tampilan objek Starling. Ini adalah pintu masuk untuk GPU yang dipercepat: Starling telah menetapkan sendiri objek tampilan. Dalam penggunaannya, mereka hampir identik dengan benda-benda tampilan konvensional; di belakang layar, namun mereka menggunakan Stage3D untuk membuat konten pada layar.

```ActionScript
import starling.display.Sprite;
import starling.text.TextField;

public class Game extends Sprite
{
    public function Game()
    {
        var textField:TextField = new TextField(400, 300, "Welcome to Starling!");
        addChild(textField);
    }
}
```

Yang terbesar "gotcha" (keberhasilan) di Starling adalah dengan menggunakan kelas yang tepat. *Autocompletion* IDE Anda akan default ke kelas "flash.display", sementara Anda ingin kelas dalam "starling.display". Ketika sesuatu berjalan salah, selalu periksa impor paket di atas kelas Anda: Anda mungkin menggunakan paket yang salah.

###### References : 
* http://www.adobe.com/devnet/flashplayer/articles/introducing_Starling.html
* Thibault Imbert, *Introducing Starling*, 2012, O'REILLY : USA.

[Starling]: http://gamua.com/starling/
[Gamua]: http://gamua.com/about
