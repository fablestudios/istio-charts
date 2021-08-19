# Istio Helm Charts

Istio can be [installed through Helm][istio-helm], but Istio’s maintainers [don’t publish a repository][istio-issue] of the Istio charts.

This repository fills that gap.

[istio-helm]: https://istio.io/latest/docs/setup/install/helm/
[istio-issue]: https://github.com/istio/istio/issues/31275

## Install Istio

First, add this Helm repository:

```sh
helm repo add istio https://fablestudios.github.io/istio-charts/
```

Then, follow the [Istio Helm installation instructions][istio-install], using the charts in this repository for instead of the `manifests/` paths:

```sh
kubectl create namespace istio-system
```

```sh
helm install istio-base istio/base -n istio-system
```

```sh
helm install istiod istio/discovery -n istio-system
```

Once those core components are installed, you can install Istio ingress and egress gateways:

```sh
helm install istio-ingress istio/ingress -n istio-system
```

```sh
helm install istio-egress istio/egress -n istio-system
```

[istio-install]: https://istio.io/latest/docs/setup/install/helm/#installation-steps

## Install Istio Operator

Instead of using Helm to install Istio itself, you can use Helm to install the [Istio Operator][istio-operator], and then create `IstioOperator` resource(s) in your cluster to install Istio.

```sh
kubectl create namespace istio-operator
helm install istio-operator istio/operator \
  --set operatorNamespace=istio-operator \
  --set watchedNamespaces=istio-system
```

[istio-operator]: https://istio.io/latest/docs/setup/install/operator/

## Available versions

The following chart versions are available in this Helm repository:

- [Istio 1.11.0](https://istio.io/latest/news/releases/1.11.x/announcing-1.11/)
- [Istio 1.10.3](https://istio.io/latest/news/releases/1.10.x/announcing-1.10.3/)
- [Istio 1.10.2](https://istio.io/latest/news/releases/1.10.x/announcing-1.10.2/)
- [Istio 1.9.6](https://istio.io/latest/news/releases/1.9.x/announcing-1.9.6/)
