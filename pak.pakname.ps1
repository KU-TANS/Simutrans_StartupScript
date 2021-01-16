# 起動exeの名前を取得
if ($MyInvocation.MyCommand.CommandType -eq "ExternalScript"){ 
    $Process_name = [System.IO.Path]::GetFileNameWithoutExtension($MyInvocation.MyCommand)
}
else {
    $Process_name = [System.IO.Path]::GetFileNameWithoutExtension([Environment]::GetCommandLineArgs()[0])
}

$ver = Import-Csv version
 
# 起動ファイル（バージョン名）取得
foreach($a in $ver){
    if ($a.pakName -eq $Process_name) {
        $obj = $a.object
        $ip = $a.ip
        $path = "./" + $obj

        # 起動したいpakset名で入れる
        $arglist = "-objects $Process_name/ -lang ja -ip $ip"
        # 引数の文字列を作る
        if($Args){
            $arglist = $Args + " $arglist"
        }
        # 引数つきで起動
        Start-Process $path -ArgumentList $arglist
        exit
    }
}

