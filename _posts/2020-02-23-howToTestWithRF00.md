---
layout: post
title:  "初探Robot Framework之框架介紹 - 00"
image: ''
date: 2020-02-23 10:50
cover: '/assets/img/maruIMG/2020/0223_rf/rf01.png'
tags:
- test
- robotframework
- QA

description: ''
categories: ''
serie: 
---


## Robot Framework是什麼樣的測試工具?

Robot Framework是一個開源的自動化測試框架  
在安裝RIDE後, 可以透過GUI介面來進行測試活動  
<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/2020/0223_rf/rf02.jpg"}}">
</figure>
可以使用Python, Java語言來撰寫測試套件  
雖然根據工具特性多被運用在驗收測試  
但透過Python撰寫關鍵字來組合測試案例, 以及本身提供的自動生成報告以及結合Jenkins...等  
功能強大, 應用非常廣泛  


Robot Framework中的測試案例是由**"關鍵字"**所構成  
(keyword driven)
而關鍵字又可由其他關鍵字所構成  
以達到更好的reuse及整合  
是一套透過活用排列組合來撰寫測試案例的工具  

## 什麼是"關鍵字"?
由於Robot Framework被大量的運用在驗收測試上  
關鍵字的命名能讓使用者更加理解測試的目的及步驟  
Robot Framework中的關鍵字分為兩種 : 
* **系統關鍵字**
* **使用者定義關鍵字**

Robot Framework本身提供的關鍵字稱為**系統關鍵字**  
可以通過導入library來使用  
例如 **"For"**, **"log"**, **"set variable"** ..等   
而**使用者定義關鍵字**則由使用者所撰寫  
舉個使用情境例子 : 
```
打開颱風資訊中心網頁, 點擊進入颱風警報頁面
```

* 原本使用 "Open Browser", "Click Element"這些關鍵字即可完成動作  
<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/2020/0223_rf/rf03.jpg"}}">
</figure>
* 將以上兩個關鍵字再組成"show Typhoon status"關鍵字
<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/2020/0223_rf/rf04.jpg"}}">
</figure>

範例運行 : 
<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/2020/0223_rf/rf05.gif"}}">
</figure>

## 使用"關鍵字"寫測試案例的好處

原本就能完成的動作為什麼還要組裝呢?  
原因有以下考量 :  
#### 簡化繁瑣的撰寫步驟 
未組合前, 每次要執行"查詢颱風資訊頁面"便得貼上"Open Browser", "Click Element"這兩個步驟  
這次的步驟範例只有兩行, 要是程式碼行數一多, 複製貼上的步驟便顯繁瑣    
維護測試案例是很花人力成本的!  
  
#### 易於了解步驟目的
雖然能看懂這兩個關鍵字所執行的動作, 但卻無法在第一時間釐清目的  
組合成 "show Typhoon status"關鍵字後, 便能清楚了解這個動作是在展示颱風狀態  

以上這個過程即是"keyword driven"  
每個關鍵字都待代表著一個要執行的動作  
像是Open Browser 背後就有其相對應的程式碼  
藉由定義 > 組裝的循環過程來使用關鍵字進行測試  

## 生成測試報告

Robot Framework還有一個很棒的功能  
即是在測試結束後自動產生測試報告  
既然是自動化測試框架, 自動化生成測試報告也是很正常的  
如果測試人員必須從測試結果中擷取資訊並且人工產出測試報告  
不僅花費時間, 也容易產生人為失誤  
Robot Framework產生的報告   紅綠配色一目了然 
除了可以看到測試結果   還能看到測試步驟   
這些資訊對釐清問題或者複製bug有很大的幫助   
<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/2020/0223_rf/rf06.jpg"}}">
</figure>

  

## 好像有很多優點, 那缺點呢?
Robot Framework功能強大, 結合CI工具根本是開發界, 測試界的一大福音  
仔細想想  
其實優點也相關於缺點   
- 測試過程的LOG雖然仔細, 但可讀性還不夠高  
- 自行設計關鍵字, 組裝關鍵字來撰寫測試案例固然好用  
  但程式能力是一道門檻   

功能雖然強大, 但一方面也代表著上手此工具將會花費相當的時間  

```
工具沒有絕對的好壞, 能適當地用來解決問題就是好工具  
```



### Reference
* [Robot Framework](https://robotframework.org/)
* [RIDE](https://github.com/robotframework/RIDE/wiki/Installation-Instructions)
