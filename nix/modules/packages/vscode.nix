{ pkgs, lib }:
let
  vscode-plugins = (import ./vscode_plugins.nix) { pkgs = pkgs; lib = lib; };
  vscode-extensions-repo = with pkgs.vscode-extensions; [
    bbenoist.nix
    ms-python.python
    ms-azuretools.vscode-docker
    ms-dotnettools.csdevkit
    ms-dotnettools.csharp
    ms-dotnettools.vscode-dotnet-runtime
    ms-vscode-remote.remote-ssh
    ms-vscode.cmake-tools
    ms-vscode.cpptools
    ms-vscode.cpptools-extension-pack
    ms-vscode.hexeditor
    ms-vscode.makefile-tools
    supermaven.supermaven
    twxs.cmake
    visualstudioexptteam.intellicode-api-usage-examples
    visualstudioexptteam.vscodeintellicode
  ];
  vscode-extensions = with vscode-plugins; [
    andrewbutson.vscode-openai
    arm.device-manager
    arm.embedded-debug
    arm.environment-manager
    burkeholland.simple-react-snippets
    #cortex-debug.svd-viewer
    eclipse-cdt.peripheral-inspector
    eclipse-cdt.serial-monitor
    fill-labs.dependi
    hancel.serialport-helper
    makinteract.micro-bit-python
    marus25.cortex-debug
    mcu-debug.debug-tracker-vscode
    mcu-debug.memory-view
    mcu-debug.peripheral-viewer
    mcu-debug.rtos-views
    microbit.microbit-pack
    ms-vscode.vscode-serial-monitor
    msjsdiag.vscode-react-native
    platformio.platformio-ide
    sos82.microbit-micropython
    vue.volar
    webfreak.debug
  ] ++ vscode-extensions-repo;
in
  vscode-extensions
