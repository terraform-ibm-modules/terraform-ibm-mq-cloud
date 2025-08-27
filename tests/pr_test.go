// Tests in this file are run in the PR pipeline and the continuous testing pipeline
package test

import (
	"log"
	"math/rand"
	"os"
	"testing"

	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
	"github.com/terraform-ibm-modules/ibmcloud-terratest-wrapper/cloudinfo"
	"github.com/terraform-ibm-modules/ibmcloud-terratest-wrapper/common"
	"github.com/terraform-ibm-modules/ibmcloud-terratest-wrapper/testaddons"
	"github.com/terraform-ibm-modules/ibmcloud-terratest-wrapper/testhelper"
	"github.com/terraform-ibm-modules/ibmcloud-terratest-wrapper/testschematic"
)

// Define a struct with fields that match the structure of the YAML data
const yamlLocation = "../common-dev-assets/common-go-assets/common-permanent-resources.yaml"

var permanentResources map[string]interface{}

var validRegions = []string{
	"eu-gb",
	"eu-de",
	"us-east",
	"us-south",
}

// Use existing resource group
const resourceGroup = "geretain-test-resources"
const advancedExampleDir = "examples/advanced"
const standardSolutionTerraformDir = "solutions/fully-configurable"

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

	options := setupOptions(t, "mqupg", advancedExampleDir)

	output, err := options.RunTestUpgrade()
	assert.Nil(t, err, "Upgrade test should not have errored")
	assert.NotNil(t, output, "Expected some output")
}

// Run the DA on Schematics in minimal configuration, valid logic for options
// used in catalog pipeline
func TestRunStandardInstanceOnlySolutionSchematics(t *testing.T) {
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
		Prefix:                 "mqi",
		DeleteWorkspaceOnFail:  false,
		WaitJobCompleteMinutes: 60,
		Region:                 "us-east",
	})

	options.TerraformVars = []testschematic.TestSchematicTerraformVar{
		{Name: "ibmcloud_api_key", Value: options.RequiredEnvironmentVars["TF_VAR_ibmcloud_api_key"], DataType: "string", Secure: true},
		{Name: "existing_mq_capacity_crn", Value: permanentResources["mq_capacity_crn"], DataType: "string"},
		{Name: "existing_resource_group_name", Value: resourceGroup, DataType: "string"},
		{Name: "prefix", Value: options.Prefix, DataType: "string"},
		{Name: "region", Value: "us-east", DataType: "string"},
		{Name: "deployment_name", Value: "da-mq-instance", DataType: "string"},
		{Name: "queue_manager_name", Value: "inst", DataType: "string"},
		{Name: "queue_manager_display_name", Value: "instance-display", DataType: "string"},
		{Name: "queue_manager_size", Value: "xsmall", DataType: "string"},
		{Name: "application_name", Value: "daiapp", DataType: "string"},
		{Name: "user_email", Value: "mqida-user@exmaple.com", DataType: "string"},
		{Name: "user_name", Value: "mqida-user", DataType: "string"},
		// forcing provider visibility to public due to this provider bug https://github.ibm.com/GoldenEye/issues/issues/14309
		{Name: "provider_visibility", Value: "public", DataType: "string"},
	}
	err := options.RunSchematicTest()
	assert.Nil(t, err, "This should not have errored")
}

// Run the DA on Schematics in full configuration
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
		DeleteWorkspaceOnFail:  false,
		WaitJobCompleteMinutes: 60,
		Region:                 "us-east",
	})

	options.TerraformVars = []testschematic.TestSchematicTerraformVar{
		{Name: "ibmcloud_api_key", Value: options.RequiredEnvironmentVars["TF_VAR_ibmcloud_api_key"], DataType: "string", Secure: true},
		{Name: "existing_mq_capacity_crn", Value: permanentResources["mq_capacity_crn"], DataType: "string"},
		{Name: "existing_resource_group_name", Value: resourceGroup, DataType: "string"},
		{Name: "prefix", Value: options.Prefix, DataType: "string"},
		{Name: "region", Value: "us-east", DataType: "string"},
		{Name: "deployment_name", Value: "da-mq-instance", DataType: "string"},
		{Name: "queue_manager_name", Value: "da_qm", DataType: "string"},
		{Name: "queue_manager_display_name", Value: "da-qm-display", DataType: "string"},
		{Name: "queue_manager_size", Value: "xsmall", DataType: "string"},
		{Name: "application_name", Value: "dapp", DataType: "string"},
		{Name: "user_email", Value: "mqda-user@exmaple.com", DataType: "string"},
		{Name: "user_name", Value: "mqda-user", DataType: "string"},
		// forcing provider visibility to public due to this provider bug https://github.ibm.com/GoldenEye/issues/issues/14309
		{Name: "provider_visibility", Value: "public", DataType: "string"},
	}
	err := options.RunSchematicTest()
	assert.Nil(t, err, "This should not have errored")
}

func TestRunStandardSolutionUpgradeSchematics(t *testing.T) {
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
		Prefix:                 "mqupg-da",
		DeleteWorkspaceOnFail:  false,
		WaitJobCompleteMinutes: 60,
		Region:                 "us-south",
	})

	options.TerraformVars = []testschematic.TestSchematicTerraformVar{
		{Name: "ibmcloud_api_key", Value: options.RequiredEnvironmentVars["TF_VAR_ibmcloud_api_key"], DataType: "string", Secure: true},
		{Name: "existing_mq_capacity_crn", Value: permanentResources["mq_capacity_crn"], DataType: "string"},
		{Name: "existing_resource_group_name", Value: resourceGroup, DataType: "string"},
		{Name: "prefix", Value: options.Prefix, DataType: "string"},
		{Name: "region", Value: "us-east", DataType: "string"},
		{Name: "deployment_name", Value: "daupg-mq-instance", DataType: "string"},
		{Name: "queue_manager_name", Value: "daupg_qm", DataType: "string"},
		{Name: "queue_manager_display_name", Value: "daupg-qm-display", DataType: "string"},
		{Name: "queue_manager_size", Value: "xsmall", DataType: "string"},
		{Name: "application_name", Value: "daupgapp", DataType: "string"},
		{Name: "user_email", Value: "mqda-user@exmaple.com", DataType: "string"},
		{Name: "user_name", Value: "mqda-user", DataType: "string"},
		// forcing provider visibility to public due to this provider bug https://github.ibm.com/GoldenEye/issues/issues/14309
		{Name: "provider_visibility", Value: "public", DataType: "string"},
	}

	err := options.RunSchematicUpgradeTest()
	if !options.UpgradeTestSkipped {
		assert.NoError(t, err, "Schematic Upgrade Test had an unexpected error")
	}
}

func TestMqCloudDefaultConfiguration(t *testing.T) {
	t.Parallel()

	options := testaddons.TestAddonsOptionsDefault(&testaddons.TestAddonOptions{
		Testing:       t,
		Prefix:        "mq-def",
		ResourceGroup: resourceGroup,
		QuietMode:     true, // Suppress logs except on failure
	})

	options.AddonConfig = cloudinfo.NewAddonConfigTerraform(
		options.Prefix,
		"deploy-arch-ibm-mq-cloud",
		"fully-configurable",
		map[string]interface{}{
			"prefix":                       options.Prefix,
			"region":                       validRegions[rand.Intn(len(validRegions))],
			"enable_platform_metrics":      false,
			"logs_routing_tenant_regions":  []string{},
			"existing_mq_capacity_crn":     permanentResources["mq_capacity_crn"],
			"secrets_manager_region":       "us-south",
			"secrets_manager_service_plan": "standard",
		},
	)

	err := options.RunAddonTest()
	require.NoError(t, err)
}

// TestDependencyPermutations runs dependency permutations for the Event Notifications and all its dependencies
func TestMqCloudDependencyPermutations(t *testing.T) {
	t.Skip("Skipping dependency permutations until the test is fixed")
	options := testaddons.TestAddonsOptionsDefault(&testaddons.TestAddonOptions{
		Testing: t,
		Prefix:  "mq-perm",
		AddonConfig: cloudinfo.AddonConfig{
			OfferingName:   "deploy-arch-ibm-mq-cloud",
			OfferingFlavor: "fully-configurable",
			Inputs: map[string]interface{}{
				"prefix":                       "mq-perm",
				"region":                       validRegions[rand.Intn(len(validRegions))],
				"existing_resource_group_name": resourceGroup,
			},
		},
	})

	err := options.RunAddonPermutationTest()
	assert.NoError(t, err, "Dependency permutation test should not fail")
}
