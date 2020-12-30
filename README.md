# KU-TANS標準起動スクリプト
- 当NSおよび某NS用に作成したスクリプトです
- 可能な限り一般化してありますが、一部に癖が残っていますのでご注意ください
## 内容物
### pak.pakname.ps1
- windows用の起動スクリプトです
- PS2EXE-GUIでビルドして、使用してください
### pak.pakname.exe
- pak.pakname.ps1をPS2EXE-GUIでビルドしたものです
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
- windows環境用のサーバーモード起動スクリプトです
- PS2EXE-GUIでビルドして、使用してください
### pak.pakname_server.exe
- pak.pakname_server.ps1をPS2EXE-GUIでビルドしたものです
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
- pak.pakname.exe を引数付きで実行すると、その引数がsimutrans起動時の引数になります
    - デフォルトのオプションを上書きできます
### pak128japan_server.ps1
- Linux環境用のサーバーモード起動スクリプトです
    - simutransをサーバーモードで起動します
- 実際のpakのフォルダ名+_serverとなるように名前を変更してください
    - 例：paksetのフォルダ名がpak.nipponのとき
        - pak.nippon_server.exe
- 後述のversionファイルとversion_serverが必要です
    - versionファイルのobjectに書かれた名前のsimutrans本体を起動します
        - 例：objectに`sim-linux-OTRPv27_2`と書かれている場合
            - `sim-linux-OTRPv27_2`を起動します
- 以下のオプションが自動で適用されます
    - server
    - server_admin_pw
    - objects
    - lang ja
- pak.pakname.exe を引数付きで実行すると、その引数がsimutrans起動時の引数になります
    - デフォルトのオプションを上書きできます
### version
- csv形式です
- 全てのスクリプト実行時に必要です
- 記入項目
    - pakフォルダ名
    - 使用する本体の名前
    - IPアドレス（ポート含む）
        - IPさえあればportは書かなくても動きます（この時":"は書かないでください）
            - この際デフォルトの13353ポートになります
        - IPアドレスはserver起動時に必要な物ではありますが、当NSの都合上こちらに入ってます
- デフォルトで例が書いてあります
    - 1行目を除き、不要なものは消しても問題ありません

### version_server
- csv形式です
- `_server`がついているスクリプトを実行するときに必要です
- 記入項目
    - pakフォルダ名
    - nettoolパスワード(nettoolを使用しないときは不要)
    - 起動追加option
        - optionは以下のものが後述の起動スクリプトに書かれていますので不要です
            - server
            - server_admin_pw
            - objects
            - lang ja
        - ショートカットから引数を与えることも可能です

## フォルダ構成
- Simutrans本体およびpaksetフォルダと同様の階層に配置してください