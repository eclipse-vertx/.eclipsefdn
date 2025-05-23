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
  homepage: "http://vertx.io",
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
      homepage: "http://vertx.io",
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
        vertxBranchProtectionRule('3.*'),
        vertxBranchProtectionRule('4.*'),
        vertxBranchProtectionRule('5.*'),
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
        vertxBranchProtectionRule('3.*'),
        vertxBranchProtectionRule('4.*'),
        vertxBranchProtectionRule('5.*'),
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
      homepage: "",
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
        vertxBranchProtectionRule('3.*'),
        vertxBranchProtectionRule('4.*'),
        vertxBranchProtectionRule('5.*'),
      ],
    },
    orgs.newRepo('vertx-grpc') {
      allow_merge_commit: true,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "Development of the gRPC component for Eclipse Vert.x",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        vertxBranchProtectionRule('main'),
        vertxBranchProtectionRule('4.*'),
        vertxBranchProtectionRule('5.*'),
      ],
    },
    orgs.newRepo('vertx-http-proxy') {
      allow_merge_commit: true,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "vertx http proxy",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        vertxBranchProtectionRule('main'),
        vertxBranchProtectionRule('4.*'),
        vertxBranchProtectionRule('5.*'),
      ],
    },
    orgs.newRepo('vertx-json-schema') {
      allow_merge_commit: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Vert.x Json Schema",
      homepage: "",
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
        vertxBranchProtectionRule('4.*'),
        vertxBranchProtectionRule('5.*'),
      ],
    },
    orgs.newRepo('vertx-junit5') {
      allow_merge_commit: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Testing Vert.x applications with JUnit 5",
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        vertxBranchProtectionRule('master'),
        vertxBranchProtectionRule('4.*'),
        vertxBranchProtectionRule('5.*'),
      ],
    },
    orgs.newRepo('vertx-launcher') {
      allow_merge_commit: true,
      delete_branch_on_merge: false,
      description: "Vert.x Launcher",
      homepage: "",
      topics+: [
        "launcher",
        "vertx"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        vertxBranchProtectionRule('main'),
        vertxBranchProtectionRule('5.*'),
      ],
    },
    orgs.newRepo('vertx-openapi') {
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "OpenAPI  repository",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        vertxBranchProtectionRule('main'),
        vertxBranchProtectionRule('4.*'),
        vertxBranchProtectionRule('5.*'),
      ],
    },
    orgs.newRepo('vertx-rabbitmq-client') {
      allow_merge_commit: true,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        vertxBranchProtectionRule('main'),
        vertxBranchProtectionRule('5.*'),
      ],
    },
    orgs.newRepo('vertx-sql-client') {
      allow_merge_commit: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "High performance reactive SQL Client written in Java",
      has_projects: false,
      has_wiki: false,
      homepage: "",
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
        vertxBranchProtectionRule('3.*'),
        vertxBranchProtectionRule('4.*'),
        vertxBranchProtectionRule('5.*'),
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
      description: "Vertx integration with tracing libraries",
      homepage: "",
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
        vertxBranchProtectionRule('4.*'),
        vertxBranchProtectionRule('5.*'),
      ],
    },
    orgs.newRepo('vertx-uri-template') {
      allow_merge_commit: true,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "URI Template rfc6570 implementatin for Vert.x",
      homepage: "",
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
        vertxBranchProtectionRule('4.*'),
        vertxBranchProtectionRule('5.*'),
      ],
    },
    newVertxRepo('vertx-service-resolver', 'main') {
      description: "Vert.x Service Resolver",
      homepage: "",
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
    },
    newVertxRepo('vertx-virtual-threads', 'main') {
      description: "Vert.x Virtual Threads",
      homepage: "",
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
        vertxBranchProtectionRule('4.*'),
      ],
    },
    newVertxRepo('vertx5-parent', 'main') {
      description: "Vert.x 5 Parent pom",
      homepage: "",
      topics+: [
        "java",
        "vertx",
        "maven"
      ],
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
  ],
}
