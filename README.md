# robot_framework_demo

1. installation:
    1. install Visual Studio Code and Git
    2. install python
    3. install Robot Framework and external libraries with pip:
            - robotframework
            - robotframework-seleniumlibrary
            - robotframework-pythonlibcore
            - robotframework-jsonlibrary
            - robotframework-faker: random test data generator
            - rpa framework (core, windows)
    4. extensions for VSC:
            - Python
            - Pylance
            - Robocorp Code
            - Robot Framework Language Server
    
2. set result folder:
    add the following code into the main method of C:\Users\[user]\vscode\extensions\robocorp.robotframework-lsp-x.x.x\src\robotframework_debug_adapter\run_robot__main__.py:

...

    from datetime import datetime
    datestring = datetime.now().strftime("%Y-%m-%d-%H-%M-%S")
    robot_args = args[3:]

    # Always add the listener (because even when not debugging we want
    # to be able to provide output messages for logging as well as
    # information to be show in the `Robot Output` View).
    robot_args = [
        "--listener=robotframework_debug_adapter.listeners.DebugListener",
        "--listener=robotframework_debug_adapter.listeners.DebugListenerV2",
	"--outputdir=C:\Temp\RobotReports\"+datestring,
    ] + robot_args

...

3. VSC settings for python:
    1. set Interpreter to c:\Users\[user]\AppData\Local\Programs\Python\Python312\python.exe
    2. Settings -> Extensions -> Robocorp Code Languge Server Configuration -> Language-Server: Python: 
            set the path to c:\Users\[user]\AppData\Local\Programs\Python\Python312\python.exe
    3. Settings -> Extensions -> Robot Framework Languge Server Configuration -> Robot Language-Server: Python: 
            set the path to c:\Users\[user]\AppData\Local\Programs\Python\Python312\python.exe

4. VSC settings for drivermanager.py:
    1. run pip install webdriver-manager
    2. Settings -> Extensions -> Robot Framework Languge Server Configuration -> Robot: Pythonpath: 
        "c:\\Users\\[user]\\AppData\\Local\\Programs\\Python\\Python312\\Lib\\site-packages\\",
        "c:\\Users\\[user]\\AppData\\Local\\Programs\\Python\\Python312\\Lib\\site-packages\\webdriver_manager\\",
        "c:\\Users\\[user]\\Repo\\robot_framework_demo\\lib\\drivermanager.py"
    3. Settings -> Extensions -> Pylance -> add paths to "Python-Analysis: Extra Paths":
            c:\Users\[user]\AppData\Local\Programs\Python\Python312\Lib\site-packages\
            c:\Users\[user]\Repo\robot_framework_demo\lib\drivermanager.py
    4. clear caches and restart Robot Framework

5. VSC settings for Robocorp:
    Settings -> Extensions -> Robocorp Code Languge Server Configuration -> add path to Home:
        c:\Users\[user]\AppData\Local\robocorp\

6. PyCharm settings:
       https://medium.com/geekculture/how-to-setup-robot-framework-for-test-automation-on-windows-2a9cc0da0763

    
