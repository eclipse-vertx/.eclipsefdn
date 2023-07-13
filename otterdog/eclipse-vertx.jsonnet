local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-vertx') {
  settings+: {
    billing_email: "emo@eclipse.org",
    default_repository_permission: "none",
    default_workflow_permissions: "write",
    dependabot_alerts_enabled_for_new_repositories: false,
    dependabot_security_updates_enabled_for_new_repositories: false,
    dependency_graph_enabled_for_new_repositories: false,
    description: "",
    email: "emo@eclipse.org",
    members_can_change_repo_visibility: true,
    members_can_delete_repositories: true,
    name: "Eclipse Vert.x",
    packages_containers_internal: false,
    packages_containers_public: false,
    readers_can_create_discussions: true,
    two_factor_requirement: false,
    web_commit_signoff_required: false,
  },
  secrets+: [
    orgs.newOrgSecret('SONATYPE_NEXUS_PASSWORD') {
      value: "********",
    },
    orgs.newOrgSecret('SONATYPE_NEXUS_USERNAME') {
      value: "********",
    },
    orgs.newOrgSecret('VERTX_NEXUS_PASSWORD') {
      value: "********",
    },
    orgs.newOrgSecret('VERTX_NEXUS_USERNAME') {
      value: "********",
    },
  ],
  _repositories+:: [
    orgs.newRepo('.github') {
      allow_update_branch: false,
      default_branch: "master",
      description: "Vertx community health files",
      has_wiki: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: null,
          requires_approving_reviews: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('vert.x') {
      allow_update_branch: false,
      default_branch: "master",
      description: "Vert.x is a tool-kit for building reactive applications on the JVM",
      has_projects: false,
      homepage: "http://vertx.io",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      topics+: [
        "concurrency",
        "event-loop",
        "high-performance",
        "http2",
        "java",
        "jvm",
        "netty",
        "nio",
        "non-blocking",
        "reactive",
        "vertx"
      ],
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: null,
          requires_approving_reviews: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('3.*') {
          required_approving_review_count: null,
          requires_approving_reviews: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('4.*') {
          required_approving_review_count: null,
          requires_approving_reviews: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('vertx-auth') {
      allow_update_branch: false,
      default_branch: "master",
      dependabot_security_updates_enabled: true,
      has_projects: false,
      has_wiki: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      topics+: [
        "async",
        "jwt",
        "oauth",
        "oauth2",
        "reactive",
        "security",
        "vertx"
      ],
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://hooks.waffle.io/api/projects/550fed359a36661e00f6c41e/sources/550fed6bf3a8371e00455e11/receive') {
          content_type: "json",
          events+: [
            "*"
          ],
          secret: "********",
        },
        orgs.newRepoWebhook('https://hooks.waffle.io/api/projects/550fed359a36661e00f6c41e/sources/557449a2fcbe6a5900539791/receive') {
          content_type: "json",
          events+: [
            "*"
          ],
          secret: "********",
        },
        orgs.newRepoWebhook('https://vertx.ci.cloudbees.com/github-webhook/') {
          content_type: "json",
          events+: [
            "pull_request",
            "push"
          ],
        },
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          active: false,
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: null,
          requires_approving_reviews: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('3.*') {
          required_approving_review_count: null,
          requires_approving_reviews: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('4.*') {
          required_approving_review_count: null,
          requires_approving_reviews: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('vertx-codegen') {
      allow_update_branch: false,
      default_branch: "master",
      dependabot_security_updates_enabled: true,
      description: "Vert.x code generator for asynchronous polyglot APIs",
      has_projects: false,
      has_wiki: false,
      homepage: "",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      topics+: [
        "codegen",
        "reactive",
        "vertx"
      ],
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: null,
          requires_approving_reviews: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('3.*') {
          required_approving_review_count: null,
          requires_approving_reviews: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('4.*') {
          required_approving_review_count: null,
          requires_approving_reviews: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('vertx-grpc') {
      allow_update_branch: false,
      dependabot_alerts_enabled: false,
      description: "Development of the gRPC component for Eclipse Vert.x",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: null,
          requires_approving_reviews: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('4.*') {
          required_approving_review_count: null,
          requires_approving_reviews: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('vertx-http-proxy') {
      allow_update_branch: false,
      dependabot_alerts_enabled: false,
      description: "vertx http proxy",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('4.*') {
          required_approving_review_count: null,
          requires_approving_reviews: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: null,
          requires_approving_reviews: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('vertx-json-schema') {
      allow_update_branch: false,
      default_branch: "master",
      dependabot_security_updates_enabled: true,
      description: "Vert.x Json Schema",
      homepage: "",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      topics+: [
        "json",
        "schema",
        "validator",
        "vertx"
      ],
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          active: false,
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: null,
          requires_approving_reviews: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('4.*') {
          required_approving_review_count: null,
          requires_approving_reviews: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('vertx-junit5') {
      allow_update_branch: false,
      default_branch: "master",
      dependabot_security_updates_enabled: true,
      description: "Testing Vert.x applications with JUnit 5",
      has_projects: false,
      has_wiki: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://vertx.ci.cloudbees.com/github-webhook/') {
          events+: [
            "push"
          ],
        },
        orgs.newRepoWebhook('https://ci.appveyor.com/api/github/webhook?id=vl87j5mlpp1f3na6') {
          events+: [
            "push"
          ],
        },
        orgs.newRepoWebhook('https://ci.appveyor.com/api/github/webhook?id=ienn9k13r378t6kr') {
          events+: [
            "pull_request",
            "push"
          ],
        },
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          active: false,
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: null,
          requires_approving_reviews: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('4.*') {
          required_approving_review_count: null,
          requires_approving_reviews: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('vertx-launcher') {
      allow_update_branch: false,
      description: "Vert.x Launcher",
      homepage: "",
      topics+: [
        "launcher",
        "vertx"
      ],
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: null,
          requires_approving_reviews: false,
        },
      ],
    },
    orgs.newRepo('vertx-openapi') {
      allow_merge_commit: false,
      allow_update_branch: false,
      dependabot_alerts_enabled: false,
      description: "OpenAPI  repository",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: null,
          requires_approving_reviews: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('4.*') {
          required_approving_review_count: null,
          requires_approving_reviews: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('vertx-rabbitmq-client') {
      allow_update_branch: false,
      dependabot_alerts_enabled: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: null,
          requires_approving_reviews: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('vertx-sql-client') {
      allow_update_branch: false,
      default_branch: "master",
      dependabot_security_updates_enabled: true,
      description: "High performance reactive SQL Client written in Java",
      has_projects: false,
      has_wiki: false,
      homepage: "",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      topics+: [
        "async",
        "mssql",
        "mysql",
        "netty",
        "non-blocking",
        "performance",
        "pg",
        "postgres",
        "reactive",
        "scalability",
        "vertx"
      ],
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          active: false,
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('3.*') {
          required_approving_review_count: null,
          requires_approving_reviews: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: null,
          requires_approving_reviews: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('_old/*') {
          required_approving_review_count: null,
          requires_approving_reviews: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('4.*') {
          required_approving_review_count: null,
          requires_approving_reviews: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
    },
    orgs.newRepo('vertx-tracing') {
      allow_update_branch: false,
      default_branch: "master",
      dependabot_security_updates_enabled: true,
      description: "Vertx integration with tracing libraries",
      homepage: "",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      topics+: [
        "non-blocking",
        "opentracing",
        "reactive",
        "tracing",
        "vertx",
        "zipkin"
      ],
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: null,
          requires_approving_reviews: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('4.*') {
          required_approving_review_count: null,
          requires_approving_reviews: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('vertx-uri-template') {
      allow_update_branch: false,
      dependabot_alerts_enabled: false,
      description: "URI Template rfc6570 implementatin for Vert.x",
      homepage: "",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      topics+: [
        "uri-template",
        "vertx"
      ],
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: null,
          requires_approving_reviews: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('4.*') {
          required_approving_review_count: null,
          requires_approving_reviews: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
  ],
}
