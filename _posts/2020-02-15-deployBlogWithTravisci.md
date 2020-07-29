---
layout: post
title:  "以Travis CI建置並部署部落格"
image: '/assets/img/maruIMG/2020/0215/07.png'
date: 2020-02-15 10:50
cover: '/assets/img/maruIMG/2020/0215/07.png'
tags:
- travisci
- blog
- jekyll

description: ''
categories: ''
serie: 
---


建立了第二個部落格來記錄每天學到的或思考的內容  
比較像是隨手紀錄, 並且養成寫作習慣  
由於使用githubpage結合jekyll比較上手   
這次也採用同樣的方式   
但是挑選了不同的theme - [jekyll-dash](https://github.com/bitbrain/jekyll-dash)  

由於gitgub page不支援某些jekyll的套件  
如果直接將版式內容上傳至github  
像是tag這樣的功能會無法顯示   
(無法分類對我來說是個大問題)   

那怎麼辦呢?  
又回去看作者提供的方式  
* 需先建立一個和blog repo分開的 repository  
* 設定**[Travis CI](https://travis-ci.org/)**  
* 提交寫完的部落格內容後, 便會觸發Travis CI建置  
* 如果build pass便會自動部署到blog repo  

<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/2020/0215/00.jpg"}}">
</figure>

之前念研究所時就看同學用過Travis CI  
剛好利用這次的機會玩玩  

### Travis CI 存取 Github的權限設定
先去github取得token  
<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/2020/0215/03.jpg"}}">
</figure>

接著在TravisCI的project中設定此token即可  
<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/2020/0215/04.jpg"}}">
</figure>

之後當提交寫完的部落格內容時  
便會自動觸發TravisCI建置  
建置畫面 :   
<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/2020/0215/05.jpg"}}">
</figure>


建置完成, build pass後便會自動deply至原本的blog repo  
<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/2020/0215/06.jpg"}}">
</figure>

新版部落格畫面 :  
<figure class="foto-legenda">
	<img src="{{ "/assets/img/maruIMG/2020/0215/07.jpg"}}">
</figure>

頭一次使用Travis CI    
設定上的便利使我很驚豔  
登入TravisCI 設定好github project  
在專案內做好權限設定即可  
完全無痛   
建置失敗也能從build log看到過程, 找出失敗原因  
整體來說是很棒的體驗 :)

(有種劉姥姥進大觀園的感覺)

## 廢話部落格終於開張啦~~~










 
























