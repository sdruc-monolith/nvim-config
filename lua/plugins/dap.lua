local M = {}

M[#M + 1] = {
  "jay-babu/mason-nvim-dap.nvim",
  event = "VeryLazy",
  dependencies = {
    "mason-org/mason.nvim",
    "mfussenegger/nvim-dap",
  },
  opts = {
    handlers = {},
  },
}

M[#M + 1] = {
  "mfussenegger/nvim-dap",
  keys = {
    { "<leader>db", "<cmd>DapToggleBreakpoint<CR>", desc = "Add breakpoint at line" },
    { "<leader>dr", "<cmd>DapContinue<CR>", desc = "Start or continue the debugger" },
  },
}

M[#M + 1] = {

  "mfussenegger/nvim-dap-python",
  ft = "python",
  dependencies = {
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
  },
  keys = {
    { "<leader>db", "<cmd>DapToggleBreakpoint<CR>", desc = "Add breakpoint at line" },
    { "<leader>dr", "<cmd>DapContinue<CR>", desc = "Start or continue the debugger" },
  },
  config = function(_, opts)
    local path = os.getenv("CONDA_PYTHON_EXE")
    require("dap-python").setup(path)
  end,
}

M[#M + 1] = {

  "rcarriga/nvim-dap-ui",
  event = "VeryLazy",
  dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
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
  end,
}
return M
