// Tests in this file are run in the PR pipeline and the continuous testing pipeline
package test

import (
	"log"
	"os"
	"testing"

	"github.com/stretchr/testify/assert"
	"github.com/terraform-ibm-modules/ibmcloud-terratest-wrapper/common"
	"github.com/terraform-ibm-modules/ibmcloud-terratest-wrapper/testhelper"
)

// Define a struct with fields that match the structure of the YAML data
const yamlLocation = "../common-dev-assets/common-go-assets/common-permanent-resources.yaml"
const region = "eu-de" // Must use us-east as that is where the MQ capacity instance is

var permanentResources map[string]interface{}

// Use existing resource group
const resourceGroup = "mq-eude-prod"
const advancedExampleDir = "examples/advanced"
const basicExampleDir = "examples/basic"

// TestMain will be run before any parallel tests, used to read data from yaml for use with tests
func TestMain(m *testing.M) {
	var err error
	permanentResources, err = common.LoadMapFromYaml(yamlLocation)
	if err != nil {
		log.Fatal(err)
	}

	os.Exit(m.Run())
}

func setupOptions(t *testing.T, prefix string, dir string) *testhelper.TestOptions {
	options := testhelper.TestOptionsDefaultWithVars(&testhelper.TestOptions{
		Testing:       t,
		TerraformDir:  dir,
		Prefix:        prefix,
		Region:        region,
		ResourceGroup: resourceGroup,
		TerraformVars: map[string]interface{}{
			"existing_mq_capacity_crn": permanentResources["mq_capacity_crn"],
		},
	})
	return options
}

func TestRunBasicExample(t *testing.T) {
	t.Parallel()

	options := setupOptions(t, "mqoc-basic", basicExampleDir)

	output, err := options.RunTestConsistency()
	assert.Nil(t, err, "This should not have errored")
	assert.NotNil(t, output, "Expected some output")
}

func TestRunAdvancedExample(t *testing.T) {
	t.Parallel()
	options := setupOptions(t, "mqoc", advancedExampleDir)

	output, err := options.RunTestConsistency()
	assert.Nil(t, err, "This should not have errored")
	assert.NotNil(t, output, "Expected some output")
}

func TestRunUpgradeExample(t *testing.T) {
	t.Parallel()
	options := setupOptions(t, "mqupg", advancedExampleDir)

	output, err := options.RunTestUpgrade()
	assert.Nil(t, err, "Upgrade test should not have errored")
	assert.NotNil(t, output, "Expected some output")
}
