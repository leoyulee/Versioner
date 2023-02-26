--!strict
local VersionClass = require(script.Parent.Parent.Parent.Version)
type Version = VersionClass.Version
--[=[
    @class Versioner
    An interface of which versions can be utilized.
]=]
local Versioner: Versioner = {}
Versioner.__index = Versioner
type Versioner = {
    CompareVersions: (currentVersion: string | VersionClass.Version, expectedVersion: string | VersionClass.Version) -> (boolean);
}
local function CompVersions(currVersion: VersionClass.Version, expVersion: VersionClass.Version)
    if currVersion == expVersion then
        return nil
    end
    --print(selfVersion,VersionUsed)
    local VersionComparisonString = string.format("Present Version: %s\nExpected Version: %s", tostring(currVersion), tostring(expVersion))
    if currVersion > expVersion then
        local presMajor,presMinor,presPatch = currVersion:GetMajorVersion(),currVersion:GetMinorVersion(),currVersion:GetPatchVersion()
        local expMajor,expMinor,expPatch = expVersion:GetMajorVersion(),expVersion:GetMinorVersion(),expVersion:GetPatchVersion()
        assert(presMajor <= expMajor,debug.traceback("A significantly older version was expected! Errors are likely to occur!\n"..VersionComparisonString.."\nTraceback:",2))
        if presMinor > expMinor then
            --warn(debug.traceback("An older version was expected. Check for possible deprecations!\n"..VersionComparisonString.."\nTraceback:",2))
            return
        elseif presPatch > expPatch then
            --print(debug.traceback("An older patch was expected. Check for possible deprecations.\n"..VersionComparisonString.."\nTraceback:",2))
            return
        end
    else
        assert(currVersion == expVersion, debug.traceback("Expected a version that was never released! Errors are likely to occur!\n"..VersionComparisonString.."\nTrackback:\n",2))
    end
end

--TODO: Figure out what to return
--[=[
    Compares the inputted versions, with the first version being the "current" version and the second version being the "expected" version.
    @param currentVersion string | Version -- The "current" version to be compared to. Should be the version that is being relied on for an indication that others are out of date.
    @param expectedVersion string | Version -- The "expected" version that needs to be checked. This version relies on the "current" version to tell if it's out of date.

    @return nil? -- To be determined...
]=]
function Versioner.CompareVersions(currentVersion: string | VersionClass.Version, expectedVersion: string | VersionClass.Version)
    local currVersion, currStringed = currentVersion, false
    if type(currentVersion) == "string" then
        currVersion = VersionClass.fromString(currentVersion) :: Version
        currStringed = true
    end
    local expVersion, expStringed = expectedVersion, false
    if type(expectedVersion) == "string" then
        expVersion = VersionClass.fromString(expectedVersion) :: Version
        expStringed = true
    end
    --TODO: Figure out what to do on failures and what to return
    local Passed, _Result = pcall(CompVersions, currVersion, expVersion)
    if currStringed then
        currVersion:Destroy()
    end
    if expStringed then
        expVersion:Destroy()
    end
    return Passed
end

return Versioner