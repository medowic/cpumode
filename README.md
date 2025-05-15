# cpumode
Scripts that help you to quickly change CPU performance modes

> [!NOTE]
> `cpumode` is must be run with `sudo` or under `root`
> 
> Also this software requires a `cpupower` installed on your machine
## Install
```sh
git clone https://github.com/medowic/cpumode.git
cd cpumode
bash install.sh
```
## Uninstall
In same directory from where `cpumode` was installed located `uninstall.sh`
```sh
cd cpumode
bash uninstall.sh
```
## Usage
### Performance mode
This mode makes your CPU work at maximum frequency
```sh
cpumode performance
```
or you can use a shorter command
```sh
cpuperformance
```
### Balanced mode
This mode makes the CPU work at a minimum frequency when not in use and at a maximum when busy

Also, this mode chooses which mode is available: `schedutil` or `ondemand`.

`schedutil` requires a newer version of the Linux kernel (4.8+), and it works better than `ondemand`
```sh
cpumode balanced
```
or you can use a shorter command
```sh
cpubalanced
```
### Powersave mode
This mode makes the CPU work at the minimum frequency (usually 800MHz). It allows saving power
```sh
cpumode powersave
```
or you can use a shorter command
```sh
cpupowersave
```
### Check current performance mode
This command show current performance mode
```sh
cpumode mode
```
### Check current CPU frequency
This command show current CPU frequency
```sh
cpumode freq
```
# License
This is project is under the [MIT License](https://raw.githubusercontent.com/medowic/cpumode/master/LICENSE)
