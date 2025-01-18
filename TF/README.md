# Using TF (OpenTofu)

The example creates:

* A security group which allows incoming SSH and HTTP traffic (and any outgoing traffic)
* An EC2 instance with Linux
* A DNS entry for it in CloudFlare

Use like this:

```
❯ TF_VAR_cloudflare_api_token=CF_API_TOKEN tofu destroy -auto-approve
```
