# My dot files

These are just my config files.  
Unless you know what you're doing, I don't recommend you to use the same configuration since it has been changed to suit my needs.
Bear in mind it's a configuration for a Debian minimal installation. Other distros might have other configuration issues.

---

# First time configuration, installing Debian minimal...

## 1 - Wifi connection

After a minimal installation, we don't have a wifi connection. Because of that, we need to create a wpa_supplicant config file. So, we might be able to stablish a wifi connection via command line.

Creating the wpa_supplicant.conf

```bash
$ sudo touch /etc/wpa_supplicant.conf
```

Editing the file with vim.tiny (`sudo vim.tiny /etc/wpa_supplicant.conf`), add these lines: 

```bash
network={
    ssid="network_name"
    psk="network_pass"
}
```
After creating the wpa_supplicant config, it's time to connect:

```bash
# Get the wifi interface name. In my case, it's awlays "wlo1"
$ ip a

# Preparing for connecting
$ sudo ip link set wlo1 down
$ sudo ip link set wlo1 up

# Connecting
$ sudo wpa_supplicant -B -i wlo1 -c /etc/wpa_supplicant.conf -Dnl80211,wext
$ sudo dhclient wlo1
```

## 2 - Installing NVIDIA driver

[Guide](https://www.if-not-true-then-false.com/2021/debian-ubuntu-linux-mint-nvidia-guide/)
