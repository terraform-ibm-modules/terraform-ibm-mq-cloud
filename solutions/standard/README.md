# IBM Cloud MQ on Cloud

This architecture creates a deployment instance of IBM Cloud MQ on Cloud and supports provisioning of the following resources:

- A resource group, if one is not passed in.
- An MQ on Cloud deployment instance
- An MQ on Cloud queue manager

![mq-on-cloud](../../reference-architecture/deployable-architecture-mqcloud.svg)

:exclamation: **Important:** This solution is not intended to be called by other modules because it contains a provider configuration and is not compatible with the `for_each`, `count`, and `depends_on` arguments. For more information, see [Providers Within Modules](https://developer.hashicorp.com/terraform/language/modules/develop/providers).
