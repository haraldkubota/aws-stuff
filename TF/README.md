# Using TF (OpenTofu)

The example creates:

* A security group which allows incoming SSH and HTTP traffic (and any outgoing traffic)
* An EC2 instance with Linux
* A DNS entry for it in CloudFlare

Use like this:

```
❯ source .env
❯ tofu apply -auto-approve
```

with .env containing your API tokens, like:

```
export TF_VAR_cloudflare_dns_id="YOUR_ZONE_ID"
export TF_VAR_cloudflare_api_token="YOUR_API_TOKEN"
```

