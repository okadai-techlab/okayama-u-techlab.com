# 岡山大学テクノロジーラボのWebサイト

岡山大学テクノロジーラボのWebサイトは[Sinatra](http://www.sinatrarb.com/)というRubyのWebフレームワークで作られてます。

pull requestを使った開発フローは[こちら](http://www.slideshare.net/totzyuta/git-introduction-50076451)。


## 起動方法

変更したデザインを確認するための、Sinatraアプリのローカルでの立ち上げ方法です。(簡単です)

まずは、必要なRubyのgem(ライブラリ的なもの)をインストールします。といってもインストールは簡単で、以下のコマンドを叩けば自動で必要なものを入れてくれます。

```
$ bundle install
```

そして、SinatraのWebアプリ（Webサイト）を立ち上げるには以下のコマンドを打ちます。

```
$ bundle exec rackup 
```

これでローカルでWebサーバーが立ち上がったので、chromeやsafariなどのブラウザから以下のURLで見れます。

```
http://localhost:4567
```

## 編集方法

- HTML

HTMLファイルは、`views`ディレクトリの中にあります。中には`.erb`となっているファイルがあると思います。Rubyのコードを埋め込むために`.html`ではなく`.erb`という形式を使っているのですが、中身はほとんどHTMLです。

この中の`index.erb`が本体になっているので、ここがメインで編集するところになります。

それぞれのメンバー紹介のところは、[ここらへん](https://github.com/totzYuta/okayama-u-techlab.com/blob/master/views/index.erb#L114)ですね。

- CSS

スタイルを編集する場合は、`public/css`ディレクトリの中にある`style.css`を編集してください。

- 画像

画像を追加するときは、`public/img/`以下に追加してください。


- Ruby

アプリの起動や、メールの送信などの機能がいまのとこあります。`app.rb`に書いてます。


## Good to Code

いかんせん急ピッチでテンプレをもとに作ったサイトなので、作業が非常に荒いです。笑

間違っているところなど多々あるので、もし気づいたところがあれば[issues](https://github.com/okadai-techlab/okayama-u-techlab.com/issues)のページからissueを作っていただくか、[pull request](https://github.com/okadai-techlab/okayama-u-techlab.com/pulls)を出していただけますと嬉しいです。、
