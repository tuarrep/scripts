# scripts
Various Linux scripts I use

## Scripts
- `51-android.rules`: Udev rule to fix `error: insufficient permissions for device` when debugging Android through ADB
- `change-volume-app.sh`: Script to programmatically change app volume (PulseAudio)
- `copyright.js`: Simple Javascript script to add current append current to the DOM (typically to generate footer copyright)
- `detectTty.sh`: Shell script to detect serial tty (veeeeery old, be carefull! PR are welcome ;P)
- `iptables-docker.sh`: Enforce iptables rules to block direct access to Docker containers from the outside world
- `maildev-systemd.sh`: Install maildev dev mail server as a systemd service to auto start at boot
- `myqsl_encoding.sh`: Convert encoding of all tables of a MySQL database (buggy)
- `vue-build-n-serve-docker`: Dockerfile to build and serve VueJs app with light image (~16MB)
