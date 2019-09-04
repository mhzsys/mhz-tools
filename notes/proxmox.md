# ProxMox notes

## Disable no subscription warning
- https://johnscs.com/remove-proxmox51-subscription-notice/
```
sed -i.bak "s/data.status !== 'Active'/false/g" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js && systemctl restart pveproxy.service

```
