project "JoltPhysics"
    kind "StaticLib"
    language "C++"
    cppdialect "C++23"
    
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
	{
		"SaturnProfiler.cpp",
		"Jolt/**.cpp",
		"Jolt/**.h",
		"Jolt/**.inl",
		"Jolt/**.gliffy"
	}

    includedirs 
    {
        "Jolt"
    }

	filter "system:windows"
        systemversion "latest"
		staticruntime "off"
    
        files { "Jolt/Jolt.natvis" }
    
	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

        defines
        {
            "_DEBUG",
            "JPH_DEBUG_RENDERER",
            "JPH_FLOATING_POINT_EXCEPTIONS_ENABLED",
            "JPH_EXTERNAL_PROFILE",
			"JPH_ENABLE_ASSERTS"
        }

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

		defines 
		{
	        "JPH_DEBUG_RENDERER",
            "JPH_FLOATING_POINT_EXCEPTIONS_ENABLED",
            "JPH_EXTERNAL_PROFILE",
			"JPH_ENABLE_ASSERTS"
		}

        vectorextensions "AVX2"
        isaextensions { "BMI", "POPCNT", "LZCNT", "F16C" }

	filter "configurations:Dist"
		runtime "Release"
		optimize "on"
		symbols "off"

        vectorextensions "AVX2"
        isaextensions { "BMI", "POPCNT", "LZCNT", "F16C" }