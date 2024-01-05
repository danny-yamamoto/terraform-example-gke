# terraform-example-gke
One of the Terraform examples.

## Infracost
> Infracost enables a shift-left approach for cloud costs by providing cost estimates for Terraform before deployment. Additionally, it can check for FinOps best practices in accordance with the Well-Architected Frameworks of cloud vendors, and your company's required tag keys/values. This not only saves your team money but also streamlines discussions about costs within the engineering workflow rather than it being a post-deployment consideration.

- Get started[^1]

### Install Infracost
```bash
vscode ➜ /workspaces/terraform-example-gke (main) $ curl -fsSL https://raw.githubusercontent.com/infracost/infracost/master/scripts/install.sh | sh
Downloading version latest of infracost-linux-arm64...

Validating checksum for infracost-linux-arm64...

Moving /tmp/infracost-linux-arm64 to /usr/local/bin/infracost (you might be asked for your password due to sudo)

Completed installing Infracost v0.10.31
vscode ➜ /workspaces/terraform-example-gke (main) $ infracost --version
Infracost v0.10.31
```

### Get API key
```bash
vscode ➜ /workspaces/terraform-example-gke (main) $ infracost auth login
We're redirecting you to our log in page, please complete that,
and return here to continue using Infracost.

If the redirect doesn't work, either:
- Use this URL:
    https://dashboard.infracost.io/login?cli_port=aaaaa&cli_state=a-b-c-d-e&cli_version=v0.10.31&os=linux&utm_source=cli

- Or log in/sign up at https://dashboard.infracost.io, copy your API key
    from Org Settings and run `infracost configure set api_key MY_KEY`

Waiting...

The API key was saved to /home/vscode/.config/infracost/credentials.yml

Your account has been authenticated. Run Infracost on your Terraform project by running:

  infracost breakdown --path=.
```

### Show cost estimate breakdown
```bash
vscode ➜ /workspaces/terraform-example-gke (main) $ cd env/dev/
vscode ➜ /workspaces/terraform-example-gke/env/dev (main) $ infracost breakdown --path .
2024-01-05T10:18:59Z INF Enabled policies V2
2024-01-05T10:18:59Z INF Enabled tag policies
Evaluating Terraform directory at .
Detected Terraform project at firewall
Detected Terraform project at gke
Detected Terraform project at network
Detected Terraform project at instance_templates
2024-01-05T10:18:59Z INF Starting: Downloading Terraform modules
2024-01-05T10:18:59Z INF Starting: Downloading Terraform modules
2024-01-05T10:18:59Z INF Starting: Downloading Terraform modules
2024-01-05T10:18:59Z INF Starting: Downloading Terraform modules
2024-01-05T10:18:59Z INF Starting: Evaluating Terraform directory
2024-01-05T10:18:59Z INF Starting: Evaluating Terraform directory
2024-01-05T10:18:59Z INF Starting: Evaluating Terraform directory
2024-01-05T10:18:59Z INF Starting: Evaluating Terraform directory
2024-01-05T10:18:59Z WRN Input values were not provided for following Terraform variables: "variable.GOOGLE_CREDENTIALS", "variable.PROJECT_ID". Use --terraform-var-file or --terraform-var to specify them.
2024-01-05T10:19:00Z WRN Input values were not provided for following Terraform variables: "variable.GOOGLE_CREDENTIALS", "variable.PROJECT_ID". Use --terraform-var-file or --terraform-var to specify them.
2024-01-05T10:19:00Z WRN Input values were not provided for following Terraform variables: "variable.GOOGLE_CREDENTIALS", "variable.PROJECT_ID". Use --terraform-var-file or --terraform-var to specify them.
2024-01-05T10:19:01Z WRN Input values were not provided for following Terraform variables: "variable.GOOGLE_CREDENTIALS", "variable.PROJECT_ID". Use --terraform-var-file or --terraform-var to specify them.
2024-01-05T10:19:01Z INF Starting: Retrieving cloud prices to calculate costs

Project: danny-yamamoto/terraform-example-gke/env/dev/firewall
Module path: firewall

 Name           Monthly Qty  Unit  Monthly Cost 
                                                
 Project total                            $0.00 

──────────────────────────────────
Project: danny-yamamoto/terraform-example-gke/env/dev/gke
Module path: gke

 Name                                                      Monthly Qty  Unit   Monthly Cost 
                                                                                            
 module.gke.google_container_cluster.k8s                                                    
 ├─ Cluster management fee                                         730  hours        $73.00 
 └─ default_pool                                                                            
    ├─ Instance usage (Linux/UNIX, on-demand, e2-medium)           730  hours        $31.38 
    └─ Standard provisioned storage (pd-standard)                  100  GB            $5.20 
                                                                                            
 module.gke.google_container_node_pool.pool-hoge                                            
 ├─ Instance usage (Linux/UNIX, on-demand, e2-standard-4)          730  hours       $125.51 
 └─ Standard provisioned storage (pd-standard)                     100  GB            $5.20 
                                                                                            
 module.gke.google_container_node_pool.prod-default-pool                                    
 ├─ Instance usage (Linux/UNIX, on-demand, e2-medium)              730  hours        $31.38 
 └─ Standard provisioned storage (pd-standard)                     100  GB            $5.20 
                                                                                            
 module.gke.google_container_node_pool.prod-pool-hoge                                       
 ├─ Instance usage (Linux/UNIX, on-demand, e2-standard-4)          730  hours       $125.51 
 └─ Standard provisioned storage (pd-standard)                     100  GB            $5.20 
                                                                                            
 Project total                                                                      $407.57 

──────────────────────────────────
Project: danny-yamamoto/terraform-example-gke/env/dev/instance_templates
Module path: instance_templates

 Name                                              Monthly Qty  Unit  Monthly Cost 
                                                                                   
 module.instance_templates.google_compute_disk.pv                                  
 └─ Standard provisioned storage (pd-standard)           1,024  GB          $53.25 
                                                                                   
 Project total                                                              $53.25 

──────────────────────────────────
Project: danny-yamamoto/terraform-example-gke/env/dev/network
Module path: network

 Name           Monthly Qty  Unit  Monthly Cost 
                                                
 Project total                            $0.00 

 OVERALL TOTAL                          $460.82 
──────────────────────────────────
12 cloud resources were detected:
∙ 5 were estimated, 4 of which include usage-based costs, see https://infracost.io/usage-file
∙ 7 were free, rerun with --show-skipped to see details

┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┓
┃ Project                                                         ┃ Monthly cost ┃
┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━┫
┃ danny-yamamoto/terraform-example-gke/env/dev/firewall           ┃ $0.00        ┃
┃ danny-yamamoto/terraform-example-gke/env/dev/gke                ┃ $408         ┃
┃ danny-yamamoto/terraform-example-gke/env/dev/instance_templates ┃ $53          ┃
┃ danny-yamamoto/terraform-example-gke/env/dev/network            ┃ $0.00        ┃
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┛
vscode ➜ /workspaces/terraform-example-gke/env/dev (main) $ 
```

[^1]: https://www.infracost.io/docs/
