#!/bin/bash

# Guided Learning Skill - Installation Script
# Author: Xiaowei Glacier
# License: Apache 2.0

set -e

SKILL_NAME="guided-learning"
SKILL_REPO="https://github.com/GlacierXiaowei/guided-learning-skill.git"

# Determine skills directory
if [ -n "$OPENCODE_SKILLS_DIR" ]; then
    SKILLS_DIR="$OPENCODE_SKILLS_DIR"
elif [ -d "$HOME/.config/opencode/skills" ]; then
    SKILLS_DIR="$HOME/.config/opencode/skills"
elif [ -d "$HOME/.claude/skills" ]; then
    SKILLS_DIR="$HOME/.claude/skills"
else
    SKILLS_DIR="$HOME/.config/opencode/skills"
fi

INSTALL_DIR="$SKILLS_DIR/$SKILL_NAME"

echo "🚀 Installing guided-learning-skill..."
echo "   Target: $INSTALL_DIR"

# Create skills directory if not exists
mkdir -p "$SKILLS_DIR"

# Remove existing installation
if [ -d "$INSTALL_DIR" ]; then
    echo "   Removing existing installation..."
    rm -rf "$INSTALL_DIR"
fi

# Clone the repository
echo "   Downloading..."
git clone --depth 1 "$SKILL_REPO" "$INSTALL_DIR" 2>/dev/null || {
    echo "❌ Failed to clone repository"
    exit 1
}

# Clean up git files
rm -rf "$INSTALL_DIR/.git"
rm -f "$INSTALL_DIR/.gitignore"
rm -f "$INSTALL_DIR/install.sh"

echo ""
echo "✅ Installation complete!"
echo ""
echo "📚 To use: Just send a math problem to your AI assistant."
echo "   Example: 'Find the extrema of f(x) = x³ - 3x'"
echo ""