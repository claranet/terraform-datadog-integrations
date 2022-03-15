# v4.0.0 (March 15, 2022)

## Improvement

* Support Datadog 3.0.0 (#1)

# v3.5.0 (August 27, 2020)

## Bug

*   [[MON-581](https://claranet-morea.atlassian.net/browse/MON-581)] - repair CI now pt-monitoring is dead

## Improvement

*   [[MON-580](https://claranet-morea.atlassian.net/browse/MON-580)] - Terraform 0.13 compatibility for datadog modules

# v3.4.0 (March 30, 2020)

## Improvement

*   [[MON-575](https://claranet-morea.atlassian.net/browse/MON-575)] - update aws integration permissions including steps function

# v3.3.0 (January 23, 2020)

## Improvement

*   [[MON-552](https://claranet-morea.atlassian.net/browse/MON-552)] - MySQL Datadog config as TF module
*   [[MON-559](https://claranet-morea.atlassian.net/browse/MON-559)] - Remove awk hack and use terraform-docs 0.8.0

## New Feature

*   [[MON-548](https://claranet-morea.atlassian.net/browse/MON-548)] - GCP automatic service account creation for datadog integration

# v3.2.0 (December 13, 2019)

## Bug

*   [[MON-538](https://claranet-morea.atlassian.net/browse/MON-538)] - [Datadog] PagerDuty api_token gets replaced every time

## Documentation

*   [[MON-519](https://claranet-morea.atlassian.net/browse/MON-519)] - Opensource integrations and monitors

# v3.1.0 (September 06, 2019)

## Improvement

*   [[MON-486](https://claranet-morea.atlassian.net/browse/MON-486)] - Remove workaround for here doc fmt now it is fixed in terraform 0.12.6
*   [[MON-494](https://claranet-morea.atlassian.net/browse/MON-494)] - Refactor auto update scripts
*   [[MON-504](https://claranet-morea.atlassian.net/browse/MON-504)] - Update terraform and provider versions

## New Feature

*   [[MON-370](https://claranet-morea.atlassian.net/browse/MON-370)] - Terraform feature for GCP integration
*   [[MON-413](https://claranet-morea.atlassian.net/browse/MON-413)] - Terraform feature for pagerduty integration
*   [[MON-485](https://claranet-morea.atlassian.net/browse/MON-485)] - docker image for datadog terraform
*   [[MON-490](https://claranet-morea.atlassian.net/browse/MON-490)] - Changelog generation on git repos

# v3.0.0 (July 05, 2019)

## Epic

*   [[MON-459](https://claranet-morea.atlassian.net/browse/MON-459)] - Upgrade to terraform 0.12 (HCL 2.0)

# v2.9.0 (May 09, 2019)

## New Feature

*   [[MON-182](https://claranet-morea.atlassian.net/browse/MON-182)] - Monitors structure and config examples / stack template

## Epic

*   [[MON-449](https://claranet-morea.atlassian.net/browse/MON-449)] - Datadog global CI

# v2.8.0 (April 23, 2019)

## Improvement

*   [[MON-429](https://claranet-morea.atlassian.net/browse/MON-429)] - Update reference from cloudnative to pt-mon

## New Feature

*   [[MON-371](https://claranet-morea.atlassian.net/browse/MON-371)] - Terraform feature for AWS integration
*   [[MON-433](https://claranet-morea.atlassian.net/browse/MON-433)] - Add aws configuration on datadog for integration feature
*   [[MON-436](https://claranet-morea.atlassian.net/browse/MON-436)] - CI for datadog integrations

# v2.4.0 (October 03, 2018)

## Improvement

*   [[MON-322](https://claranet-morea.atlassian.net/browse/MON-322)] - Update aws integration policy

# v2.3.0 (September 20, 2018)

## Improvement

*   [[MON-205](https://claranet-morea.atlassian.net/browse/MON-205)] - Use aws_iam_policy_document instead of pure EOF for aws datadog integration

# v2.0.0 (March 25, 2018)

## Documentation

*   [[MON-155](https://claranet-morea.atlassian.net/browse/MON-155)] - Update and document aws integration feature
