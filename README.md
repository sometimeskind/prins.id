# prins.id

A personal landing page. Displays a hedgehog (🦔) by default, or a lobster (🦞) if you connect over IPv6. The turtle (🐢) in the HTML source is the placeholder that nginx replaces at serve time.

## How it works

nginx inspects `$remote_addr` at request time. IPv6 addresses always contain a colon; IPv4 never do. A `map` directive uses that to set an `$emoji` variable, and `sub_filter` replaces a placeholder in the HTML before serving it.

```nginx
map $remote_addr $emoji {
    ~:      "🦞";   # IPv6
    default "🦔";   # IPv4
}
```

> **Note:** if nginx sits behind a proxy that terminates IPv6 (e.g. a Kubernetes ingress or CDN), `$remote_addr` will be the proxy's IPv4 address and the lobster won't appear. Direct connections only.

## Testing locally

```bash
docker build -t prins.id .
docker run -p 8080:8080 prins.id

# IPv4 — hedgehog
curl http://localhost:8080

# IPv6 — lobster
curl http://[::1]:8080
