project "ESCAPI_DLL"
    location "escapi_dll"
    kind "SharedLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "off"
    
    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
    targetname "escapi"
    
    defines{
        "WIN32",
        "_WINDOWS",
        "_USRDLL",
        "ESCAPI_DLL_EXPORTS"
    }
    
    includedirs{
        "common"
    }
    
    links{
        "mfplat.lib",
        "mf.lib",
        "mfreaderwrite.lib",
        "mfuuid.lib",
        "shlwapi.lib"
    }
    
    files{
        "escapi_dll/**.cpp"
    }
    
    filter "system:windows"
        systemversion "latest"
        
    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"
        
    filter "configurations:Release"
        runtime "Release"
        optimize "on"
        
    filter "configurations:Dist"
        runtime "Release"
        optimize "on"
        