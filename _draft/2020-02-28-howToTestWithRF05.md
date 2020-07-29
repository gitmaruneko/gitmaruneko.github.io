---
layout: post
title:  "初探Robot Framework之結合Jenkins持續整合 - 05"
image: ''
date: 2020-02-28 11:09
cover: '/assets/img/maruIMG/2020/0223_rf/rf01.png'
tags:
- test
- robotframework
- QA

description: ''
categories: ''
serie: 
---

## 準備工作

本教學由安裝Robot Framework套件開始  
請預先裝好Jenkins環境 > [安裝Jenkins](https://jenkins.io/download/)

## [安裝Robot Framework套件](https://plugins.jenkins.io/robot/)

* 至Jenkins工作站 > **Manage Jenkins** > **Manage Plugins**

<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0228_rf/install/00.jpg"}}">
</figure>

* 點選 **Available** > 搜尋 **Robot Framework**

<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0228_rf/install/02.jpg"}}">
</figure>

* 安裝完成後, 回到 **Manage Jenkins** >  **Configure System**
  找到Robot Framework選項, 勾選 ☑**Display "Robot Results" column in the job list view**  
  這個選項可以讓我們在工作主頁面看到Robot Framework的建置結果

<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0228_rf/02.jpg"}}">
</figure>


<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0228_rf/install/03.jpg"}}">
</figure>


## 在Jenkins建立Robot Frameowrk任務

### 建立新任務
打開Jenkins主頁面, 點選 **New Item** > **New Project**  
輸入工作名稱
```
    test_robot
```
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0228_rf/install/03.jpg"}}">
</figure>

### 設定任務內容
每個任務要做的事情和步驟都不同, 
主要的流程及步驟是都在個別的任務頁面裡去做設定  
而現在的主要目標  就是把先前寫好的Robot Framework測項整合進Jenkins  
讓我們可以設定讓他每天在固定的時間建置, 或者測項有更新時也會觸發建置   

* 設定任務工作區域, 用來存放每次執行的結果  

<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0228_rf/c04
  .jpg"}}">
</figure>

* 進入 **test_robot**設定頁面, 找到 **Build**區塊   
  點選 **Add build step** > 選擇 **Execute Windows natch command**  
  (此步驟主要依據運行測試的作業系統來做選擇,  
  如果運行測試的機器是linux系統, 那個就選擇Execute shell) 

<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0228_rf/c01.jpg"}}">
</figure>

* 每一行視為一個獨立的步驟, 我們將內容拆解為三步驟
  * 從腳本複製到Jenkins的工作區域
  * 切換資料夾到Jenkins的工作區域 (這時測試腳本已經在裡面了)
  * 使用robot command運行測試
    (--name參數用來指定測試報告名稱, --outputdir 則用來指定報告輸出路徑)

<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0228_rf/c05.jpg"}}">
</figure>

跑完測試腳本後, 還要讓Jenkins替我們發布Robot Framework的測試報告  
在發布測試報告之前, 必須先封存測試後的資料  
Jenkins才知道要去哪邊存取這些執行結果  

  * 找到 **Post-build Actions區塊**
    點選 **Add post-build action** > 選擇 **Archive the artifacts**
    在 **File to archive** 中輸入 :
    ```
        report\*.html, report\*.xml
    ```
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0228_rf/c06.jpg"}}">
</figure>

  * 接下來在 **Post-build Actions區塊**  
    點選 **Add post-build action** > 選擇 **Publish Robot Framework  test results**  

<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0228_rf/c03.jpg"}}">
</figure>

  * 在 **Directory of Robot output** 中輸入 :  
    要publish的資料就在這個路徑  
  ```
      report\
  ```

    下方的  **Thresholds for build results**則是一種判定測試總結果為PASS為FAIL的機制   
    如果設定80, 那個通過的測試比例若高於或等於80%, 整體測試結果就是PASS  
    反之即為Fail  

<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0228_rf/c07.jpg"}}">
</figure>









### 無法顯示Robot Framework報告
```
  System.setProperty("hudson.model.DirectoryBrowserSupport.CSP", "")
```

### Reference
* [Jenkins Plugin - Robotframework](https://plugins.jenkins.io/robot/)