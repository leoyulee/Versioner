local ReplicatedStorage = game:GetService("ReplicatedStorage")
return function()
    local Versioner = require(script.Parent)
    describe("Versioner",function()
        local InitVersion = "1.5.1"
        it("should return an all clear when the versions match",function()
            expect(Versioner.CompareVersions(InitVersion,"1.5.1")).to.be.ok() --uhh figure out something here
        end)
        it("should return a message about the expected Version expecting something beyond the current Version",function()
            expect(Versioner.CompareVersions(InitVersion,"2.0.0")).to.equal(false) --uhh figure out something here
        end)
        it("should return a message about the expected Version being a patch behind the current Version",function()
            expect(Versioner.CompareVersions(InitVersion,"1.5.0")).to.be.ok() --uhh figure out something here
        end)
        it("should return a message about the expected Version being minorly behind the current Version",function()
            expect(Versioner.CompareVersions(InitVersion,"1.4.0")).to.be.ok() --uhh figure out something here
        end)
        it("should return a message about the expected Version being majorly behind the current Version",function()
            expect(Versioner.CompareVersions(InitVersion,"0.5.1")).to.equal(false) --uhh figure out something here
        end)
    end)
end