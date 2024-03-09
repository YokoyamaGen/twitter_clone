# README

## アプリ概要
railsでXクローンサイトを作成しました。 目的としてDB設計やコントローラなどの設計を0から行いたかったこと、可読性や再利用性の高いコードを学習するためです。コントローラにできる限りロジックを書かずにモデルに書くことを意識しました。それによって、fatコントローラを防ぐことによって、再利用性の高いコードを目指しました。また、コントローラではインスタンス変数をなるべく使用しないようにすることで、見通しの悪く、思わぬ不具合を発生させづらいコードを意識しました。その際に[伊藤淳一さんのQitta記事](https://qiita.com/jnchito/items/2b57316b39d92ca0e8dc#view%E3%81%A7%E5%88%A9%E7%94%A8%E3%81%99%E3%82%8B%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AF%E5%85%A8%E9%83%A8%E3%82%B3%E3%83%B3%E3%83%88%E3%83%AD%E3%83%BC%E3%83%A9%E3%81%A7%E7%94%A8%E6%84%8F%E3%81%99%E3%81%B9%E3%81%8D)を参考にしました。

## 機能

- サインアップ、ログイン機能、githubログインの実装
  ![demo](https://gyazo.com/662478a2d9b7b357f3794be5d26d612c/raw)

  <br>
- トップページ
  ![demo](https://gyazo.com/ef59cd9b20ef49155fc2dcb37b7dce5a/raw)

  <br>
- ユーザープロフィールページ
  ![demo](https://gyazo.com/5fb801638f4f1870f0510b6aa9af2ae0/raw)

  <br>

- プロフィール編集画面
  ![demo](https://gyazo.com/8a073fe78344b09f3da50984dacefc4d/raw)
  
  <br>
- ツイート作成
  ![demo](https://gyazo.com/94ad6ab126b1f47edcef9bcd8fb9fdab/raw)

  <br>
- ツイート詳細ページ
  ![demo](https://gyazo.com/17c4695597be6761095983b29f792537/raw)

  <br>
- いいね機能
  ![demo](https://gyazo.com/659604e69d3bec404100f4b7ef6e1c64/raw)

  <br>
- リツイート
  ![demo](https://gyazo.com/dc67230e638b42f6228850a5e16857f0/raw)

  <br>
- ユーザーフォロー
  ![demo](https://gyazo.com/51fe330f0f3904c585b97b38f5a0deae/raw)

  <br>
- ブックマーク
  ![demo](https://gyazo.com/2a36097412083b6d9998a16dddc2ffce/raw)

  <br>
## 改善点
- 今回はMPAで実装しましたが、画面遷移のパフォーマンス改善のためにSPA化を実施したいです。よりユーザが画面操作にストレスを感じさせないようにしたいです。
- 機能を追加。メッセージ機能、通知機能、Twitter Blueを実装したいです。サイドバーは実装しておりますが、これらの機能も追加していきたいです。

## 前提

- dockerが必要です。

## setup

```
docker compose build
```

```
docker compose run --rm web bin/setup
```


```
docker compose run --rm web yarn install
```

## run

```
docker compose up
```

http://localhost:3000

## 備考

## rubocop

auto correct

```
docker compose run --rm web bundle exec rubocop -A
```

## htmlbeautifier

erbのフォーマッターです。

```
docker compose run --rm web bin/htmlbeautifier
```
