return {
	"nvim-java/nvim-java",
	enabled = false,
	lazy = true,
	ft = { "java", "gradle", "maven" },
	opts = {
		root_markers = {
			"settings.gradle",
			"settings.gradle.kts",
			"pom.xml",
			"build.gradle",
			"mvnw",
			"mvn",
			"mavenw",
			"gradlew",
			"build.gradle",
			"build.gradle.kts",
			".git",
		},

		java_test = {
			enable = true,
		},

		java_debug_adapter = {
			enable = true,
		},

		spring_boot_tools = {
			enable = true,
		},

		jdk = {
			auto_install = true,
		},

		notifications = {
			dap = true,
		},

		verification = {
			invalid_order = true,

			duplicate_setup_calls = true,

			invalid_mason_registry = true,
		},
	},
	config = function()
		require("lspconfig").jdtls.setup({
			settings = {
				java = {
					configuration = {
						runtimes = {
							name = "JavaSE-21",
							path = "/usr/lib/jvm/java-21-openjdk-amd64",
							default = true,
						},
					},
				},
			},
		})
	end,
}
