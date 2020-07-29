---
layout: post
title:  "Agile Taipei - Mutation Testing"
image: ''
date: 2018-03-24 11:50
tags:
- Testing
- Agile
description: ''
categories: ''
serie: 
cover : '/assets/img/maruIMG/20180324/015.jpg'
---
<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/20180324/015.jpg"}}">
</figure>
前兩周參加了Agile Taipei的三月聚會 - **變異測試 : 一種提高測試和代碼質量的新方法**  
講師 **Joseph** 向大家介紹了 mutation testing 的精神並且給予程式碼範例練習,  
是一場很棒的分享, 剛好趁此機會溫習一下曾在軟體測試課程學過的mutation testing.  
(其實不太喜歡"變異測試"這個翻譯, 但一時之間找不到較好的說法, 所以仍然以Mutation testing來稱呼.)  

## 何謂Mutation Testing?
**Mutation testing**雖帶著一個測試字眼, 但其實是一種用來衡量評估測試品質的方法,  
開發人員撰寫程式碼, 然後運行測試案例來評估開發程式的品質,   
接著再變更原本的程式碼, 即Mutation testing來評估測試案例的品質,  
(是不是覺得這是一輪測過一輪的輪迴  :D )  
	
	舉例來說 : 
		假設原本的程式碼為 

		sum = a + b
		
		則可變動成 

		§ sum = a - b
		§ sum = a + b 
		§ …等

像以上的例子就是一種math mutator的變動,  
其他還有condition boundary mutator(<、>、=)、increments mutator(i++、i--)…等,  
所以並不是對你的程式碼胡亂改動就是Mutation測試阿  XDD,  
改完後, 重新運行測試案例, 如果發現測試全過, 那就表示測試案例有漏洞啦!!

#### 書中範例參考
<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/20180324/013.jpg"}}">
</figure>

## 覆蓋率迷思
運行完測試後, 除了檢查結果, 可能還會察看覆蓋率, 以往我會追求高覆蓋率,  
認為測試寫得多, 覆蓋率高, 便能維持好開發程式的品質,  
只是覆蓋率高就表示程式萬無一失了嗎?  
試問自己幾個問題 : 

* 覆蓋率要到幾%才代表測試做得足夠?
* 為什麼是這個數字?

是阿, 數字有什麼用? 測試案例寫得再多, 有效性不足仍然沒用,  
數據是輔助, 但不代表全部.  
這些覆蓋率最主要的作用在於提醒開發人員 : **還有哪些程式碼仍未被測試到?**  
並不代表測試碼的有效性  

## 實地演練

理論和想法看得夠多了, 還是寫點程式碼比較有感,  
針對講師介紹的工具 **pitest** 作個小練習,  
體驗一下mutation test 究竟能給予怎樣的幫助  

#### Pitest 工具介紹
Pitest是一款針對Java語言提供的Mutation測試工具, 提供多種mutators,  
並且可以和gradle、maven這些工具整合使用,  
具備整齊的規範和自動化特性, 不須太多複雜設定, 使用上很便利  
(跟muJAVA比較起來的話XD)  

#### 範例練習
* 以一個判斷整數是否為0~100正整數的小程式來練習  

<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/20180324/000.png"}}">
</figure>

　下圖為原本的測試案例  
<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/20180324/001.png"}}">
</figure>

　運行單元測試, 不僅全過, 而且覆蓋率也到達**100%**
<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/20180324/003.png"}}">
</figure>

* 接著要運行 Pitest, 在運行之前先做點設定  
	* 於pom.xml 加入plugin設定, 編譯時便會自動引用此套件
	* targetClasses和targetTests設定需要作pitest的class名稱
<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/20180324/004.png"}}>
</figure>

* 於maven專案視窗選擇 **pitest:mutationCoverage** 來運行pitest
<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/20180324/006.png"}}">
</figure>
　當然, 也可經由command line直接運行,  
　於command line輸入 : **mvn org.pitest:pitest-maven:mutationCoverage**
  <figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/20180324/012.png"}}">
</figure>

* 運行結束後, 至target/pit-reports資料夾內查看結果
<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/20180324/007.png"}}">
</figure>

* 經pitest評估後的狀況, mutation coverage未達100%
  表示仍有可以加強測試的部分
<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/20180324/008.png"}}">
</figure>
   
　點進default連結, 可查閱做了哪些mutation  
　此圖為例, 表示對原始碼的第3行作的conditional mutation測試沒過  
　* **<font color="red">紅</font>**色行數表示測試案例沒有被mutation testing覆蓋 (顯示 SURVIED 紅色)  
　* **<font color="green">綠</font>**色行數反之(顯示 KILLED 綠色)  
　(點進原始碼頁面則可以看到有那些沒被覆蓋)  
<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/20180324/009.png"}}">
</figure>

* 現在找到了不夠有效的測試, 所以可以回過頭改動了!  
檢查後發現, 101這個邊界值沒被檢查到, 增加這個測試案例  
<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/20180324/002.png"}}">
</figure>

　再運行一次 Pitest, 發現mutator都被殺死了, 測試案例有效性提升!
<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/20180324/010.png"}}">
</figure>

<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/20180324/011.png"}}">
</figure>

#### 輪迴圖
<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/20180324/016.png"}}">
</figure>


## 結論
Mutation testing 是一種補償工具, 可以幫助我們找到不夠有效的測試  
可是不管什麼工具, 都只能用來幫助學習, 找到問題  
而我們必須仔細看這些問題是不是真正的問題  :)


### Share
* [範例用的程式碼](https://github.com/gitmaruneko/MutationTest_Java)


### Reference
* [Pitest](http://pitest.org)
* [µJava](https://cs.gmu.edu/~offutt/mujava/)
* [Mutation testing](https://en.wikipedia.org/wiki/Mutation_testing)
* [BOOK : Introduction to Software Testing](https://cs.gmu.edu/~offutt/softwaretest/)
























