---
layout: post
title:  "初探Robot Framework之第一個helloworld練習題 - 03"
image: ''
date: 2020-02-26 10:50
cover: '/assets/img/maruIMG/2020/0223_rf/rf01.png'
tags:
- test
- robotframework
- QA

description: ''
categories: ''
serie: 
---

## 開始第一個測試案例  

### 建立測試專案
開啟RIDE, 點選右上角**File** > **New Project**  

<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0226_rf/05.png"}}">
</figure>

選擇存放路徑, 為測試專案命名 : **Test**
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0226_rf/07.png"}}">
</figure>

### 建立測試案例
測試專案建立後, 請滑鼠右鍵點選專案名稱**Test**  > **New Test Case**
依照慣例就先從hello world開始吧! 哈!
輸入
```
    print_helloword
```
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0226_rf/06.png"}}">
</figure>

### 撰寫測試案例
點選測試案例**print_helloworld**  
在第一列第一個欄位寫上 **log**  
第二個欄位則寫上**helloworld** 或任何你想輸出的訊息  
寫好後記得存檔  

<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0226_rf/13.jpg"}}">
</figure>

接著在測試案例的框框打勾☑, 然後按下 **Run the test**
或者直接按F8  
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0226_rf/14.png"}}">
</figure>

成功執行!!
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0226_rf/15.jpg"}}">
</figure>

### 查看報告
測試運行結束後, 點擊**Report**可以看測試報告  
Robot Framework將執行後的文字結果以HTML格式呈現  
如果全部測試都PASS, 背景是綠色的, 反之若有一個FAIL, 則為紅色  
給予使用者非常強烈的視覺衝擊, 有很好的警示效果
點擊**All Tests**可以看到運行的所有測試  
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0226_rf/16.jpg"}}">
</figure>

而點選**log.html**或者右上方的**LOG**  
則可以看到每個測試的詳細步驟  
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0226_rf/17.jpg"}}">
</figure>

現在我們回去改一下測試案例, 故意讓他失敗  
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0226_rf/18.jpg"}}">
</figure>

執行後, 哇整個大紅, 對於測試人員來說, 這真是很不舒服的顏色  XDD  
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0226_rf/19.jpg"}}">
</figure>

點開來發現了發生錯誤步驟的訊息  
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0226_rf/21.jpg"}}">
</figure>

點進去LOG可以看到更詳盡的步驟  
由於筆者使用的例子太簡單了, 所以LOG得到的資訊與REPORT是一樣的   
在測試案例步驟多又複雜時  
LOG是很能幫助除錯及看出測試步驟問題的好幫手喔!  
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0226_rf/20.jpg"}}">
</figure>

### 在終端機運行Robot Framework測試
Robot Framework提供了不少命令選項可以用來控制測試案例的輸出與執行  
甚至可以整合不同時間下運行的測試報告  
除了在RIDE進行測試活動, 我們也能在終端機直接執行測試案例  
再命令列下以robot開頭, 再接測試案例路徑便能執行  
```
    cd $test_project_path  
    robot $test_case_name
```
運行結果如下 : 
* 顯示測試專案名稱
* 顯示各測試案例的運行結果  
* 顯示總結果
* 顯示HTML格式的測試結果的路徑

<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0226_rf/08.jpg"}}">
</figure>


