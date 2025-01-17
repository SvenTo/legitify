package runner_group

# METADATA
# scope: rule
# title: Runner group is not limited to private repositories
# description: |
#       Workflows from public repositories are allowed to run on GitHub Hosted Runners.
#       When using GitHub Hosted Runners, it is recommended to allow only workflows from private repositories to run on these runners to avoid being vulnerable
#       to malicious actors using workflows from public repositories to break into your private network.
#       In case of inadequate security measures implemented on the hosted runner,
#       malicious actors could fork your repository and then create a pwn-request (a pull-request from a forked repository to the base repository with malicious intentions)
#       that create a workflow that exploits these vulnerabilities and move laterally inside your network.
# custom:
#   severity: HIGH
#   requiredEnrichers: [organizationId]
#   requiredScopes: [admin:org]
#   remediationSteps:
#     - "Go to the organization settings page"
#     - "Press Actions ➝ Runner groups"
#     - "Select the violating repository"
#     - "Uncheck Allow public repositories"
#   threat:
#     - "Hosted runners are usually part of the organization's private network and can be easily misconfigured."
#     - "If the hosted runner is insecurely configured, any GitHub user could:"
#     - "1. Create a workflow that runs on the public hosted runner"
#     - "2. Exploit the misconfigurations to execute code inside the private network"
default runner_group_can_be_used_by_public_repositories = false
runner_group_can_be_used_by_public_repositories {
    input.runner_group.allows_public_repositories == true
}