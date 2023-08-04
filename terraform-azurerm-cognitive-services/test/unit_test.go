package test


import (
    "testing"
    "github.com/gruntwork-io/terratest/modules/terraform"
)


func TestCogServ(t *testing.T) {
    t.Parallel()
    terraformOptionsApply := &terraform.Options{
        TerraformDir: "./terraform/",
    }
    terraformOptionsInit := &terraform.Options{
        TerraformDir: "./terraform/",
        Vars:   map[string]interface{}{
            "upgrade": true,
        },
    }
    // At the end of the test, run `terraform destroy` to clean up any resources that were created
    defer terraform.Destroy(t, terraformOptionsApply)
    // Run `terraform init` and `terraform apply`. Fail the test if there are any errors.
    terraform.Init(t, terraformOptionsInit)
    terraform.Apply(t, terraformOptionsApply)
    // Run `terraform output` to get the values of output variables
    terraform.OutputRequired(t, terraformOptionsApply, "cs_primary_key")
	terraform.OutputRequired(t, terraformOptionsApply, "cs_secondary_key")
    terraform.OutputRequired(t, terraformOptionsApply, "cs_endpoints")
}