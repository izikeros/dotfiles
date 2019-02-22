ip route | grep -q '192.168.'

greprc=$?

# Proxies:
WROC="http://10.158.100.120:8080/"
GER="http://10.158.100.2:8080/"
PROXY_144="http://10.144.1.10:8080/"

if [[ $greprc -eq 0 ]] ; then
    unset http_proxy
    unset https_proxy
    unset ftp_proxy
    unset rsync_proxy
    unset no_proxy
    echo "No need for proxy"
else
    if [[ $greprc -eq 1 ]] ; then
        export http_proxy=$GER
        export https_proxy=$http_proxy
        export ftp_proxy=$http_proxy
        #export rsync_proxy=$http_proxy
        export no_proxy=nsn-net.net,nsn-intra.net
        echo "Proxy set to: $http_proxy"
    else
        echo Some sort of error
    fi
fi

