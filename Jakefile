/*
 * Jakefile
 * Taskboard
 *
 * Created by You on June 18, 2011.
 * Copyright 2011, Your Company All rights reserved.
 */

var ENV = require("system").env,
    FILE = require("file"),
    JAKE = require("jake"),
    task = JAKE.task,
    FileList = JAKE.FileList,
    app = require("cappuccino/jake").app,
    configuration = ENV["CONFIG"] || ENV["CONFIGURATION"] || ENV["c"] || "Debug",
    OS = require("os");

app ("Taskboard", function(task)
{
    print("Taskboard");
    task.setBuildIntermediatesPath(FILE.join("Build", "Taskboard.build", configuration));
    task.setBuildPath(FILE.join("Build", configuration));

    task.setProductName("Taskboard");
    task.setIdentifier("com.yourcompany.Taskboard");
    task.setVersion("1.0");
    task.setAuthor("Your Company");
    task.setEmail("feedback @nospam@ yourcompany.com");
    task.setSummary("Taskboard");
    task.setSources((new FileList("**/*.j")).exclude(FILE.join("Build", "**")));
    task.setResources(new FileList("Resources/**"));
    task.setIndexFilePath("index.html");
    task.setInfoPlistPath("Info.plist");

    if (configuration === "Debug")
        task.setCompilerFlags("-DDEBUG -g");
    else
        task.setCompilerFlags("-O");
});

task ("default", ["Taskboard"], function()
{
    print("default");
    printResults(configuration);
});

task ("build", ["default"]);

task ("debug", function()
{
    print("debug");
    ENV["CONFIGURATION"] = "Debug";
    JAKE.subjake(["."], "build", ENV);
});

task ("release", function()
{
    ENV["CONFIGURATION"] = "Release";
    JAKE.subjake(["."], "build", ENV);
});

task ("run", ["debug"], function()
{
    OS.system(["open", FILE.join("Build", "Debug", "Taskboard", "index.html")]);
});

task ("run-release", ["release"], function()
{
    OS.system(["open", FILE.join("Build", "Release", "Taskboard", "index.html")]);
});

task ("deploy", ["release"], function()
{
    FILE.mkdirs(FILE.join("Build", "Deployment", "Taskboard"));
    OS.system(["press", "-f", FILE.join("Build", "Release", "Taskboard"), FILE.join("Build", "Deployment", "Taskboard")]);
    printResults("Deployment")
});

task ("desktop", ["release"], function()
{
    FILE.mkdirs(FILE.join("Build", "Desktop", "Taskboard"));
    require("cappuccino/nativehost").buildNativeHost(FILE.join("Build", "Release", "Taskboard"), FILE.join("Build", "Desktop", "Taskboard", "Taskboard.app"));
    printResults("Desktop")
});

task ("run-desktop", ["desktop"], function()
{
    OS.system([FILE.join("Build", "Desktop", "Taskboard", "Taskboard.app", "Contents", "MacOS", "NativeHost"), "-i"]);
});

function printResults(configuration)
{
    print("----------------------------");
    print(configuration+" app built at path: "+FILE.join("Build", configuration, "Taskboard"));
    print("----------------------------");
}
