local jdtls_path = "/home/gcrg/libs/jdtls/"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = "/home/gcrg/.jtdls-workspace/" .. project_name

local config = {
    cmd = {
        "java", -- path to Java
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens", "java.base/java.util=ALL-UNNAMED",
        "--add-opens", "java.base/java.lang=ALL-UNNAMED",

        "-jar", jdtls_path .. "plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar",

        "-configuration", jdtls_path .. "config_linux",

        -- See `data directory configuration` section in the README of "nvim-jdtls"
        "-data", workspace_dir, --must be unique per project
    },
    capabilities = require("blink.cmp").get_lsp_capabilities(),
    settings = {
        java = {
            maven = { downloadSources = true, },
            inlayHints = {
                parameterNames = {
                    -- Choose between: literals, all, none
                    enabled = "all",
                },
            },
            signatureHelp = { enabled = true };
            completion = {
                favoriteStaticMembers = {
                    "org.hamcrest.MatcherAssert.assertThat",
                    "org.hamcrest.Matchers.*",
                    "org.hamcrest.CoreMatchers.*",
                    "org.junit.jupiter.api.Assertions.*",
                    "java.util.Objects.requireNonNull",
                    "java.util.Objects.requireNonNullElse",
                    "org.mockito.Mockito.*"
                },
                filteredTypes = {
                    "com.sun.*",
                    "io.micrometer.shaded.*",
                    "java.awt.*",
                    "jdk.*",
                    "sun.*",
                },
            },
            sources = {
                organizeImports = {
                    starThreshold = 9999,
                    staticStarThreshold = 9999,
                },
            },
            codeGeneration = {
                toString = {
                    template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
                },
                hashCodeEquals = {
                    useJava7Objects = true,
                },
                useBlocks = true,
            };
        },
    },
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
