var panel = new Panel("io.gitgud.wackyideas.panel");
panel.location = "bottom";
panel.height = 40;
panel.floating = false;

panel.addWidget("io.gitgud.wackyideas.SevenStart");

var tasks = panel.addWidget("io.gitgud.wackyideas.seventasks");
tasks.currentConfigGroup = ["General"];
tasks.writeConfig("launchers", "applications:systemsettings.desktop,preferred://filemanager,preferred://browser,applications:dev.zed.Zed.desktop,applications:discord.desktop,applications:antigravity.desktop,applications:stm32cubeide-2.3.desktop,applications:spotify-launcher.desktop,applications:ai.opencode.desktop.desktop");

panel.addWidget("io.gitgud.wackyideas.systemtray");
panel.addWidget("io.gitgud.wackyideas.digitalclocklite");
panel.addWidget("io.gitgud.wackyideas.win7showdesktop");

var desktopsArray = desktopsForActivity(currentActivity());
for (var j = 0; j < desktopsArray.length; j++) {
    desktopsArray[j].wallpaperPlugin = "org.kde.image";
    desktopsArray[j].currentConfigGroup = ["Wallpaper", "org.kde.image", "General"];
    desktopsArray[j].writeConfig("Image", "file:///home/fragile/.local/share/wallpapers/misty-forest.jpg");
}
