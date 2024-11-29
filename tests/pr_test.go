// Tests in this file are run in the PR pipeline and the continuous testing pipeline
package test

import (
	"log"
	"os"
	"testing"

	"github.com/stretchr/testify/assert"
	"github.com/terraform-ibm-modules/ibmcloud-terratest-wrapper/common"
	"github.com/terraform-ibm-modules/ibmcloud-terratest-wrapper/testhelper"
	"github.com/terraform-ibm-modules/ibmcloud-terratest-wrapper/testschematic"
)

// Define a struct with fields that match the structure of the YAML data
const yamlLocation = "../common-dev-assets/common-go-assets/common-permanent-resources.yaml"

var permanentResources map[string]interface{}

// Use existing resource group
const resourceGroup = "geretain-test-resources"
const advancedExampleDir = "examples/advanced"
const standardSolutionTerraformDir = "solutions/standard"

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
		Region:        "us-east",
		ResourceGroup: resourceGroup,
		TerraformVars: map[string]interface{}{
			"existing_mq_capacity_crn": permanentResources["mq_capacity_crn"],
		},
	})
	return options
}

func TestRunAdvancedExample(t *testing.T) {
	// t.Parallel()

	options := setupOptions(t, "mqoc", advancedExampleDir)

	output, err := options.RunTestConsistency()
	assert.Nil(t, err, "This should not have errored")
	assert.NotNil(t, output, "Expected some output")
}

func TestRunUpgradeExample(t *testing.T) {
	// t.Parallel()

	options := testhelper.TestOptionsDefaultWithVars(&testhelper.TestOptions{
		Testing:      t,
		TerraformDir: standardSolutionTerraformDir,
		Prefix:       "mq",
		Region:       "us-east",
	})

	terraformVars := map[string]interface{}{
		"existing_mq_capacity_crn":   permanentResources["mq_capacity_crn"],
		"deployment_name":            "da-upg-instance",
		"queue_manager_name":         "da_upg",
		"queue_manager_display_name": "da-upg-display",
		"queue_manager_size":         "xsmall",
		"resource_group_name":        options.Prefix,
		"application_name":           "app",
		"user_email":                 "mq-user@exmaple.com",
		"user_name":                  "mq-user",
	}

	options.TerraformVars = terraformVars

	// TODO: Once this test is on main, make this RunTestUpgrade
	output, err := options.RunTestConsistency()
	if !options.UpgradeTestSkipped {
		assert.Nil(t, err, "This should not have errored")
		assert.NotNil(t, output, "Expected some output")
	}
}

// Run the DA in minimal configuration, valid logic for options
// used in catalog pipeline
func TestRunInstanceOnlyExample(t *testing.T) {
	// t.Parallel()

	options := testhelper.TestOptionsDefaultWithVars(&testhelper.TestOptions{
		Testing:      t,
		TerraformDir: standardSolutionTerraformDir,
		Prefix:       "mqi",
		Region:       "us-east",
	})

	terraformVars := map[string]interface{}{
		"existing_mq_capacity_crn":   permanentResources["mq_capacity_crn"],
		"deployment_name":            "instance-only",
		"queue_manager_name":         "inst",
		"queue_manager_display_name": "instance-display",
		"queue_manager_size":         "xsmall",
		"resource_group_name":        options.Prefix,
	}

	options.TerraformVars = terraformVars

	output, err := options.RunTestConsistency()
	if !options.UpgradeTestSkipped {
		assert.Nil(t, err, "This should not have errored")
		assert.NotNil(t, output, "Expected some output")
	}
}

func TestRunStandardSolutionSchematics(t *testing.T) {
	// t.Parallel()

	options := testschematic.TestSchematicOptionsDefault(&testschematic.TestSchematicOptions{
		Testing: t,
		TarIncludePatterns: []string{
			"*.tf",
			"modules/*/*.tf",
			"modules/*/*.sh",
			standardSolutionTerraformDir + "/*.tf",
		},
		TemplateFolder:         standardSolutionTerraformDir,
		Tags:                   []string{"test-schematic"},
		Prefix:                 "mqoc-da",
		ResourceGroup:          resourceGroup,
		DeleteWorkspaceOnFail:  false,
		WaitJobCompleteMinutes: 60,
		Region:                 "us-south",
	})

	options.TerraformVars = []testschematic.TestSchematicTerraformVar{
		{Name: "ibmcloud_api_key", Value: options.RequiredEnvironmentVars["TF_VAR_ibmcloud_api_key"], DataType: "string", Secure: true},
		{Name: "existing_mq_capacity_crn", Value: permanentResources["mq_capacity_crn"], DataType: "string"},
		{Name: "resource_group_name", Value: options.Prefix, DataType: "string"},
		{Name: "region", Value: "us-east", DataType: "string"},
		{Name: "deployment_name", Value: "da-mq-instance", DataType: "string"},
		{Name: "queue_manager_name", Value: "da_qm", DataType: "string"},
		{Name: "queue_manager_display_name", Value: "da-qm-display", DataType: "string"},
		{Name: "queue_manager_size", Value: "xsmall", DataType: "string"},
		{Name: "application_name", Value: "dapp", DataType: "string"},
		{Name: "user_email", Value: "mqda-user@exmaple.com", DataType: "string"},
		{Name: "user_name", Value: "mqda-user", DataType: "string"},
	}
	err := options.RunSchematicTest()
	assert.Nil(t, err, "This should not have errored")
}
