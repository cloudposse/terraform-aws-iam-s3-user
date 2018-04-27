# terraform-aws-iam-s3-user [![Build Status](https://travis-ci.org/cloudposse/terraform-aws-iam-s3-user.svg?branch=master)](https://travis-ci.org/cloudposse/terraform-aws-iam-s3-user)

Terraform module to provision a basic IAM user with permissions to access S3 resources, e.g. to give the user read/write/delete access to the objects in an S3 bucket.

Suitable for CI/CD systems (_e.g._ TravisCI, CircleCI, CodeFresh) or systems which are *external* to AWS that cannot leverage [AWS IAM Instance Profiles](http://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2_instance-profiles.html).


## Usage

This example will create an IAM user and allow read access to all objects in the S3 bucket `examplebucket`


```hcl
module "s3_user" {
  source       = "git::https://github.com/cloudposse/terraform-aws-iam-s3-user.git?ref=master"
  namespace    = "cp"
  stage        = "prod"
  name         = "app"
  s3_actions   = ["s3:GetObject"]
  s3_resources = "arn:aws:s3:::examplebucket/*"
}
```


## Variables

| Name            | Default | Description                                                                                 | Required |
|:----------------|:-------:|:--------------------------------------------------------------------------------------------|:--------:|
| `namespace`     |   ``    | Namespace (e.g. `cp` or `cloudposse`)                                                       |   Yes    |
| `stage`         |   ``    | Stage (e.g. `prod`, `dev`, `staging`)                                                       |   Yes    |
| `name`          |   ``    | Name  (e.g. `app`)                                                                          |   Yes    |
| `s3_resources`  |   ``    | S3 resources to apply the actions specified in the policy                                   |   Yes    |
| `attributes`    |  `[]`   | Additional attributes (e.g. `1`)                                                            |    No    |
| `tags`          |  `{}`   | Additional tags  (e.g. `map("BusinessUnit","XYZ")`                                          |    No    |
| `delimiter`     |   `-`   | Delimiter to be used between `namespace`, `stage`, `name` and `attributes`                  |    No    |
| `force_destroy` | `false` | Destroy even if it has non-Terraform-managed IAM access keys, login profiles or MFA devices |    No    |
| `path`          |   `/`   | Path in which to create the user                                                            |    No    |
| `enabled`       | `true`  | Set to `false` to prevent the module from creating any resources                            |    No    |
| `s3_actions`    | `["s3:GetObject"]`   | Actions to allow in the policy                                                 |    No    |


## Outputs

| Name                | Description                                                                 |
|:--------------------|:----------------------------------------------------------------------------|
| `user_name`         | Normalized IAM user name                                                    |
| `user_arn`          | The ARN assigned by AWS for the user                                        |
| `user_unique_id`    | The user unique ID assigned by AWS                                          |
| `access_key_id`     | The access key ID                                                           |
| `secret_access_key` | The secret access key. This will be written to the state file in plain-text |


## Help

**Got a question?**

File a GitHub [issue](https://github.com/cloudposse/terraform-aws-iam-s3-user/issues), send us an [email](mailto:hello@cloudposse.com) or reach out to us on [Gitter](https://gitter.im/cloudposse/).


## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/cloudposse/terraform-aws-iam-s3-user/issues) to report any bugs or file feature requests.

### Developing

If you are interested in being a contributor and want to get involved in developing `terraform-aws-iam-s3-user`, we would love to hear from you! Shoot us an [email](mailto:hello@cloudposse.com).

In general, PRs are welcome. We follow the typical "fork-and-pull" Git workflow.

 1. **Fork** the repo on GitHub
 2. **Clone** the project to your own machine
 3. **Commit** changes to your own branch
 4. **Push** your work back up to your fork
 5. Submit a **Pull request** so that we can review your changes

**NOTE:** Be sure to merge the latest from "upstream" before making a pull request!


## License

[APACHE 2.0](LICENSE) © 2018 [Cloud Posse, LLC](https://cloudposse.com)

See [LICENSE](LICENSE) for full details.

    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.


## About

`terraform-aws-iam-s3-user` is maintained and funded by [Cloud Posse, LLC][website].

![Cloud Posse](https://cloudposse.com/logo-300x69.png)

Like it? Please let us know at <hello@cloudposse.com>

We love [Open Source Software](https://github.com/cloudposse/)!

See [our other projects][community]
or [hire us][hire] to help build your next cloud platform.

  [website]: https://cloudposse.com/
  [community]: https://github.com/cloudposse/
  [hire]: https://cloudposse.com/contact/


## Contributors

| [![Erik Osterman][erik_img]][erik_web]<br/>[Erik Osterman][erik_web] | [![Andriy Knysh][andriy_img]][andriy_web]<br/>[Andriy Knysh][andriy_web] |
|-------------------------------------------------------|------------------------------------------------------------------|

  [erik_img]: http://s.gravatar.com/avatar/88c480d4f73b813904e00a5695a454cb?s=144
  [erik_web]: https://github.com/osterman/
  [andriy_img]: https://avatars0.githubusercontent.com/u/7356997?v=4&u=ed9ce1c9151d552d985bdf5546772e14ef7ab617&s=144
  [andriy_web]: https://github.com/aknysh/
