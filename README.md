# octoprint-k8s-socat
Ever wanted to use Octoprint in a K8s pod and connect to a 3D printer remotely over the network? Then this might be for you.

## Socat on the container's side (octoprint-k8s-socat)
Octoprint image with socat and some YAML files for K8s deployment

I am using MetalLB so your service.yaml file might look a little different. Also the persistent volume claim depends on your environment.

The environment variables needed for socat are set in the deployment octoprint.yaml.

* SOCAT_PRINTER_TYPE specifies the type of the socat connection. (mostly tcp)
* SOCAT_PRINTER_HOST specifies the hostname on which the printer is actually connected.
* SOCAT_PRINTER_PORT sets the port used in socat on the printer host's side.
* SOCAT_PRINTER_LINK names the device in the octoprint container (what you would choose under "connection").

## Socat on the printer host's side
On the printer host's side (where your printer is actually connected to) you will also need socat running.  You will need something like

```bash
/usr/bin/socat TCP4-LISTEN:4000,fork,reuseaddr /dev/ttyACM0,raw,echo=0,b115200
```

You could also wrap this in a systemd service unit like

```bash
[Install]
WantedBy=multi-user.target

[Service]
ExecStart=/usr/bin/socat TCP4-LISTEN:4000,fork,reuseaddr /dev/ttyACM0,raw,echo=0,b115200
User=root
Restart=always
RestartSec=10
```
