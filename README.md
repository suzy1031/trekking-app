# [岳人](http://3.114.125.180/)(たけと) 写真共有SNSアプリ

山登りや山で食べるご飯(通称:山メシ)が好きな人たちが撮った写真や感想を投稿できるアプリです！

## 簡単な説明

自分が撮った山での写真を共有しませんか？自分がまだ登った事ない山のリアルな口コミを知りたい！山メシがいつもワンパターンになってしまう...他のSNSアプリだと盛られた写真ばかりで非現実的だなと感じている山好きの方々の為のSNSアプリ！加工なしのリアルな写真やお手軽な山メシを等身大の自分を表現できるアプリです！
スマホサイズにも対応しました！chromeの開発者ツールの「toggle devise toolbar」からiphoneサイズを指定して下さい。またはスマホからも確認できます。

***デモ***

![デモ](https://gyazo.com/586b5be9d0535b09a3d9e68ee12f2f7f/raw)

## 機能

- 写真・テキスト投稿・編集・削除
- いいね機能
- フォロー機能


他の機能は[こちら](http://3.114.125.180/posts/tab)を参照して下さい。

## 必要要件

- Ruby version 2.5.1
- Ruby on Rails version 5.2.3

## 使い方

1. テストユーザーが登録されています。トップページ上段右マイページボックス内の「ログイン」ボタンを押してemail「 user1@example.com 」,password「 password 」と入力するとログインできます。
![デモ](https://gyazo.com/b7d57440c6e0b50a68392ce0eb8b2ea0/raw)

2. ログインすると投稿できるようになります。マイページボックス内の「投稿」ボタンを押すと入力画面に遷移します。必要項目(必須)を入力し「投稿する」ボタンを押せば投稿した内容がトップページに表示されます。
![デモ](https://gyazo.com/2c91e1d72a2dfb87204b967e99da7879/raw)

3. 他ユーザーの投稿は画面左上の「最新投稿」内に表示されます。詳しい内容を確認するには該当の投稿をクリックして下さい。詳細画面では「いいね」と「コメント」機能が使えます。いいねはハートマークをクリックすれば反映されます。コメント機能は「コメントを書く」内のフォームに入力し「コメントする」を押せば反映されます。
![デモ](https://gyazo.com/22b25ea836adc1b51f95c0b6b9fe1b44/raw)

4. 「ユーザー一覧」が画面上中央に表示されています。詳しい内容を確認するには該当のユーザーをクリックして下さい。ユーザー詳細画面にはユーザーの投稿一覧の表示と「フォロー」機能が使えます。フォローしている人数・されている人数はトップページのマイページボックスにて確認できます。
![デモ](https://gyazo.com/9ec178c1235009ae32eda7b34454aa35/raw)

他の機能の使い方は[こちら](http://3.114.125.180/posts/tab)を参照して下さい。

## インストール

```
$ git clone https://github.com/suzy1031/trekking-app.git
$ cd trekking-app
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails db:seed
$ rails server
```


## デプロイ

1. AWS利用
2. AWS クラウドストレージS3利用
3. capistranoを使用した自動デプロイ

## テスト駆動開発

- Rspec

## その他


最新情報は[こちら](http://3.114.125.180/posts/tab)を参照して下さい

## 作者

- twitter
[@suy16676187](https://twitter.com/suzy16676187)

- Qiita
[@suzy1031](https://qiita.com/suzy1031)

- はてなブログ
https://suzyanamateurengineer.hatenablog.com/

- wantedly
https://www.wantedly.com/users/120417283

- Mail
52.kohei.sugawara@gmail.com

## ライセンス

