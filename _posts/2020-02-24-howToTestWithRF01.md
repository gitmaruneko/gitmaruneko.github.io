---
layout: post
title:  "初探Robot Framework之安裝教學 - 01"
image: ''
date: 2020-02-24 10:50
cover: '/assets/img/maruIMG/2020/0223_rf/rf01.png'
tags:
- test
- robotframework
- QA

description: ''
categories: ''
serie: 
---

使用Robot Framework要安裝如下工具 :
* Python 3
* [pip]() - Python套件管理工具
* [Robot Framework ]()

本篇針對GUI介面操作, 以及WEB GUI測試解說, 故還需要安裝如下套件 :
* [wxPython]() - Python的GUI工具包, 必須安裝以使用RIDE  
* [RIDE]() - Robot Framework GUI介面編輯器
* [selenium2library]() - 用於Robot Framework的Web測試庫
* Web driver - [chromedriver](), [geckodriver]() 擇一, 提供瀏覽器相關自動操作

## 安裝環境
#### * Windows 10
#### * Linux - Ubuntu 16.04

## 安裝工具
### Python 3.6
* [下載Python](https://www.python.org/downloads/)

<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0224_rf/rf00.png"}}">
</figure>

* 可自行選擇安裝位置, 無特別設定則按下一步安裝完畢即可  
  (要記下安裝路徑, 安裝chromedriver時會用到喔)

  安裝後於command line 輸入 
  ```
  python --version
  ```
* 確認安裝成功 
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0224_rf/rf01.jpg"}}">
</figure>


### pip
安裝的Python版本若>3.4, 預設便會安裝pip  
若 <3.4 則可用以下方式安裝  
* command line 輸入 
  ```
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
  ```
* 執行get-pip.py安裝pip
  ```
    python get-pip.py
  ```
* 確認安裝成功 
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0224_rf/rf02.jpg"}}">
</figure>
### Robot Framework
* command line 輸入 
  ```
    pip install robotframework
  ```
* 確認安裝成功 
  ```
    python -m robot --version
  ```
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0224_rf/rf03.jpg"}}">
</figure>

安裝好Robot Framework後, 就可以開始使用了   
只是我們還會介紹GUI介面  
所以還需要安裝下面的套件 : 

### wxPython
* command line 輸入 
  ```
    pip install -U wxPython
  ```
* 確認安裝成功  
  ```
   python -c "import wx;print(wx.__version__)"
  ```
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0224_rf/rf04.jpg"}}">
</figure>
### RIDE
* command line 輸入 
  ```
    pip install robotframework-ride
  ```
* 確認安裝成功  
  如果python檔案沒有設定跟任何IDE有關聯啟動, 那麼執行以下指令即可成功啟動RIDE  
  如果已經關聯了, 就直接執行桌面的捷徑吧  
  ```
    ride.py
  ```
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0224_rf/rf05.gif"}}">
</figure>

以下為進行web GUI測試需要安裝的套件 : 
### selenium2library
* command line 輸入 
  ```
    pip install robotframework-selenium2library
  ```
* 確認安裝成功  
  ```
    python -c "import Selenium2Library;print(Selenium2Library.__version__)"
  ```
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0224_rf/rf05.jpg"}}">
</figure>
### web driver - chromedriver
* [下載chromedriver version 79](https://chromedriver.chromium.org/downloads)  
  (若無特殊考量, 下載79版本即可, 若chrome瀏覽器已更新到最新版本, 則chromedriver則同步下載最新版)  
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0224_rf/rf06.jpg"}}">
</figure>  
* 挑選相對應的OS版本下載  
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0224_rf/rf07.jpg"}}">
</figure>
* 下載完畢解壓縮  
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0224_rf/rf08.jpg"}} ">
</figure>
* 設定安裝路徑  
  運行chromedriver有兩種方式   
  一為 在系統環境變數PATH加入chromedriver路徑
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0224_rf/rf10.jpg"}}">
</figure>
  另一為 直接複製chromedriver至python安裝路徑  
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0224_rf/rf11.jpg"}}">
</figure>


安裝完畢! 現在來做個驗收 
* 新增一檔案命名為test.robot (副檔名是robot喔)
* 打開test.robot, 輸入如下內容並儲存

```
	*** Settings ***
	Library           Selenium2Library

	*** Test Cases ***
	Open Google
		Open Browser    http://google.com    chrome

```

* command line輸入 :  

```
    robot test.robot
```
<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0224_rf/rf12.gif"}}">
</figure>

google首頁成功啟動!  
下次就可以開始我們的第一個練習範例啦!  




### Reference
* [Robot Framework](https://robotframework.org/)
* [RIDE](https://github.com/robotframework/RIDE/wiki/Installation-Instructions)
* [wxPython](http://www.tastones.com/zh-tw/stackoverflow/wxpython/getting-started-with-wxpython/installation_of_wxpython_classic/)
* [Selenium2Library](https://robotframework.org/Selenium2Library/Selenium2Library.html)