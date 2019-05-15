toggleProxy() {
  if [ -z "$HTTP_PROXY" ]; then
    # Oracle proxies is dumb
    export HTTP_PROXY=http://www-proxy.us.oracle.com:80/
    export HTTPS_PROXY=http://www-proxy.us.oracle.com:80/
    export http_proxy=$HTTP_PROXY
    export https_proxy=$HTTPS_PROXY
    # Dont go through proxy for minikube
    printf -v mk_ips '%s,' 192.168.99.{1..255};
    export NO_PROXY="127.0.0.1,localhost,.oracle.com,.oraclecorp.com,.dev,.grungy.us,.local,.r0,.r1,.r2,.corp.dyndns.com,$mk_ips"
    export no_proxy=$NO_PROXY
  else
    unset HTTP_PROXY HTTPS_PROXY NO_PROXY http_proxy https_proxy no_proxy
  fi
}
