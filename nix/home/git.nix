{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    userName = "Samuel Durante";
    userEmail = "samueldurante.h@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
    };

    difftastic.enable = true;

    aliases = {
      l = "log --oneline";
      coma = "checkout main";
      cob = "checkout -b";
      poma = "pull origin main";
      pu = "push origin HEAD";
      puf = "push origin HEAD --force";
      co = "checkout";
      lg = "log --all --graph --decorate --oneline --abbrev-commit";
      cm = "commit";
      ac = "!git add -A && git commit";
      st = "status";
      tags = "tag -l";
      bd = "branch -D";
      branches = "branch -a";
      remotes = "remote -v";
    };
  };
}
