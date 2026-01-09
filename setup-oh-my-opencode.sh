#!/bin/bash
# Oh My OpenCode Persistent Setup Script

echo "============================================"
echo "Oh My OpenCode - Persistent Setup"
echo "============================================"

# Get user config directory
OPENCODE_DIR="$HOME/AppData/Roaming/opencode"
echo "User config directory: $OPENCODE_DIR"

# Create directories
mkdir -p "$OPENCODE_DIR"
mkdir -p ".opencode"

# Create user-level opencode.json
cat > "$OPENCODE_DIR/opencode.json" << 'JSONEOF'
{
  "$schema": "https://opencode.ai/config.json",
  "plugin": ["oh-my-opencode"],
  "model": "ollama/llama3.2:3b",
  "mcp": {
    "context7": { "type": "remote", "url": "https://mcp.context7.com/mcp" },
    "gh_grep": { "type": "remote", "url": "https://mcp.grep.app" }
  },
  "agent": {
    "build": { "mode": "primary", "model": "ollama/llama3.2:3b" },
    "plan": { "mode": "primary", "model": "ollama/llama3.2:3b" },
    "explore": { "mode": "subagent", "model": "ollama/starcoder2:3b" }
  },
  "provider": {
    "ollama": {
      "npm": "@ai-sdk/openai-compatible",
      "name": "Ollama (local)",
      "options": { "baseURL": "http://localhost:11434/v1" },
      "models": {
        "llama3.2:3b": { "name": "Llama 3.2 3B" },
        "qwen2.5-coder:14b": { "name": "Qwen 2.5 Coder 14B" },
        "starcoder2:3b": { "name": "StarCoder2 3B" }
      }
    }
  }
}
JSONEOF
echo "[OK] Created user-level opencode.json"

# Create user-level oh-my-opencode.json
cat > "$OPENCODE_DIR/oh-my-opencode.json" << 'JSONEOF'
{
  "$schema": "https://raw.githubusercontent.com/code-yeongyu/oh-my-opencode/master/assets/oh-my-opencode.schema.json",
  "google_auth": false,
  "sisyphus_agent": {
    "disabled": false,
    "default_builder_enabled": false,
    "planner_enabled": true,
    "replace_plan": true
  },
  "disabled_mcps": [],
  "disabled_hooks": [],
  "disabled_skills": [],
  "disabled_agents": [],
  "ralph_loop": { "enabled": true, "default_max_iterations": 100 },
  "experimental": { "preemptive_compaction_threshold": 0.85, "auto_resume": false },
  "agents": {
    "Sisyphus": { "model": "ollama/llama3.2:3b" },
    "librarian": { "model": "ollama/qwen2.5-coder:14b" },
    "explore": { "model": "ollama/starcoder2:3b" },
    "oracle": { "model": "ollama/llama3.2:3b" },
    "frontend-ui-ux-engineer": { "model": "ollama/llama3.2:3b" },
    "document-writer": { "model": "ollama/llama3.2:3b" },
    "multimodal-looker": { "model": "ollama/llama3.2:3b" }
  }
}
JSONEOF
echo "[OK] Created user-level oh-my-opencode.json"

# Create project-level configs
cp "$OPENCODE_DIR/opencode.json" ".opencode/opencode.json"
echo "[OK] Created project-level .opencode/opencode.json"
cp "$OPENCODE_DIR/oh-my-opencode.json" ".opencode/oh-my-opencode.json"
echo "[OK] Created project-level .opencode/oh-my-opencode.json"

echo ""
echo "============================================"
echo "Setup Complete!"
echo "============================================"
echo ""
echo "Configurations saved at:"
echo "  - User: $OPENCODE_DIR"
echo "  - Project: .opencode"
echo ""
echo "To use:"
echo "  1. ollama serve (if not running)"
echo "  2. opencode"
echo ""
echo "Magic keywords: ulw, ultrawork, ulthink"
