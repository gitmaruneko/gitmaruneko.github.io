---
layout: post
title:  "初探Robot Framework之WEB測試 - 04"
image: ''
date: 2020-02-27 19:50
cover: '/assets/img/maruIMG/2020/0223_rf/rf01.png'
tags:
- test
- robotframework
- QA

description: ''
categories: ''
serie: 
---

## 開始第一個Web測試案例  

### 建立測試專案
開啟RIDE, 點選右上角 **File** > **New Project**  
選擇存放路徑, 為測試專案命名 : **test Web**
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0227_rf/00.jpg"}}">
</figure>

由於這個測試案例會用到selenium2library的keyword,  
我們先點選專案 **Test** > 點選 **Edit** tab > 點選 **Library**  
輸入
```
   selenium2library  
```
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0227_rf/02.jpg"}}">
</figure>

導入成功後就會出現在library欄位囉  
(如果出現紅字或導入不成功, 請記得回去**[安裝篇](https://gitmaruneko.github.io/2020/02/17/howToTestWithRF01.html)**檢查有沒有成功安裝selenium2library)
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0227_rf/03.jpg"}}">
</figure>

### 建立測試案例
* 測試專案建立後, 請滑鼠右鍵點選專案名稱 **Test**  > **New Test Case**  
  為測試案例命名 : **Open Wiki Page**

<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0227_rf/01.jpg"}}">
</figure>

* 建立完成後, 點選測試案例名稱開始編寫測試步驟  
  **Open Wiki Page**目的要開啟wiki頁面   
  還記得第一個練習範例提到的嗎?  
  第一欄寫keyword, 第二欄之後就是寫這個keyword需要輸入的參數   

  在WEB測試中很常使用的keyword就是 **Open Browser**  
  後面帶要開啟的網頁, 以及要使用的瀏覽器  
  詳細的keyword可以在這查詢 : [Selinum2Library - keyword](https://robotframework.org/Selenium2Library/Selenium2Library.html)  
  
  在這個範例中, 如圖所示 :  
  請在第一欄輸入  
```
    Open Browser
``` 
  在第二欄輸入wiki首頁網址  
```
   https://zh.wikipedia.org/wiki/Wiki
```
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0227_rf/05.jpg"}}">
</figure>

  運行:  成功開啟WIKI頁面   
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0227_rf/demo01.gif"}}">
</figure>

### 獲取Web元件地址

#### 測試案例 - 點擊

進行Web測試的其中一點便是要模擬使用者的操作行為   
而像是點擊, 輸入這些在我們看來再簡單不過的動作  
則需要藉由元件定址來操作  
元件和XPATH的關係就像是我們的居住地址一樣   
在以下的練習, 我們便要從取得網頁元件XPATH來操作這些網頁元件  

* 建立第二個測試案例, 命名為 **Click Wiki Catagory**  
  這個測試需要去點擊WIKI上的分類連結
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0227_rf/05_1.jpg"}}">
</figure>

* 查詢一下library的keyworld, 我們會需要用到 **Click Element**這個keyword  
  **Click Element**需要一個argument: **locator**  
  也就是剛提到的XPATH
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0227_rf/90.jpg"}}">
</figure>

* 接下來先找到WIKI上的**分類索引**連結  
  按下**F12**, 可以看到畫面右方出現一堆似懂非懂的英文字, 這些就是網頁原始碼,   
  找到這個原始碼畫面的左上方, 可以看到一個框框   
  我們先點擊他, 然後將滑鼠移動到WIKI頁面, 可以看到這些網頁字體被選到時就會反白處理  
  而右方區塊也會出現相對應的原始碼    
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0227_rf/06.jpg"}}">
</figure>
   接著我們移動到**分類索引**的位置, 看到了他的原始碼  
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0227_rf/07.jpg"}}">
</figure>
   再來**滑鼠右鍵點擊**這個原始碼區塊 > **Copy** > 點擊**Copy XPath**  
   就找到**分類索引**的地址啦~~

<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0227_rf/08.jpg"}}">
</figure>
   回到我們的測試案例, 先複製剛剛開啟網頁的第一列  
   接著在第二列的第一欄輸入 
```
    Click Element
``` 
   隔壁欄則輸入剛剛找到的XPATH
```
    //*[@id="n-indexpage"]/a
```

<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0227_rf/08_2.jpg"}}">
</figure>

  運行:  在開啟WIKI頁面後, 自動點擊分類索引  

<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0227_rf/demo02.gif"}}">
</figure>

#### 測試案例 - 輸入
* 剛剛有提到, 這些WEB測試會模擬使用者的操作行為  
  除了點擊以外, **輸入**也是很頻繁的操作  

  現在來做一下**輸入**的練習  
  建立第三個測試案例, 命名為 **Search Godzilla**

<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0227_rf/08_1.jpg"}}">
</figure>
  分析測試步驟 :   
  * 開啟WIKI頁面  
  * 在搜尋框輸入 : Godzilla  
  * 點擊搜尋按鈕 > 開啟哥吉拉的WIKI頁面  

* 遵照剛剛尋找XPATH的步驟  
  - 按下F12  
  - 選取定址元件  
  - 點擊滑鼠右鍵複製XPATH  

  找尋**搜尋框**的XPATH  
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0227_rf/09.jpg"}}">
</figure>
  **搜尋按鍵**也遵照同樣的方式處理  
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0227_rf/11.jpg"}}">
</figure>

   然後將個別對應的XPATH依據步驟輸入到對應欄位  
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0227_rf/10.jpg"}}">
</figure>

   運行 : 成功搜尋哥吉拉 並開啟頁面
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0227_rf/demo03.gif"}}">
</figure>

### 其他
WEB測試常會需要去記錄當下畫面  
selenium2library也提供了一個很好用的keyword : **Capture Page Screenshot**  
可以讓使用者依據不同情況(例如測試失敗時)來capture screen

在剛剛的測試加上這行keyword
```
    Capture Page Screenshot
```
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0227_rf/12.jpg"}}">
</figure>
重新運行一次測試, 打開報告檢查結果    
成功擷取網頁畫面!!
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0227_rf/13.jpg"}}">
</figure>



### Reference
* [Selinum2Library - keyword](https://robotframework.org/Selenium2Library/Selenium2Library.html)