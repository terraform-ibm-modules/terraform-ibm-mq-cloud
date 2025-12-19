// Tests in this file are run in the PR pipeline and the continuous testing pipeline
package test

import (
	"log"
	"os"
	"testing"

	"github.com/IBM/go-sdk-core/core"
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
const terraformVersion = "terraform_v1.10" // This should match the version in the ibm_catalog.json

var permanentResources map[string]interface{}

// Use existing resource group
const resourceGroup = "geretain-test-resources"
const advancedExampleDir = "examples/advanced"
const fullyConfigurableTerraformDir = "solutions/fully-configurable"

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
			fullyConfigurableTerraformDir + "/*.tf",
		},
		TemplateFolder:         fullyConfigurableTerraformDir,
		Tags:                   []string{"test-schematic"},
		Prefix:                 "mqi",
		DeleteWorkspaceOnFail:  false,
		WaitJobCompleteMinutes: 60,
		Region:                 "us-east",
		TerraformVersion:       terraformVersion,
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
func TestRunFullyConfigurableSchematics(t *testing.T) {
	// t.Parallel()

	options := testschematic.TestSchematicOptionsDefault(&testschematic.TestSchematicOptions{
		Testing: t,
		TarIncludePatterns: []string{
			"*.tf",
			"modules/*/*.tf",
			"modules/*/*.sh",
			fullyConfigurableTerraformDir + "/*.tf",
		},
		TemplateFolder:         fullyConfigurableTerraformDir,
		Tags:                   []string{"test-schematic"},
		Prefix:                 "mqoc-da",
		DeleteWorkspaceOnFail:  false,
		WaitJobCompleteMinutes: 60,
		Region:                 "us-east",
		TerraformVersion:       terraformVersion,
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

func TestRunFullyConfigurableUpgradeSchematics(t *testing.T) {
	// t.Parallel()

	options := testschematic.TestSchematicOptionsDefault(&testschematic.TestSchematicOptions{
		Testing: t,
		TarIncludePatterns: []string{
			"*.tf",
			"modules/*/*.tf",
			"modules/*/*.sh",
			fullyConfigurableTerraformDir + "/*.tf",
		},
		TemplateFolder:             fullyConfigurableTerraformDir,
		Tags:                       []string{"test-schematic"},
		Prefix:                     "mqupg-da",
		DeleteWorkspaceOnFail:      false,
		WaitJobCompleteMinutes:     60,
		Region:                     "us-south",
		CheckApplyResultForUpgrade: true,
		TerraformVersion:           terraformVersion,
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
			"region":                       "us-east",
			"enable_platform_metrics":      false,
			"secrets_manager_region":       permanentResources["privateOnlySecMgrRegion"],
			"secrets_manager_service_plan": "__NULL__",
			"logs_routing_tenant_regions":  []string{},
			"existing_mq_capacity_crn":     permanentResources["mq_capacity_crn"],
			"queue_manager_name":           "da_qm",
		},
	)

	// Disable target / route creation to prevent hitting quota in account
	options.AddonConfig.Dependencies = []cloudinfo.AddonConfig{
		{
			OfferingName:   "deploy-arch-ibm-cloud-monitoring",
			OfferingFlavor: "fully-configurable",
			Inputs: map[string]interface{}{
				"enable_metrics_routing_to_cloud_monitoring": false,
			},
			Enabled: core.BoolPtr(true),
		},
		{
			OfferingName:   "deploy-arch-ibm-activity-tracker",
			OfferingFlavor: "fully-configurable",
			Inputs: map[string]interface{}{
				"enable_activity_tracker_event_routing_to_cloud_logs": false,
			},
			Enabled: core.BoolPtr(true),
		},
		{
			OfferingName:   "deploy-arch-ibm-secrets-manager",
			OfferingFlavor: "fully-configurable",
			Inputs: map[string]interface{}{
				"existing_secrets_manager_crn":         permanentResources["privateOnlySecMgrCRN"],
				"service_plan":                         "__NULL__", // no plan value needed when using existing SM
				"skip_secrets_manager_iam_auth_policy": true,       // since using an existing Secrets Manager instance, attempting to re-create auth policy can cause conflicts if the policy already exists
				"secret_groups":                        []string{}, // passing empty array for secret groups as default value is creating general group and it will cause conflicts as we are using an existing SM
			},
			Enabled: core.BoolPtr(true),
		},
	}

	err := options.RunAddonTest()
	require.NoError(t, err)
}
