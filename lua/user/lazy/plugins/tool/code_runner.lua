-- code runner
return {
  "CRAG666/code_runner.nvim",
  event = { "BufEnter" },
  filetype = {
    java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
    python = "python3 -u",
    typescript = "deno run",
    rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
  },
  opts = {},
}
