---
layout: post
title:  "初探Robot Framework之RIDE介面 - 02"
image: ''
date: 2020-02-25 10:50
cover: '/assets/img/maruIMG/2020/0223_rf/rf01.png'
tags:
- test
- robotframework
- QA

description: ''
categories: ''
serie: 
---

RIDE是一款專門用來提供Robot Framework編輯測試案例的工具  
透過GUI介面來編寫測試案例, 可加速非技術人員孰悉Robot Framework  

## **專案參數**編輯頁面 - 表格式
左邊長方形為**專案結構**區塊, 可以在這裡看到專案名稱以及各測試案例  
**專案結構**右方分為三大區塊 : 
* **Library導入** - 由此加入需要使用的第三方library  
* **參數設定** - 由此建立需要使用的測試資料參數
* **測試數據定義** - 由此導入測試需要用到的資料

<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0225_rf/0001.jpg"}}">
</figure>

## **測試案例**編輯頁面 - 表格式
點擊測試案例, 可以看到右方出現一些表格區塊   
上方灰色部分為一些測試流程設定,  
比如Setup 用於設定執行案例環境, teardown 用於清理環境還原初始設定  
Tag還能用來設定測試案例的優先等級  
下方的黑線白色表格則用於撰寫測試案例   
第一列寫的是Keyword, 第二列之後則為需要帶進去的參數  
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0225_rf/03.jpg"}}">
</figure>

##  **測試案例**編輯頁面 - 純文字式
若不習慣表格式介面, 也可點擊上方的Tab - **Test Edit** 進入純文字編輯模式  
在此可以一併撰寫要導入的library, 參數, 測試步驟...等  
**在文字編輯區要特別注意空格**  
以傳進去的參數為例, "one space" 以及 "one  space" 中間的字元各別是一個空格及兩個空格  
而字元間空一個空格會被視為是同筆資料  
而兩個空格會被視為是兩筆資料  


<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0225_rf/0002.jpg"}}">
</figure>

## 執行頁面
寫好測試案例後, 就是執行啦!  
上方的快捷鍵有相對應的操作, 像是**Run**, **Debug**等等  

<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0225_rf/05.jpg"}}">
</figure>

專案區塊則可看到測試案例, 成功運行的會顯示為綠色, 反之則為紅色  
而專案區塊右方則是:  
* **運行設定區域**  
  * robot - 指定要使用哪種interprete運行, 如果要使用pybot, jybot需要安裝相關設定  
  * Report - 運行結束後, 點即可查看報告  
  * Log - 用於查看詳細的測試log  
  其他像是  
  * Only run tests with these tags 
  * Skip tests these tags   
  是用於以tag來過濾要運行的測試案例

* **腳本運行結果區域**
  顯示運行後的測試總結果, 如圖為一Pass一Fail  
  只要有一個fail則會顯示紅色橫線高亮提醒  
  全過才會顯示綠色唷

* **系統運行紀錄區域**
  測試運行過程中, 系統紀錄的相關信息  


### Reference
* [RIDE](https://github.com/robotframework/RIDE/wiki/Installation-Instructions)