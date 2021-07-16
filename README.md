# Istio Helm Charts

Istio can be [installed through Helm][istio-helm], but Istio’s maintainers [don’t publish a repository][istio-issue] of the Istio charts.

This repository fills that gap.

```sh
helm repo add istio https://fablestudios.github.io/istio-charts/
```

[istio-helm]: https://istio.io/latest/docs/setup/install/helm/
[istio-issue]: https://github.com/istio/istio/issues/31275
