@echo off
rem ����ʾ@���������

color a
rem ����������ʾ��ɫ

Title windows����˿�ռ�ó���------By:www.wxy97.com

rem MODE con: COLS=80 LINES=25
rem MODE���Ϊ�趨����Ŀ�͸�(����MODE��,������Ҳ���ı�,�޷��鿴��ʷ��Ϣ)

:start
rem ����һ��ת����ǩ

echo.
echo                         ----------------------------------
echo                         ��ѡ��Ҫ�����ķ����������ְ��س�
echo                         ----------------------------------
echo. 
echo                         1:��ѯȫ���˿���Ϣ
echo.
echo                         2:��ѯָ���˿���Ϣ
echo.
echo                         3:��ѯPID��Ӧ����
echo.
echo                         4:����˿�ռ��
echo.
echo                         9:�˳�
echo.

:enter
rem ѡ�����
set /p choice=��ѡ��
if /i "%choice%"=="1" (
	goto findAllPort
) else if /i "%choice%"=="2" (
	goto findPort
) else if /i "%choice%"=="3" (
	goto findPid
) else if /i "%choice%"=="4" (
	goto killPort
) else if /i "%choice%"=="9" (
	goto end
) else (
	goto useless
)

rem ��Ч����
:useless
	echo.
	echo ѡ����Ч,����������
	echo.
	
	set choice=
	rem ��ձ���choice��ֵ
	
	rem pause
	rem ��ͣ
	
	rem cls
	rem ����
	
	goto enter
	rem ת����"start"��ǩ

rem ��ѯȫ���˿���Ϣ
:findAllPort
	cls
	echo.	
	netstat -aon
	echo.
	goto start

rem ��ѯָ���˿���Ϣ
:findPort
	echo.
  set /p mport=������Ҫ���ҵĶ˿�:
	cls
	echo ����ѯ�Ķ˿���:%mport%
	echo.
	echo   Э��   ���ص�ַ          	�ⲿ��ַ        	״̬           PID
	netstat -aon|findstr %mport%
	echo.
	goto start
	
rem ��ѯPID��Ӧ����
:findPid
	echo.
  set /p mPid=������˿ڶ�Ӧ��PID(����ID):
  cls
	echo ����ѯ��PID(����ID)��:%mPid%
	echo.
	tasklist /fi "pid eq %mPid%"
	echo.
	goto start

rem ����˿�ռ��
:killPort
	echo.
	set /p mPid=������Ҫ��ֹ��PID(����ID):
	cls
	echo ��Ҫ�����PID��(����ID):%mPid%
	echo.
	taskkill /f /t /pid %mPid%
	echo.
	goto start

:end