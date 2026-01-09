@echo off
REM Oh My OpenCode Persistent Setup for Windows
REM Run this script to ensure Oh My OpenCode works permanently

echo ============================================
echo Oh My OpenCode - Permanent Setup
echo ============================================
echo.

REM Check if OpenCode is installed
where opencode >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] OpenCode is not installed!
    echo Please install OpenCode first: https://opencode.ai/docs
    exit /b 1
)

echo [OK] OpenCode found

REM Check OpenCode version
for /f "tokens=*" %%i in ('opencode --version 2^>nul') do set OC_VERSION=%%i
echo OpenCode version: %OC_VERSION%

REM Check if Oh My OpenCode is installed
where oh-my-opencode >nul 2>&1
if %errorlevel% neq 0 (
    echo [INFO] Oh My OpenCode not found, installing...
    npm install -g oh-my-opencode
) else (
    echo [OK] Oh My OpenCode CLI found
)

REM Get user profile path
set USERPROFILE_PATH=%USERPROFILE%
set OPENCODE_DIR=%APPDATA%\opencode

echo.
echo ============================================
echo Configuration Locations:
echo.
echo User-level: %OPENCODE_DIR%
echo Project-level: .\.opencode
echo ============================================

REM Create opencode directory if it doesn't exist
if not exist "%OPENCODE_DIR%" mkdir "%OPENCODE_DIR%"

REM Create opencode.json if it doesn't exist
if not exist "%OPENCODE_DIR%\opencode.json" (
    echo [CREATING] User-level opencode.json
    (
        echo {
        echo   "$schema": "https://opencode.ai/config.json",
        echo   "plugin": ["oh-my-opencode"],
        echo   "model": "ollama/llama3.2:3b",
        echo   "mcp": {
        echo     "context7": {"type": "remote", "url": "https://mcp.context7.com/mcp"},
        echo     "gh_grep": {"type": "remote", "url": "https://mcp.grep.app"}
        echo   },
        echo   "agent": {
        echo     "build": {"mode": "primary", "model": "ollama/llama3.2:3b"},
        echo     "plan": {"mode": "primary", "model": "ollama/llama3.2:3b"},
        echo     "explore": {"mode": "subagent", "model": "ollama/starcoder2:3b"}
        echo   },
        echo   "provider": {
        echo     "ollama": {
        echo       "npm": "@ai-sdk/openai-compatible",
        echo       "name": "Ollama (local)",
        echo       "options": {"baseURL": "http://localhost:11434/v1"},
        echo       "models": {
        echo         "llama3.2:3b": {"name": "Llama 3.2 3B"},
        echo         "qwen2.5-coder:14b": {"name": "Qwen 2.5 Coder 14B"},
        echo         "starcoder2:3b": {"name": "StarCoder2 3B"}
        echo       }
        echo     }
        echo   }
        echo }
    ) > "%OPENCODE_DIR%\opencode.json"
) else (
    echo [EXISTS] User-level opencode.json
)

REM Create oh-my-opencode.json if it doesn't exist
if not exist "%OPENCODE_DIR%\oh-my-opencode.json" (
    echo [CREATING] User-level oh-my-opencode.json
    (
        echo {
        echo   "$schema": "https://raw.githubusercontent.com/code-yeongyu/oh-my-opencode/master/assets/oh-my-opencode.schema.json",
        echo   "google_auth": false,
        echo   "sisyphus_agent": {"disabled": false, "default_builder_enabled": false, "planner_enabled": true, "replace_plan": true},
        echo   "disabled_mcps": [],
        echo   "disabled_hooks": [],
        echo   "disabled_skills": [],
        echo   "disabled_agents": [],
        echo   "ralph_loop": {"enabled": true, "default_max_iterations": 100},
        echo   "experimental": {"preemptive_compaction_threshold": 0.85, "auto_resume": false},
        echo   "agents": {
        echo     "Sisyphus": {"model": "ollama/llama3.2:3b"},
        echo     "librarian": {"model": "ollama/qwen2.5-coder:14b"},
        echo     "explore": {"model": "ollama/starcoder2:3b"},
        echo     "oracle": {"model": "ollama/llama3.2:3b"},
        echo     "frontend-ui-ux-engineer": {"model": "ollama/llama3.2:3b"},
        echo     "document-writer": {"model": "ollama/llama3.2:3b"},
        echo     "multimodal-looker": {"model": "ollama/llama3.2:3b"}
        echo   }
        echo }
    ) > "%OPENCODE_DIR%\oh-my-opencode.json"
) else (
    echo [EXISTS] User-level oh-my-opencode.json
)

REM Create project-level .opencode directory if it doesn't exist
if not exist ".opencode" mkdir ".opencode"

REM Create project-level opencode.json
echo [CREATING] Project-level .opencode\opencode.json
(
    echo {
    echo   "$schema": "https://opencode.ai/config.json",
    echo   "plugin": ["oh-my-opencode"],
    echo   "model": "ollama/llama3.2:3b",
    echo   "mcp": {
    echo     "context7": {"type": "remote", "url": "https://mcp.context7.com/mcp"},
    echo     "gh_grep": {"type": "remote", "url": "https://mcp.grep.app"}
    echo   },
    echo   "agent": {
    echo     "build": {"mode": "primary", "model": "ollama/llama3.2:3b"},
    echo     "plan": {"mode": "primary", "model": "ollama/llama3.2:3b"},
    echo     "explore": {"mode": "subagent", "model": "ollama/starcoder2:3b"}
    echo   },
    echo   "provider": {
    echo     "ollama": {
    echo       "npm": "@ai-sdk/openai-compatible",
    echo       "name": "Ollama (local)",
    echo       "options": {"baseURL": "http://localhost:11434/v1"},
    echo       "models": {
    echo         "llama3.2:3b": {"name": "Llama 3.2 3B"},
    echo         "qwen2.5-coder:14b": {"name": "Qwen 2.5 Coder 14B"},
    echo         "starcoder2:3b": {"name": "StarCoder2 3B"}
    echo       }
    echo     }
    echo   }
    echo }
) > ".opencode\opencode.json"

REM Create project-level oh-my-opencode.json
echo [CREATING] Project-level .opencode\oh-my-opencode.json
(
    echo {
    echo   "$schema": "https://raw.githubusercontent.com/code-yeongyu/oh-my-opencode/master/assets/oh-my-opencode.schema.json",
    echo   "google_auth": false,
    echo   "sisyphus_agent": {"disabled": false, "default_builder_enabled": false, "planner_enabled": true, "replace_plan": true},
    echo   "disabled_mcps": [],
    echo   "disabled_hooks": [],
    echo   "disabled_skills": [],
    echo   "disabled_agents": [],
    echo   "ralph_loop": {"enabled": true, "default_max_iterations": 100},
    echo   "experimental": {"preemptive_compaction_threshold": 0.85, "auto_resume": false},
    echo   "agents": {
    echo     "Sisyphus": {"model": "ollama/llama3.2:3b"},
    echo     "librarian": {"model": "ollama/qwen2.5-coder:14b"},
    echo     "explore": {"model": "ollama/starcoder2:3b"},
    echo     "oracle": {"model": "ollama/llama3.2:3b"},
    echo     "frontend-ui-ux-engineer": {"model": "ollama/llama3.2:3b"},
    echo     "document-writer": {"model": "ollama/llama3.2:3b"},
    echo     "multimodal-looker": {"model": "ollama/llama3.2:3b"}
    echo   }
    echo }
) > ".opencode\oh-my-opencode.json"

echo.
echo ============================================
echo Setup Complete!
echo ============================================
echo.
echo To use OpenCode with Oh My OpenCode:
echo   1. Make sure Ollama is running: ollama serve
echo   2. Run: opencode
echo   3. Sisyphus agent will be active with local models
echo.
echo Your configurations are now saved at:
echo   - User level: %OPENCODE_DIR%
echo   - Project level: .\.opencode
echo.
echo Magic keywords for advanced features:
echo   - "ulw" or "ultrawork" - parallel agents
echo   - "ulthink" - deep analysis
echo.
pause
