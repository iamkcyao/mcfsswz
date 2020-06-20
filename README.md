# Monitor Cloudflare Spectrum Status With Zabbix

- Requirements:
    - Zabbix Server 3.0.5 (It's my version,maybe support other version)
    - jq tools on linux server ( https://stedolan.github.io/jq/ )

### Step:
1. Confirm your Zabbix config was enable below setting not comment
```shell
Include=/etc/zabbix/zabbix_agentd.d/*.conf
```
2. Create spectrum-stats-params.conf file in below path or you want , change mode permission to 644 .
```shell
vi /etc/zabbix/zabbix_agentd.d/spectrum-stats-params.conf
chmod 644 /etc/zabbix/zabbix_agentd.d/spectrum-stats-params.conf
```
3. Create spectrum_stats.sh file in below path or you want , and change mode to 755.
```shell
vi /usr/local/zabbix-agent/scripts/spectrum_stats.sh
chmod 755 /usr/local/zabbix-agent/scripts/spectrum_stats.sh
```
4. Try to get Spectrum Status from zabbix server
```shell
zabbix_get -s ZabbixServer -k spectrum.stats[appID,[appID]]
```
![](https://i.imgur.com/8uub6BL.jpg)

5. Create host from Zabbix Web or import host with ImportHost.xml
	 when you use web to add host , you need put a Macro value
	 ![](https://i.imgur.com/azlyWxP.png)
