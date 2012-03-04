# Compass.app

[Compass.app][compassapp] is a [Sass][sass]/[Compass][compass] menubar app. It helps designers compile stylesheets easily without resorting to command line interface. It is a cross-platform software written in Java, and works in OS X/Windows/Linux.

Compass.app 2.0 supports ERB/Haml templates. You can even write layouts, partials, and helpers. (Just like a Rails/Sinatra application!)

## System Requirement

Compass.app has been tested in:

* Windows: Windows 7/Vista/XP
* OS X: 10.5, 10.6 32/64bit
* Linux: Arch Linux 32/64bit

Compass.app is written in JRuby, so you must install JRE(Java Runtime Environment) first.

## Download

You can buy Compass.app in our [official site][compassapp]. You will get an email with download links. If we have updated Compass.app, you will also get update links **for free**.

Our [source code][compassapp-github] is available on Github and under GPL v2 license. It means you can build your own, or even modify it based on your needs.

You do not have to "install Compass.app" in any platform. Just put it anywhere you want. If you do not have Java installed, Compass.app will guide you to install it first.

## Getting Started

Compass.app is a menubar/system tray app, and does not sit in your dock/taskbar.

![Windows - System Tray](windows-system-tray.png)

You can choose "Create Compass Project" to start. We have included some plugins by default: blueprint, 960gs, html5-boilerplate. You can also use "Compass > Project" if you just want a clean start.

    Project Folder/
      - sass/
      - stylesheets/
      - .sass-cache/ (The sass cache folder. Do not remove it.)
      - config.rb  (Compass's configuration file. Do not remove it.)

![Windows - Create New Project](windows-create-project.png)

Once Compass.app creates project folder for you, the app icon will become orange, which means it is "watching" your project. Compass.app 2.0 support these file types: Sass/Scss, Haml, ERB.

![Windows - Compass Watch](windows-compass-watch.png)

## Sample Project

## Preferences



## Bonus: Sass Mode

If you only want to watch Sass files, and do not want to try Compass right now, you can do the following:

If you watch an sass folder with no .sass/.scss files, you will get:

    Nothing to compile. If you're trying to start a new project, you have left off the directory argument

[compassapp]: http://compass.handlino.com/
[compassapp-github]: http://github.com/handlino/compassapp
[sass]: http://sass-lang.com/
[compass]: http://compass-style.org/
