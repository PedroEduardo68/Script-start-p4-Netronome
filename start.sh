iptables -A INPUT -p tcp -m tcp --dport 20406 -m conntrack --ctstate NEW -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 20206 -m conntrack --ctstate NEW -j ACCEPT
export LD_LIBRARY_PATH=/opt/nfp_pif/lib
nohup /opt/nfp_pif/bin/pif_rte -n 0 -p 20206 -I -z --sdk-debug -s /opt/nfp_pif/scripts/pif_ctl_nfd.sh 1> /home/upf/log_rte_manager.log &
nohup /opt/netronome/nfp-sdk-hwdbgsrv/server/nfp-sdk-hwdbgsrv -n 0 -p 20406 -l7 -A 1> /home/upf/log_debug_rte.log &
