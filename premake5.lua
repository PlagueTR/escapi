project "ESCAPI_DLL"
    location "escapi_dll"
    kind "SharedLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "Off"
    
    targetdir ("bin/" ..outputdir.. "/%{prj.name}")
    objdir ("bin-int/" ..outputdir.. "/%{prj.name}")
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
        "mfreadwrite.lib",
        "mfuuid.lib",
        "shlwapi.lib"
    }
    
    files{
        "escapi_dll/**.cpp"
    }
    
    postbuildcommands{
        ("{COPY} %{cfg.buildtarget.relpath} \"%{wks.location}/bin" ..outputdir.. "/" ..appname.. "/\"")
    }
        
    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"
        
    filter "configurations:Release"
        runtime "Release"
        optimize "On"