#!/usr/sbin/nft -f

table inet filter {
  chain input {
    type filter hook input priority 0; policy drop;

    # Permitir tráfico local
    iifname "lo" accept

    # Permitir DNS (udp y tcp puerto 53)
    udp dport 53 accept
    tcp dport 53 accept

    # Permitir ICMP (ping)
    ip protocol icmp accept
  }
}
