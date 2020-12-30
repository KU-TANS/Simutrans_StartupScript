# 起動exeの名前をPIDをプロセス経由で取得
$Process_name = (Get-Process -Id $PID).name
$ver = Import-Csv version
 
# 起動ファイル（バージョン名）取得
foreach($a in $ver){
    if ($a.pakName -eq $Process_name) {
        $obj = $a.object
        $ip = $a.ip
        $path = ".\" + $obj

        # 起動したいpakset名で入れる
        $arglist = "-objects $Process_name\ -lang ja -ip $ip"
        # 引数の文字列を作る
        if($Args){
            $arglist = $Args + " $arglist"
        }
        # 引数つきで起動
        Start-Process $path -ArgumentList $arglist
        exit
    }
}

