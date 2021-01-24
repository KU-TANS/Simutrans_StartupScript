# KU-TANS標準起動スクリプト
- 弊NS（KU-TANS）および某NS用に作成したスクリプトです
- 可能な限り一般化してありますが、一部に癖が残っていますのでご注意ください
- pak.pakname.exeおよびpak.pakname_server.exeのiconは以下のものを利用させて頂きました
    - https://github.com/aburch/simutrans/blob/master/stormoog.ico
## 内容物
### pak.pakname.ps1
- 起動スクリプト本体
- 実際のpakのフォルダ名と一致するように名前を変更してください
    - 例：paksetのフォルダ名がpak.nipponのとき
        - pak.nippon.ps1
- 後述のversionファイルが必要です
    - versionファイルのobjectに書かれた名前のsimutrans本体を起動します
        - 例：objectに`sim-WinGDI-OTRPv27_2.exe`と書かれている場合
            - `sim-WinGDI-OTRPv27_2.exe`を起動します
- 以下のオプションが自動で適用されます
    - objects
    - lang ja
- 引数付きで実行すると、その引数がsimutrans起動時の引数になります
    - デフォルトのオプションを上書きできます
        - 日本語以外で起動するときなどに利用してください
### pak.pakname.exe
- pak.pakname.ps1をPS2EXE-GUIでビルドしたものです
    - Windowsでのみ使用可能です
- 実際のpakのフォルダ名と一致するように名前を変更してください
    - 例：paksetのフォルダ名がpak.nipponのとき
        - pak.nippon.exe
- 後述のversionファイルが必要です
    - versionファイルのobjectに書かれた名前のsimutrans本体を起動します
        - 例：objectに`sim-WinGDI-OTRPv27_2.exe`と書かれている場合
            - `sim-WinGDI-OTRPv27_2.exe`を起動します
- 以下のオプションが自動で適用されます
    - objects
    - lang ja
- pak.pakname.exe を引数付きで実行すると、その引数がsimutrans起動時の引数になります
    - デフォルトのオプションを上書きできます
        - 日本語以外で起動するときなどに利用してください
### pak.pakname_server.ps1
- サーバーモードでの起動スクリプト
    - simutransをサーバーモードで起動します
- 実際のpakのフォルダ名+_serverとなるように名前を変更してください
    - 例：paksetのフォルダ名がpak.nipponのとき
        - pak.nippon_server.ps1
- 後述のversionファイルとversion_serverファイルが必要です
    - versionファイルのobjectに書かれた名前から`_server`を付けた状態の名前のsimutrans本体を起動します
        - 例：objectに`sim-WinGDI-OTRPv27_2.exe`と書かれている場合
            - `sim-WinGDI-OTRPv27_2_server.exe`を起動します
- 以下のオプションが自動で適用されます
    - server
    - server_admin_pw
    - objects
    - lang ja
- pak.pakname_server.ps1 を引数付きで実行すると、その引数がsimutrans起動時の引数になります
    - デフォルトのオプションを上書きできます
### pak.pakname_server.exe
- pak.pakname_server.ps1をPS2EXE-GUIでビルドしたものです
    - simutransをサーバーモードで起動します
    - Windowsでのみ使用可能です
- 実際のpakのフォルダ名+_serverとなるように名前を変更してください
    - 例：paksetのフォルダ名がpak.nipponのとき
        - pak.nippon_server.exe
- 後述のversionファイルとversion_serverファイルが必要です
    - versionファイルのobjectに書かれた名前から`_server`を付けた状態の名前のsimutrans本体を起動します
        - 例：objectに`sim-WinGDI-OTRPv27_2.exe`と書かれている場合
            - `sim-WinGDI-OTRPv27_2_server.exe`を起動します
- 以下のオプションが自動で適用されます
    - server
    - server_admin_pw
    - objects
    - lang ja
- pak.pakname_server.exe を引数付きで実行すると、その引数がsimutrans起動時の引数になります
    - デフォルトのオプションを上書きできます
### version
- csv形式です
- 全てのスクリプト実行時に必要です
- 記入項目
    - pakフォルダ名（pakName）
    - 使用する本体の名前（object）
    - IPアドレス（ポート含む）（ip）
        - IPさえあればportは書かなくても動きます（この時":"は書かないでください）
            - この際デフォルトの13353ポートになります
        - IPアドレスはserver起動時に必要な物ですが、弊NSの都合上こちらに入ってます
            - 通常起動時には空欄でも問題ありません
    - 追加オプション（option）
        - ショートカットから引数を与えることも可能です
- デフォルトで例が書いてあります
    - 1行目を除き、不要なものは消しても問題ありません

### version_server
- csv形式です
- `_server`がついているスクリプトを実行するときに必要です
    - pak.pakname_server.ps1
    - pak.pakname_server.exe
- 記入項目
    - pakフォルダ名（pakName）
    - nettoolパスワード（nettoolを使用しないときは不要）（pass）
    - 起動追加option（option）
        - ショートカットから引数を与えることも可能です
- デフォルトで例が書いてあります
    - 1行目を除き、不要なものは消しても問題ありません

## フォルダ構成
- 必要なファイルをSimutrans本体およびpaksetフォルダと同様の階層に配置してください

## ライセンス
- スクリプトはMITライセンスです
- 実行ファイルはアイコンにSimutrans Standardのicon画像を利用しているため、[Artistic License](https://github.com/aburch/simutrans/blob/master/simutrans/license.txt)に従います

## 変更履歴
- 2021/01/24
    - versionファイルにoptionの項目を追加し、起動スクリプトで追加のオプションを設定可能に