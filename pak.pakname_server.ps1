# 起動exeの名前をPIDをプロセス経由で取得
$Process_name = (Get-Process -Id $PID).name
$ver = Import-Csv version

# _serverを消す
$Process_name = $Process_name.remove($Process_name.length -7,7)

$ver_server = Import-Csv version_server

# 起動ファイル（バージョン名）取得
foreach($a in $ver){
    if ($a.pakName -eq $Process_name) {
        $obj = $a.object
        $ip = $a.ip

        $basename = $obj.remove($obj.length -4,4)
        $path = ".\" + $basename + "_server" + ".exe"

        foreach ($b in $ver_server) {
            if ($b.pakName -eq $Process_name) {
                $pass = $b.pass
                $option = $b.option
                break
            } 
        }
        $port_colon = $ip.IndexOf(':')
        if ($port_colon -eq -1){
            $port = "13353"
        }
        else {
            $port = $ip.remove(0,$port_colon+1)
        }
        # 起動したいpakset名で入れる
        $arglist = "-server $port -server_admin_pw $pass -objects $Process_name\ -lang ja $option"

        if($Args){
            $arglist = $Args + " $arglist"
        }

        # 引数つきで起動
        Start-Process $path -ArgumentList $arglist
        exit
    }
}

