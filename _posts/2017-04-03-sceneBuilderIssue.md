---
layout: post
title:  "Scene Builder 的bug"
image: ''
date: 2017-04-03 23:05
tags:
- Study
- Programming
description: ''
categories: ''
serie: ''
---

<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/sbIssue.png"}}"  alt="再度看到正常畫面真是太開心了">
</figure>

今天碰到一個scene builder的問題<br />
([scene builder](http://docs.oracle.com/javase/8/scene-builder-2/release-notes/index.html)是一個方便javafx設計UI介面的軟體, 可以使用拖拉原件來設計UI, 存檔之後的附檔名為*.fxml)<br />
在intellij IDE 使用scene builder連結打開**fxml**檔案時<br />
scene builder出現了"默默啟動" 並且沒有show出檔案的情況<br />
(默默出現在工作列, 滑鼠指向視窗預覽時, **畫面一片黑**, 無法呈現UI)<br />

在這之前我做過切換JDK的動作, 以為是設定跑掉<br />
於是開始一連串的檢查動作...<br />
* 檢查JDK路徑及內容<br />
* 更換JDK<br />
* 確認scene builder的path<br />
* 重新安裝scene builder<br />
* 重新啟動IDE<br />
* 重新開機(誤)<br />
但是檔案們就像是被設定了黑名單一樣...打開後一片黑<br />
(在meeting前夕發生這種事情, 到底是要逼死誰= =)<br />

用VS Code打開發現內容正常(跟前一版的檔案比對過)<br />
心血來潮對檔案作了**重新命名**的動作<br />

## 結果竟然可以正常開啟 <br />

上網搜尋了一下有無類似問題, **發現這是scene builder的bug**<br />

附上其他網友給的解法 : <br />
* 將**fxml**搬到其他地方, 再搬回原路徑<br />
* 清除scene builder的歷史紀錄(File > Open Recent > Clear Menu > reOpen scene builder)
* 打開工作管理員 > 找到scene builder程式 > 右鍵 > 最大化

真的被雷到了=_=...(哀悼逝去的時間)

































