## noVNC Display Container

This image is intended to be used for connecting to VNC servers in a browser.
It's been pared down to be most useful as a [Nomad](https://www.nomadproject.io)
task, so it lacks an internal supervisor intentionally to leverage Nomad's task
restarting behavior.

### Image Contents

* [noNVC](https://kanaka.github.io/noVNC/) - A HTML5 canvas vnc viewer

### Usage
```hcl
.....
group "qemu" {
  network {
    mode = "bridge"
    port "novnc" {}
  }

task "qemu" {
  driver = "qemu"

  resources {
    cpu    = 2000
    memory = 2048
  }

  config {
    image_path  = "alloc/data/image.img"
    accelerator = "kvm"

    graceful_shutdown = true

    args = [
      "-vnc", "127.0.0.1:1"
    ]
  }

  artifact {
    source      = "https://example.com/image.img"
    destination = "alloc/data/"

  }
}

task "novnc" {
  driver = "docker" 

  lifecycle {
    hook    = "poststart"
    sidecar = true
  }

  resources {
    cpu    = 10
    memory = 32
  }

  env {
    NOVNC_PORT   = "${NOMAD_PORT_novnc}"
    NOVNC_TARGET = "127.0.0.1:5901"
  }

  config {
    image = "nahsihub/novnc"
    ports = ["novnc"]
  }
}

.....
```

### Variables

- `${NOVNC_PORT}` - port for NOVNC to listen on
- `${NOVNC_TARGET}` - address of the VNC server to connect to

## Thanks
___
This is based on the novnc container by @angrycub: https://github.com/angrycub/docker-novnc which:
- is based on the novnc container by @theasp: https://github.com/theasp/docker
- is based on the alpine container by @psharkey: https://github.com/psharkey/docker/tree/master/novnc
- is based on [wine-x11-novnc-docker](https://github.com/solarkennedy/wine-x11-novnc-docker) and [octave-x11-novnc-docker](https://hub.docker.com/r/epflsti/octave-x11-novnc-docker/)
