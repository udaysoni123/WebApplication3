@echo Off
set config=%1
if "%config%" == "" (
   set config=Release
)
 
set version=1.0.0
if not "%PackageVersion%" == "" (
   set version=%PackageVersion%
)

set nuget=
if "%nuget%" == "" (
	set nuget=nuget
)

%WINDIR%\Microsoft.NET\Framework64\v4.0.30319\MSBuild WebApplication3\WebApplication3.sln /p:Configuration="%config%" /m /v:M /fl /flp:LogFile=msbuild.log;Verbosity=diag /nr:false

%nuget% pack "WebApplication3\ClassLibrary1/bin/Debug/ClassLibrary1_data.1.0.0.nupkg" -NoPackageAnalysis -verbosity detailed -o Build -Version %version% -p Configuration="%config%"
