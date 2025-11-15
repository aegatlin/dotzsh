# ============================================================================
# HELP
# ============================================================================

# Show available aliases and functions
# Usage: dzh
function dzh() {
  cat <<'EOF'
ALIASES (aliases.zsh):
  ..          cd ..
  g           git
  l           ls -alG
  nr          npm run
  v           vim
  imps        iex -S mix phx.server

FUNCTIONS (functions.zsh):
  dzh         this help
  cdc <dir>   cd ~/.config/<dir>
  cdw [dir]   cd ~/w/[dir]
  cdg         cd ~/w/g
  ports       show listening ports
  myip        show local/public IPs
EOF
}

# ============================================================================
# DIRECTORY NAVIGATION SHORTCUTS
# ============================================================================

# Navigate to ~/.config/<subdir>
# Usage: cdc ghostty, cdc zsh, cdc zed, etc.
function cdc() {
  cd ~/.config/"$1"
}

# Navigate to ~/w/ or ~/w/<subdir>
# Usage: cdw (goes to ~/w/) or cdw g (goes to ~/w/g/)
function cdw() {
  if [ -z "$1" ]; then
    cd ~/w
  else
    cd ~/w/"$1"
  fi
}

# Quick shortcut to ~/w/g/
# Usage: cdg
function cdg() {
  cd ~/w/g
}

# ============================================================================
# SYSTEM UTILITIES
# ============================================================================

# Show what's listening on which ports
# Usage: ports
function ports() {
  lsof -iTCP -sTCP:LISTEN -n -P | awk 'NR==1 || /LISTEN/'
}

# Show local and public IP addresses
# Usage: myip
function myip() {
  echo "Local IP:  $(ipconfig getifaddr en0 2>/dev/null || echo 'Not connected')"
  echo "Public IP: $(curl -s ifconfig.me || echo 'Not connected')"
}
