@echo OFF
title "Configurador de Java para SERPRO"
rem CASO O SERVIDOR ALTERE,
rem POR FAVOR ALTERAR A VARIAVEL LOC
echo \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
echo \\ DATASUS - RJ \\\\\\\\\\\\\\\\\\\\\\
echo \\ Configurador de Java para SERPRO \\
echo \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
echo \\ Criado por: Alexander Diniz \\\\\\\
echo \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
echo \\\\\\\\\\\\\\\\\\\\\\\\\\ v. 1.0.0 \\
echo \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
echo.
echo.
echo.
echo Sera realizada a desinstalacao
NET SESSION >nul 2>&1
pause >nul
cls
IF %ERRORLEVEL% EQU 0 (
    GOTO succ
) ELSE (
    GOTO fail
)
:succ
SET LOC=################## ESCREVA SERVIDOR AQUI ####################
rem "Processos precisarão ser abatidos"
echo Iremos matar os processos que podem nos atrapalhar na instalação
taskkill /f /im java.exe /T >nul
taskkill /f /im javaw.exe /T >nul
taskkill /f /im javaws.exe /T >nul
taskkill /f /im jqs.exe /T >nul
taskkill /f /im jusched.exe /T >nul
taskkill /f /im iexplore.exe /T >nul
taskkill /f /im firefox.exe /T >nul
taskkill /f /im chrome.exe /T >nul
REM "Desinstala Java"
cls
echo Necessitaremos de auxilio nesta etapa.
echo Por favor, desinstale todas as versões existentes do Java
echo Estou executando para voce a ferramenta de desinstalacao
echo Caso nao necessite, apenas feche a mesma.
echo Enquanto isso, aguardarei o término para prosseguir.
%LOC%"\JavaUninstallTool.exe"
cls
REM "Instala Java"
echo Por favor, execute o instalador do Java 121 32 bits em sua maquina...
%LOC%\jre121.exe
cls
echo Agora iremos configurar seu Java para acesso ao SERPRO.
cd "C:\Windows"
mkdir "Sun" >nul
cd "Sun"
mkdir "Java" >nul
cd "Java"
mkdir "Deployment" >nul
COPY /Y %LOC%"\deployment.properties" "C:\Windows\Sun\Java\Deployment" >nul
COPY /Y %LOC%"\exception.sites" "C:\Windows\Sun\Java\Deployment" >nul
COPY /Y %LOC%"\deployment.config" "C:\Windows\Sun\Java\Deployment" >nul
regedit.exe /S "java.reg" >nul
cls
echo SUCESSO!
echo A instalacao foi concluida com exito
echo Por favor tente acessar o SERPRO novamente
pause >nul
EXIT /B 0
:fail
cls
echo ######## ########  ########   #######  ########
echo ##       ##     ## ##     ## ##     ## ##     ##
echo ##       ##     ## ##     ## ##     ## ##     ## 
echo ######   ########  ########  ##     ## ########  
echo ##       ##   ##   ##   ##   ##     ## ##   ##   
echo ##       ##    ##  ##    ##  ##     ## ##    ##  
echo ######## ##     ## ##     ##  #######  ##     ## 
echo.
echo.
echo ##### ERRO: PRIVILEGIOS DE ADMINISTRADOR NECESSARIOS
ECHO POR FAVOR, INICIE NOVAMENTE ESSE PROGRAMA COMO ADMINISTRADOR
PAUSE >nul
EXIT /B 1