isTor(){
  xh --proxy all:socks5h://127.0.0.1:9050 https://check.torproject.org/api/ip | jq
  echo "tor port check"
  ss -ltn | grep 9050
}
