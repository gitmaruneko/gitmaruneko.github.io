---
layout: post
title:  "Linux Test Project 之旅 - 00"
image: ''
date: 2019-03-17 10:50
cover: '/assets/img/maruIMG/20190303/0317/09.jpg'
tags:
- Study
- Linux
- LTP
- Test
description: ''
categories: ''
serie: 
---


# 使用目的
最近在學習如何做嵌入式系統的穩定性測試,  
一直都覺得嵌入式系統因其特有的即時性, 高可靠性等要求,  
導致嵌入式系統的測試大不同於一般軟體測試,  
這些特點同時也增加了嵌入式測試的複雜度以及難度, 而且也少有方便好用的測試工具  

想起在前公司開發Android產品時, 曾經玩過LTP這個自動化測試框架  
(其實當時只是無聊, 想把kernel搞掛 XDD)
沒想到正好拿來應用於手邊的產品  

選擇LTP當作穩定測試的工具  
除了因為其開源, 具有一定的公信力以外  
它還具備一個靈活特性  
和robotframework一樣, 可以自由設計並組裝測內容
robotframework利用 **關鍵字** 來組裝  
而在LTP內, **一個小單元的testcase就等於是robotframework的關鍵字**  
甚至testsuite也是一個關鍵字  
它至少有以下特點 : 

* 易於組裝測試場景
* 易於運行測試
* 測試粒度大小多元
* 由於以上兩點, 也非常容易找出測試失敗點
* 提供整合GDB, PERF, CVE...等工具
* 即使運行中途ctrl-c, 測試結果仍有完整記錄
* ...等

所以, 相比其他嵌入式系統測試框架
它真的是一個非常友善的測試工具


# 以RaspberryPi來練習LTP
## 取得LTP
  * 首先至 [Linux Test Project](https://github.com/linux-test-project/ltp)下載原始碼  
  ``` C
      $git clone https://github.com/linux-test-project/ltp.git
  ```

## TOOLCHAIN設定
 
* 因為LTP要運行在RaspberryPi開發板上,  
  所以要下載RaspberryPi的toolchain以進行cross compile  
  (關於Raspberry Pi 的toolchain 設定可參考此 : 
  **[安裝 Raspberry Pi 的 Toolchain](https://www.raspberrypi.com.tw/405/using-a-cross-compiler-for-raspberry-pi/))**
<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/20190303/0317/03.jpg"}}">
</figure>


## Cross compiler 設定
  * 下載並決定toolchain存放路徑後,  
    於LTP原始碼專案下的 **doc/build-system-guide.txt** 確認編譯設定細節
<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/20190303/0317/00_00.jpg"}}">
</figure>

* 利用shell script來設定適才下載的toolchain路徑,  
  順便加入configure, 加上參數指示安裝
<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/20190303/0317/00_01.jpg"}}">
</figure>

* 設定完後, 就是一般開源動作, 編譯 > 安裝  
  (開源有三寶 : configure, make, make install)

  ``` C
      $make
	  $make install
  ```



# 運行測試
* 考量到記憶體大小, 我將編譯後的整包執行工具, 複製到USB,  
  以mount方式進行測試, 以確保空間足夠存放測試結果  
  (整包工具多達近600MB, RBPI的MEM才1G, 可能會爆)  

  ```C
     $mkdir /tmp/ltp
	 $mount /mnt/sda1 /tmp/ltp
  ```
  
* 進行測試的方式可以參考[Linux Test Project](https://github.com/linux-test-project/ltp)的說明   
  在此以進行IPC(Inter-Process Communication)測試為例  

  ```C
     $./runltp -f ipc_customized
  ```
  
* 如果是第一次進行測試, 工具會先建立測試過程所需要用到的使用者帳戶及群組  
  
<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/20190303/0317/04_1.jpg"}}">
</figure>  
 
* 可以很清楚地看到測試過程, TPASS表示此測項通過
  
<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/20190303/0317/04_2.jpg"}}">
</figure>

## 測試結果
* 如果是運行testsuite (例如runtest資料夾下的senario test)), 就會以下圖呈現

<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/20190303/0317/05.jpg"}}">
</figure>

* 測試過程會建立兩個資料夾 **results** 以及 **output** 來存放測試結果  
  
  在**output**資料夾可以看到兩個副檔名分別為 **\*.fail**  以及  **\*.conf** 的檔案  
  顧名思義, 測試過程中的fail測項, 還有需要做進一步configure的測項  
  會分別被記錄在兩個檔案中 (真的很貼心), 提供使用者做下一次測試的參考

<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/20190303/0317/06.jpg"}}">
</figure>

* **results** 用來存放測試總結果, 檔名以時間區別
<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/20190303/0317/08.jpg"}}">
</figure>

<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/20190303/0317/07.jpg"}}">
</figure>

下圖為運行測試過程中的CPU 以及 MEM利用率  
可用來作為穩定性評估的參考資料  
<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/20190303/0317/10.jpg"}}">
</figure>


最近跟LTP相處下來, 覺得最難之處在於測試後的分析  
深入看測試內容後, 越發覺得OS學得不夠好  
測試工作本身就是一門需要技術的學問, 其中包含了眾多理論與實踐,  
如果缺乏這些知識和經驗, 測試的深度和廣度就不夠, 當然就無法保證測試品質  

所以 運行完測試並不是看完結果就算了  
重點在於分析測試結果後的動作  
由這些結果中得到回饋, 然後修正, 
經由不知多少次的反覆 才能逐步讓測試發揮最大價值  



## REF
* [Linux Test Project](https://github.com/linux-test-project/ltp)
* [LTP WIKI](https://github.com/linux-test-project/ltp/wiki)

 
























