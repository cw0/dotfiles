local dap_status_ok, dap = pcall(require, 'dap')
if not dap_status_ok then
    return
end

local dap_ui_status_ok, dapui = pcall(require, 'dapui')
if not dap_ui_status_ok then
    return
end

local mason_status, mason = pcall(require, 'mason')
if not mason_status then
    return
end

dap.adapters.node2 = {
    type = 'executable',
    command = 'node',
    args = {
        vim.fn.stdpath("data") .. "/dapinstall/jsnode_dbg/" ..
            '/vscode-node-debug2/out/src/nodeDebug.js'
    }
}

mason.setup()

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
