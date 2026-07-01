local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

local vertxBranchProtectionRule(branchName) = orgs.newBranchProtectionRule(branchName) {
  required_approving_review_count: null,
  requires_pull_request: false,
  requires_status_checks: false,
  requires_strict_status_checks: true,
};

local newVertxRepo(repoName, default_branch = 'main') = orgs.newRepo(repoName) {
  allow_merge_commit: true,
  allow_update_branch: true,
  default_branch: default_branch,
  delete_branch_on_merge: false,
  homepage: "https://vertx.io",
  web_commit_signoff_required: false,
  branch_protection_rules: [
    vertxBranchProtectionRule($.default_branch) {},
  ],
};

orgs.newOrg('rt.vertx', 'eclipse-vertx') {
  settings+: {
    description: "",
    email: "emo@eclipse.org",
    name: "Eclipse Vert.x",
    packages_containers_internal: false,
    packages_containers_public: false,
    web_commit_signoff_required: false,
    workflows+: {
      default_workflow_permissions: "write",
    },
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
  variables: [
    orgs.newRepoVariable('VERTX_5_STABLE_BRANCH') {
      value: "5.0",
      visibility: "public",
    },
  ],
  _repositories+:: [
    orgs.newRepo('.github') {
      allow_merge_commit: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Vertx community health files",
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: null,
          requires_pull_request: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('vert.x') {
      allow_merge_commit: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Vert.x is a tool-kit for building reactive applications on the JVM",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_projects: false,
      homepage: "https://vertx.io",
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
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        vertxBranchProtectionRule('master'),
        vertxBranchProtectionRule('[345].[x0123456789]'),
      ],
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
    },
    orgs.newRepo('vertx-auth') {
      allow_merge_commit: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Authentication and authorization providers for Eclipse Vert.x",
      homepage: "https://vertx.io/docs/vertx-auth-common/java/",
      has_projects: false,
      has_wiki: false,
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
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        vertxBranchProtectionRule('master'),
        vertxBranchProtectionRule('[345].[x0123456789]'),
      ],
    },
    orgs.newRepo('vertx-codegen') {
      allow_merge_commit: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Vert.x code generator for asynchronous polyglot APIs",
      has_projects: false,
      has_wiki: false,
      homepage: "https://vertx.io",
      topics+: [
        "codegen",
        "reactive",
        "vertx"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        vertxBranchProtectionRule('master'),
        vertxBranchProtectionRule('[345].[x0123456789]'),
      ],
    },
    orgs.newRepo('vertx-grpc') {
      allow_merge_commit: true,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "gRPC component for Eclipse Vert.x",
      homepage: "https://vertx.io/docs/vertx-grpc/java/",
      topics+: [
        "grpc",
        "http2",
        "java",
        "netty",
        "protobuf",
        "reactive",
        "rpc",
        "vertx"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        vertxBranchProtectionRule('main'),
        vertxBranchProtectionRule('[345].[x0123456789]'),
      ],
    },
    orgs.newRepo('vertx-health-check') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Health checks for Eclipse Vert.x",
      homepage: "https://vertx.io/docs/vertx-health-check/java/",
      topics+: [
        "health-check",
        "healthcheck",
        "monitoring",
        "reactive",
        "vertx"
      ],
      has_projects: false,
      has_wiki: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        vertxBranchProtectionRule('master'),
        vertxBranchProtectionRule('[345].[x0123456789]'),
      ],
    },
    orgs.newRepo('vertx-http-proxy') {
      allow_merge_commit: true,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "Reactive HTTP proxy for Eclipse Vert.x",
      homepage: "https://vertx.io/docs/vertx-http-proxy/java/",
      topics+: [
        "http",
        "http-proxy",
        "proxy",
        "reactive",
        "vertx"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        vertxBranchProtectionRule('main'),
        vertxBranchProtectionRule('[345].[x0123456789]'),
      ],
    },
    orgs.newRepo('vertx-json-schema') {
      allow_merge_commit: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "JSON Schema validation for Eclipse Vert.x",
      homepage: "https://vertx.io/docs/vertx-json-schema/java/",
      topics+: [
        "json",
        "schema",
        "validator",
        "vertx"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        vertxBranchProtectionRule('master'),
        vertxBranchProtectionRule('[345].[x0123456789]'),
      ],
    },
    orgs.newRepo('vertx-junit5') {
      allow_merge_commit: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Testing Vert.x applications with JUnit 5",
      homepage: "https://vertx.io/docs/vertx-junit5/java/",
      topics+: [
        "junit5",
        "reactive",
        "testing",
        "vertx"
      ],
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        vertxBranchProtectionRule('master'),
        vertxBranchProtectionRule('[345].[x0123456789]'),
      ],
    },
    orgs.newRepo('vertx-launcher') {
      allow_merge_commit: true,
      delete_branch_on_merge: false,
      description: "Application launcher for Eclipse Vert.x",
      homepage: "https://vertx.io/docs/vertx-launcher-application/java/",
      topics+: [
        "java",
        "launcher",
        "reactive",
        "vertx"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        vertxBranchProtectionRule('main'),
        vertxBranchProtectionRule('[345].[x0123456789]'),
      ],
    },
    orgs.newRepo('vertx-openapi') {
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "OpenAPI 3 contract parsing and validation for Eclipse Vert.x",
      homepage: "https://vertx.io/docs/vertx-openapi/java/",
      topics+: [
        "contract",
        "openapi",
        "openapi3",
        "reactive",
        "validation",
        "vertx"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        vertxBranchProtectionRule('main'),
        vertxBranchProtectionRule('[345].[x0123456789]'),
      ],
    },
    orgs.newRepo('vertx-rabbitmq-client') {
      allow_merge_commit: true,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "Reactive RabbitMQ client for Eclipse Vert.x",
      homepage: "https://vertx.io/docs/vertx-rabbitmq-client/java/",
      topics+: [
        "amqp",
        "messaging",
        "rabbitmq",
        "reactive",
        "vertx"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        vertxBranchProtectionRule('main'),
        vertxBranchProtectionRule('[345].[x0123456789]'),
      ],
    },
    orgs.newRepo('vertx-sql-client') {
      allow_merge_commit: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "High performance reactive SQL client written in Java",
      has_projects: false,
      has_wiki: false,
      homepage: "https://vertx.io/docs/vertx-pg-client/java/",
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
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        vertxBranchProtectionRule('master'),
        vertxBranchProtectionRule('[345].[x0123456789]'),
        vertxBranchProtectionRule('_old/*'),
      ],
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
    },
    orgs.newRepo('vertx-tracing') {
      allow_merge_commit: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Eclipse Vert.x integration with distributed tracing libraries",
      homepage: "https://vertx.io",
      topics+: [
        "non-blocking",
        "opentracing",
        "reactive",
        "tracing",
        "vertx",
        "zipkin"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        vertxBranchProtectionRule('master'),
        vertxBranchProtectionRule('[345].[x0123456789]'),
      ],
    },
    orgs.newRepo('vertx-uri-template') {
      allow_merge_commit: true,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "URI Template (RFC 6570) implementation for Eclipse Vert.x",
      homepage: "https://vertx.io/docs/vertx-uri-template/java/",
      topics+: [
        "uri-template",
        "vertx"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [        
        vertxBranchProtectionRule('main'),
        vertxBranchProtectionRule('[345].[x0123456789]'),
      ],
    },
    newVertxRepo('vertx-service-resolver', 'main') {
      description: "Service resolver for Eclipse Vert.x",
      homepage: "https://vertx.io/docs/vertx-service-resolver/java/",
      topics+: [
        "async-await",
        "asyncawait",
        "concurrency",
        "java",
        "vertx",
        "jvm",
        "microservices",
        "kubernetes",
        "loadbalancing",
        "servicediscovery"
      ],
      branch_protection_rules: [
        vertxBranchProtectionRule('main'),
        vertxBranchProtectionRule('[345].[x0123456789]'),
      ],
    },
    newVertxRepo('vertx-virtual-threads', 'main') {
      description: "Virtual threads support for Eclipse Vert.x",
      homepage: "https://vertx.io",
      topics+: [
        "java",
        "vertx",
        "jvm",
        "virtualthreads",
        "virtual-threads",
        "asyncawait",
        "async-await",
        "loom",
        "concurrency"
      ],
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules+: [
        vertxBranchProtectionRule('[345].[x0123456789]'),
      ],
    },
    newVertxRepo('vertx5-parent', 'main') {
      description: "Parent POM for Eclipse Vert.x 5",
      homepage: "https://vertx.io",
      topics+: [
        "java",
        "vertx",
        "maven"
      ],
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('vertx-eventbus-bridges') {
      allow_merge_commit: true,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "EventBus bridge implementations for Eclipse Vert.x",
      homepage: "https://vertx.io",
      topics+: [
        "bridge",
        "eventbus",
        "reactive",
        "vertx"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        vertxBranchProtectionRule('main'),
        vertxBranchProtectionRule('[345].[x0123456789]'),
      ],
    },
  ],
}
