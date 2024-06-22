function getClientInfo()
    return {
        name = "Set Track Color",
        category = "Visual",
        author = "MadelynWith5Ns",
        versionNumber = 0,
        minEditorVersion = 68352
    }
end

function main()
    SV:showInputBoxAsync(
        "Set Track Color",
        "Please input the desired track color below.",
        "#ffffff", colorify);
end

function colorify(color)
    SV:getMainEditor():getCurrentTrack():setDisplayColor(color);
end
