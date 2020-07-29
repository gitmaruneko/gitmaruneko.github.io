---
layout: post
title:  "Stop Energy"
image: ''
date: 2017-12-30 11:50
tags:
- Testing
- CI
- Work
description: ''
categories: ''
serie: ''
cover: '/assets/img/maruIMG/20171230/03.jpg'
---

研究所畢業回歸業界, 以菜鳥之姿進入**伺服器**領域  
上班的第一個月, 我先由整合測試的角度建立伺服器的基礎知識  
過程發現許多可以協助測試 team改善的地方  
於是誤打誤撞變成主導自動化測試的負責人  

### 真自動化或自以為自動化?

有落實測試的開發人員應該知道  
除了developer本身要寫單元測試以外  
在release產出後, 還會有其他諸如功能測試之類的驗證    

此測試 team所擔任的即是模組整合測試的角色  
這些測試工程師每周皆需要做各模組 (電源溫控, UEFI...等) 的測試工作  
假設一個產品平台有5個模組需要測試  
6個產品便有30次模組測試  
以開發後期來說, 功能運作已趨於穩定  
按理應該可以使用全自動化測試以減輕測試人員負擔  
但是測試 team沒有落實這件事情  

他們每周都要做6次以上如下圖般的流程 :
<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/20171230/00.png"}}">
</figure>

1. developer release 待測產出 (Copy image至File center)
2. developer 通知 tester 可以開始進行測試工作 (發EMail)  
3. tester 設定configuration (改檔名、設定環境...等)
4. tester 開始一連串的手動測試 + 某些可用 script 進行的測試 
5. tester 檢視所有測試結果, 若有需要便開defect
6. tester 整合最終測試結果至Excel表, 發Email給相關人員

看到這邊是不是覺得這些tester很累呢?  
我請tester讓我負責其中一個模組  
(我只做了兩次便受不了了)  
而他們還覺得這樣其實挺自動化了  
因為其中一段測試工作可以用script來運行  ╮(╯∀╰)╭

 anyway, 我不是認為這樣工作不好, 只是若可以用更有效率的方式來解決那是再好不過的了


### 改善點

於是我在某次的presentation中提出了改善測試的想法  

希望可以藉由Jenkins達到自動化最大化的測試流程  
與上圖對比, 由圖中可得知許多原本綁定在人身上的任務都可以交由Jenkins來完成  
(是不是很棒呢! 這樣就有更多時間做別的事啦! (誤))
<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/20171230/01.png"}}">
</figure>

由於現行的測試自動化含量非常少  
從developer開始 (例如git kick of jenkins build image and run unittests)
一直到 自動運行整合測試  
還有整合最後結果的報告  
整體來說是很大的架構  

要讓測試報告視覺化顯示更是一大挑戰  
因為目前的測試只有command line 輸出到txt的文字結果  
而這部份我還沒想好怎樣處理  
在Jenkins上也沒找到較符合需求的套件  
(感覺好像踏入了深水區阿 XDD)  
另外還有改變存放報告的作法  
目前都是由tester 發EMail附Excel檔  
不但保存不易, 查找又不方便  
若可以統整在Jenkins內,  在管理上絕對便利許多  
其他還有雜亂的測試script架構...等  
該改進的地方真是說不完  ╮(╯∀╰)╭ (再度攤手)  
(當下覺得從軟體架構看公司組織這句話真是很有道理)  


### 導入自動化過程中的難處與阻礙

為了讓建議被採納, 讓大家有信心完成此做法  
不能單單只提出想法  
所以我先以目前狀況加入Jenkins輔助, 運行測試給同事們看  
讓大家知道, 此為完全可行, 而非空口無憑  

不過, 雖然大家傾向同意  
但他們內心有個擔憂便是 : 若這些工作都能讓Jenkins完成, 那我的貢獻不就變少了?  
還有在討論初期, 有位同事很害怕做法改變或要學新東西  
一直很緊張的跑來問我到底要改怎樣  ╮(╯∀╰)╭  
(怎麼那麼害怕改變呢?)  
甚至有同事半開玩笑地說  我要讓他們失業了  
所以開會討論時, 便時不時有質疑的聲音出現  
我也只能投入更多耐心解釋, 並且讓他們了解, 這其實是在幫助他們  
所以...我想...直到完全導入成功, 我還會接收到更多類似的負面情緒吧 XDD  
時不時都會想到這篇文章  
### [Stop Energy](https://open.buffer.com/stop-energy/)

```
引述其中一段文字 :

I can’t say we’ve figured everything out,  
but being mindful of Stop Energy has allowed me to 
navigate some of the challenges of making decisions with more people on board.
```


所以在第二個月  我幾乎全致力於了解目前開發的完整流程並著手規劃  
審視完狀況後  發現要做到全自動化並非不可能  
最理想情況當然要從developer端就運行自動化  
(其實我挺訝異這間公司沒有採用這個做法)  
不過因為有太多develop team合作開發  
所以要制定統一的做法是個碩大工程  


直到最近才發現, 其實工程師也還是在處理人的問題  
目前公司內的同事平均年紀約40歲左右  
幾乎每個年紀及資歷都比我高  
和這些人一同共事, 是一門學問  

而測試team的同事並沒有花太多心力在了解基礎知識或撰寫程式上  
更別提測試理論或概念了  
正因為對developer有高度依賴性, 
所以在幫他們建立這些自動化測試概念的過程中
更要小心, 耐心地引導, 大家才能一同成長

當然, 也不全然都是質疑聲浪  
還是有一兩個同事很贊同這樣的做法  
願意開始學習並且和我一起完成  
老闆也是全力支持  
能放手做事的感覺真好  

最後, 附上一段最近看的一本書**測試架構師修煉之道**提到的  
測試工程師在團隊中的定位  
<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/20171230/03.jpg"}}">
</figure>







