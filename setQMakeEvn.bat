::
::
:: Setting qtVersion build evn
::
:: vsVersion:		The project path
:: qtVersion:		The project name, using %projectName%.pro for building.
:: arch: 			The vs project path
::
:: setQtEnv(vsVersion, qtVersion, arch)
::

@echo off

set qtVersion=%1
set arch=%2

if "%qtVersion%" == ""  (
	set qtVersion=5.15.0
)

echo ###########################################################################################################
echo #   
echo #  The following softs must be installed: qtVersion, VS2017, VS2019, Python, Perl, Git and etc   
echo #
echo #  QT_HOME: %QT_HOME%
echo #  VS2017_HOME: %VS2017_HOME%
echo #  VS2019_HOME: %VS2019_HOME%
echo # 
echo #
echo #  The Arguments:
echo #	
echo #  qtVersion: %qtVersion%
echo #  arch: %arch%
echo #
echo ############################################################################################################
echo.

if "%qtVersion%" == "5.12.4" (
	if "%arch%" == "x86" (
		call "%QT_HOME%\%qtVersion%\msvc2017\bin\qtenv2.bat"
		call "%VS2017_HOME%\VC\Auxiliary\Build\vcvars32.bat"
	) else (
		call "%QT_HOME%\%qtVersion%\msvc2017_64\bin\qtenv2.bat"
		call "%VS2017_HOME%\VC\Auxiliary\Build\vcvars64.bat"
	)
) else (
	if "%qtVersion%" == "5.15.0" (
		if "%arch%" == "x86" (
			call "%QT_HOME%\%qtVersion%\msvc2019\bin\qtenv2.bat"
			call "%VS2019_HOME%\VC\Auxiliary\Build\vcvars32.bat"
		) else (
			call "%QT_HOME%\%qtVersion%\msvc2019_64\bin\qtenv2.bat"
			call "%VS2019_HOME%\VC\Auxiliary\Build\vcvars64.bat"
		)
	) else (
		echo We only support 5.15.0 5.12.4,  Press Any key to exit ...
		pause
		goto end
	)
)

echo Checking qt ...
qmake -v
jom /VERSION
echo. & echo.

echo Checking vs ...
cmake --version
echo. & echo.

echo Checking python ...
python --version
echo. & echo.

echo Check Git ...
git --version
echo. & echo.

echo Check perl ...
perl -v
echo. & echo.

echo All done.

:end