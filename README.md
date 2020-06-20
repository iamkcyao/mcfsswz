# Monitor Cloudflare Spectrum Status With Zabbix

- Requirements:
    - Zabbix Server 3.0.5 (It's my version,maybe support other version)
    - jq tools on linux server ( https://stedolan.github.io/jq/ )

### Step:
1. Create spectrum-stats-params.conf file in below path or you want , change mode permission to 644 .
```shell
vi /etc/zabbix/zabbix_agentd.d/spectrum-stats-params.conf
chmod 644 /etc/zabbix/zabbix_agentd.d/spectrum-stats-params.conf
```
2. Create spectrum_stats.sh file in below path or you want , and change mode to 755.
```shell
    vi /usr/local/zabbix-agent/scripts/spectrum_stats.sh
	chmod 755 /usr/local/zabbix-agent/scripts/spectrum_stats.sh
	```
