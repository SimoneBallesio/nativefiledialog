project "nativefiledialog"
	kind "StaticLib"

	targetdir ("Binaries/" .. outputdir .. "/%{prj.name}")
	objdir ("Build/" .. outputdir .. "/%{prj.name}")

	files
	{
    "src/nfd_common.h",
    "src/common.h",
    "src/simple_exec.h",
    "src/nfd_common.c"
  }

  includedirs
  {
    "src/include"
  }

  filter "system:windows"
    language "C++"
		systemversion "latest"
    staticruntime "On"
    
    files
		{
      "src/nfd_win.cpp"
    }

    defines 
		{ 
			"_CRT_SECURE_NO_WARNINGS"
    }

    links {
      "ole32",
      "uuid"
    } 

  filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"