{...}: {
  programs.pet = {
    enable = true;
    snippets = [
      {
        description = "ping";
        command = "ping 8.8.8.8";
        tag = [
          "network"
          "google"
        ];
        output = "";
      }
    ];
  };
}
