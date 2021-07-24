# README
# Excite Map

# 概要
小さな感動を、地図に散りばめよう。

Excite Mapは散歩に特化した地図アプリです。
ユーザーが自分の足で歩いて発見したエキサイティングな場所を地図上に表示します。歪な模様の排水溝、不思議な形の朽ち木。地図には載らないような、小さな心踊る場面がこのExcite Mapには散りばめられています。身の回りの隠れた魅力を見つける散歩に出かけてみましょう。

## 【みんなで作るエキサイティングなマップ】
散歩をしてみつけたエキサイティングな場所を地図上に登録します。全ユーザーの投稿が地図に反映されるため、Excite Mapオリジナルの地図として成長していきます。ユーザー同士で共有し合うことで、気づくことができなかった小さな感動を手軽に体験することができます。

## 【新たな視点の獲得】
・施設名のついた場所だけが”場所”ではありません。それを頭の片隅に置いて散歩をするだけで、今まで無視され続けてきた隠れた魅力の第一発見者になることができます。
・Excite Mapは固定概念と化した街への眼差しを良い意味で崩し、新たな視点を獲得することをサポートします。

## 【エキサイトプレイスの発見/登録】
歩いている最中に見つけた、人の心を"少しでも"動かしたエキサイティングな場所、それがエキサイトプレイス。発見したユーザーは、それを登録することができます。多ければ多いほどExcite Mapは発展していくので、皆さんで盛り上げていきましょう。

## 【散歩を介した新たなコミュニケーション】
他のユーザーが登録したプレイスを実際に訪れることで、「この投稿者はどうしてこう感じたんだろう」「半年前とは少し様子が変わっているな」など今までにない新しい形のコミュニケーションが生まれます。これにより、一人での散歩もまるで誰かと感想を共有し合いながら歩いているようなワクワクする体験へと変わるでしょう。

## 【気分の登録により濃密な散歩体験を実現】
・Excite Mapではエキサイトプレイス登録時に、その場所に出会った時の”気持ち”も合わせて登録するように設定しています。
・他のユーザーが登録した場所を訪れた際に、その”誰か”と価値観を共有したり、想いを馳せることができます。
・地図上には登録された気持ちがピンの色となって表示されるため、散歩コースの決め手にもなります。

※登録できる”気持ち”は、落ち着く/楽しい/幸せ/やる気/不満/絶望感の６種類(2020年7月現在)

## 【こんな方にオススメ】
・散歩が好き
・生活圏内に飽きた
・運動不足を解消したい
・素直な心で街が歩きたい

## 【完全版について】
現在Excite MapはVer.1です。後日リリース予定の完全版ではより多くの機能が使用可能になります。より豊かな散歩ライフをお楽しみにお待ちください。

## 【注意事項】
スマホを見ながらの歩行は大変危険ですのでおやめください。
エキサイトプレイス登録時は、プライバシー侵害にご注意ください。
立ち入り禁止区域や危険な場所でのご利用はお控えください。

# 開発
## デプロイ
```
$ heroku container:login
$ heroku container:push -a excite-map
```

# その他
## API Document
- http://redocly.github.io/redoc/?url=http://54.168.87.215/api/api_docs.json#operation/find_spot_by_id
