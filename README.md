# logspout-fluentd

Tiny [Logspout](https://github.com/gliderlabs/logspout) adapter to send Docker container logs to [Fluentd](https://github.com/fluent/fluent) via UDP or TCP. This just the hosted working version of [segmentio/logspout-fluentd](https://github.com/segmentio/logspout-fluentd).

## Example

A sample `docker-compose.yaml` file:

```yaml
version: '2'
services:
  logspout:
    image: nodeintegration/logspout-fluentd
    restart: on-failure
    environment:
      ROUTE_URIS: fluentd-tcp://fluentd:24224
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock

  fluentd:
    image: nodeintegration/fluentd
    command: |+
      fluentd -c /fluentd/etc/fluent.conf -i '
      <source>
      @type forward
      port 24224
      </source>
      <match **>
      @type stdout
      </match>'
```
