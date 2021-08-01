package appshield.aws.AWS061


__rego_metadata__ := {
	"id": "AWS061",
	"title": "API Gateway stages for V1 and V2 should have access logging enabled",
	"version": "v1.0.0",
	"severity": "LOW",
	"description": "API Gateway stages should have access log settings block configured to track all access to a particular stage. This should be applied to both v1 and v2 gateway stages.",
	"possible_Impact": "Logging provides vital information about access and usage."
	"recommended_actions": "Enable logging for API Gateway stages",
	"url": "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_stage#access_log_settings",
    "iac": true,
    "cspm": true,
}