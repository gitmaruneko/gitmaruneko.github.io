---
layout: post
title:  "網頁顯示icon的方式 - svg sprite"
image: ''
date: 2017-04-22 14:30
tags:
- WEB
- Programming
description: ''
categories: ''
serie: ''
---

<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/0422/Tumblr.png"}}">
</figure>

昨天比較了一下各個社交平台, 發現 [**Tumblr**](https://www.tumblr.com/) 是個很棒的地方<br />
除了有類似**Instagram**那種追蹤方式以外<br />
他將貼文分成很多類, 每種類有不同的顯示方式<br />
在使用者體驗上真的很貼心<br />
(於是乎又多了一個小天地)

今天的練習即是在文章內文加上**share**的功能<br />
(因為我寫好後要分享至**Tumblr**嘛, 哈哈)<br />

原本以為Icon和圖片一樣, 都是設定好檔案路徑後就可以顯示在網頁上<br />
後來發現這不知道是幾百年前的觀念了 XDD<br />

現在廣泛使用的方式為 **SVG** **sprite**<br />
透過某些工具將圖檔轉化為一連串的編碼(程式碼?)後, 放入到HTML內使用<br />
這樣做的好處是可以免於圖片失真的狀況<br />
也可以減少讀圖檔時的HTTP request <br />

[IcoMoon](https://icomoon.io/#home)有蠻多不錯的免費圖標可以使用<br />
以此網站提供的圖標當例子做個紀錄<br />

1.選擇好想要的圖檔後, 點選下方的**Generate SVG & More**<br />
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/0422/00-1.png"}}" style="border:3px #5d4d7a dashed;">
</figure>
2.點選上方的Preference做匯出設定<br />
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/0422/00-2.png"}}"  style="border:3px #5d4d7a dashed;">
</figure>

3.再點選下方**Download**後, 就能得到一包含PNG和轉化為編碼的檔案<br />
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/0422/03-1.png"}}" style="border:3px #5d4d7a dashed;">
</figure>

4.或者若你不想匯出想直接使用, 可以直接在圖標處點選**<>Get Code**<br />
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/0422/02.png"}}"  style="border:3px #5d4d7a dashed;">
</figure>

就會跳出一個程式碼視窗, 讓你針對需求選擇
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/0422/03.png"}}" style="border:3px #5d4d7a dashed;">
</figure>
---
* 轉化後的編碼大約長這樣

```html
<symbol id="icon-facebook" viewBox="0 0 585 1024">
    <path class="path1" d="M548 6.857v150.857h-89.714q-49.143 0-66.286 20.571t-17.143 61.714v108h167.429l-22.286 169.143h-145.143v433.714h-174.857v-433.714h-145.714v-169.143h145.714v-124.571q0-106.286 59.429-164.857t158.286-58.571q84 0 130.286 6.857z"
    />
</symbol>
<symbol
	<!--...-->
</symbol>
```
儲存多段svg編碼的檔案, 可以視為一個容器, <br />
各個圖標會以symbol tag分開<br />
外部使用則以id去呼叫即可<br />

呼叫範例如下 : <br />
```html
<svg class="icon icon-music">
	<use xlink:href="#icon-music"></use>
</svg>  
```
如果使用許多圖檔, 那麼上方的容器檔案會非常冗長 <br />
於是便出現了SVG sprite的做法<br />
剛剛匯出的那包圖檔會有一個**sprite.svg**<br />
等同上方提到的容器檔案<br />
裡面也會有匯出圖檔的對應id : <br />
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/0422/05.png"}}">
</figure>
使用時在HTML設定此svg file, 再呼叫對應的圖標id就可以了<br />
呼叫範例如下 : <br />
```html
<svg class="icon" xmlns="http://www.w3.org/2000/svg">
    <use xlink:href="mySpriteIcon.svg#icon-music"></use>
</svg>  
```

### Share功能就做好啦~~~ 
(當然還要設定點擊後的對應行為啦, 不是只加圖標就好)
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/0422/04.png"}}" style="border:3px #5d4d7a dashed;">
</figure>


如果是直接使用iconmoon那包的話, 要記得移除寬高XY這些設定, <br />
才能在CSS內對圖標另做樣式處理<br />


































