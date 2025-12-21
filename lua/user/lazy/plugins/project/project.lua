-- project.nvimはgitのプロジェクト配下のどこで開いてもgit rootに自動でcdしてくれるプラグイン
return {
  "ahmedkhalf/project.nvim",
  event = { "BufRead", "BufNewFile" },
}
