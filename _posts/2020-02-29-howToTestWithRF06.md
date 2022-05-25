---
layout: post
title:  "初探Robot Framework之Keyword設計原則 - 06"
image: ''
date: 2020-02-29 10:50
cover: '/assets/img/maruIMG/2020/0223_rf/rf01.png'
tags:
- test
- robotframework
- QA

description: ''
categories: ''
serie: 
---


Robot Framework是一個可以用不同的設計方式來進行多方面角度測試的工具  
依據使用的Library, 工具可以建構出一套強大的自動化測試系統  
但是自動率提升之後  
反而需要花費更多人力成本在維護上  
系統的需求又不斷地在變化  
而每一個變化都導致這些測試案例需要即時更新調整  

既然需要調整, 那麼測試案例的可讀性也就相對重要    
一個測試案例從短短數行到十幾行, 甚至可能到上百行    
如果測試案例的步驟無法清楚表達目的, 這勢必造成人員負擔  
所以無論是在測試流程的安排, Keyword的撰寫    
這些都在在影響測試案例的可讀性   

## 測試流程的安排  

在測試流程來說,  
**setup** 是**執行主要測試之前會做的動作**, 可能用來準備好測試數據 或是設定好測試環境  
**teardown** 是**執行完測試之後要做的動作**, 用來回復原本的測試環境   
這兩個步驟除了可以確保每次測試的初始化方式皆相同, 還能確保測試環境為乾淨狀態  

回頭看一下前一天的練習範例  
有找到三個Web測試的共通點嗎? 
每次要執行測試的必做動作就是 打開網頁 **Open Browser**
執行完之後, 也要關閉網頁 **Close Browser**

因此我們根據這個規則, 將 **Open Browser** 提出到Test Setup
而 **Close Browser** 便設定在 Test Teardown
修改之後, 測試案例是不是更簡潔了呢

<figure class="foto-legenda">
	<img src="{{"/assets/img/maruIMG/2020/0229_rf/00.jpg"}}">
</figure>

## Keyword設計原則

除了測試流程的安排, 測試案例中最重要的就是 **Keyword命名**  
一個好的Keyword命名要能協助使用者快速理解此測試步驟的目的  
告訴使用者 這個測試案例要做什麼? 而不是怎麼做  
tell "What", not "How"  

除了命名幫助了解測試案例, 步驟設計也是一個重要考量    
舉網頁登入為例  

網頁登入的功能可能會測試 登入成功, 以及登入失敗兩種  
先看第一種寫法 : 

```
  Valid Login
      inpu text  id=username  ${USERNAME}
      input text  id=password  ${PASSWORD}
      click element  id=submit

  Invalid Login
      inpu text  id=username  ${USERNAME}
      input text  id=password  ${EMPTY_PASSWORD}
      click element  id=submit
```

第二種 : 將關鍵字重新整理後改成如下格式  

```
  Valid Login
    Login With Valid Credentials
    Dashboard Should Be Presented

  Invalid Login
    Should Reject Invalid Credentials  ${USERNAME}  ${EMPTY_PASSWORD}
    Should Reject Invalid Credentials  ${EMPTY_USERNAME}  ${PASSWORD}
```

兩相比較之下, 第二種設計是不是好讀多了, 測試目的也一目了然呢?


關於以上兩點, 可以參考以下網站的介紹  
筆者在剛接觸Robot Framework時, 從中獲得了取多很棒的觀念  
並且也將他好好地運用在工作上  

* [再探 Robot Framework 與 Test Case 撰寫的 Best Practice](http://blog.castman.net/programming/2016/07/28/robotframework.html)
* [How to write good test cases using Robot Framework](https://github.com/robotframework/HowToWriteGoodTestCases/blob/master/HowToWriteGoodTestCases.rst)
* [Robot Framework Dos And Don'ts](https://www.slideshare.net/pekkaklarck/robot-framework-dos-and-donts)

如果要問筆者接觸測試後最有趣的測試工具是什麼  
筆者絕對會回答 Robot Framework  
對初心者來說, 上手快速, 深入研究則可提升技術  
測試案例不僅方便也有條理  
結合CI工具, 真是一個強大的測試框架   