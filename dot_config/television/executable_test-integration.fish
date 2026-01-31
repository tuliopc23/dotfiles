#!/usr/bin/env fish
# TV Integration Test Script
# Tests all TV functions and keybindings

echo "🧪 TV Integration Test Suite"
echo "============================"
echo ""

# Test 1: TV installation
echo "📦 Test 1: TV Installation"
if type -q tv
    echo "  ✅ TV is installed: "(tv --version)
else
    echo "  ❌ TV is not installed"
    exit 1
end
echo ""

# Test 2: Dependencies
echo "🔧 Test 2: Dependencies"
set -l deps tv bat eza procs rg zoxide
for dep in $deps
    if type -q $dep
        echo "  ✅ $dep"
    else
        echo "  ❌ $dep (missing)"
    end
end
echo ""

# Test 3: TV Functions
echo "🎯 Test 3: TV Functions"
set -l functions tv-files tv-git-branch tv-git-log tv-git-changed tv-rg tv-kill tv-dir tv-env
for func in $functions
    if type -q $func
        echo "  ✅ $func"
    else
        echo "  ❌ $func (not loaded)"
    end
end
echo ""

# Test 4: Keybindings
echo "⌨️  Test 4: Keybindings"
set -l test_bindings (bind | grep -E '(\\ef|\\eb|\\eg|\\ex|\\er|\\ek|\\ej|\\ee)')
if test -n "$test_bindings"
    echo "  ✅ Alt-based TV keybindings are set:"
    echo $test_bindings | string split0 | while read -l line
        echo "    $line"
    end
else
    echo "  ❌ No TV keybindings found"
end
echo ""

# Test 5: TV Shell Integration
echo "🔌 Test 5: TV Shell Integration"
set -l tv_init_check (functions -D tv | grep "tv init fish")
if test $status -eq 0
    echo "  ✅ TV shell integration initialized"
else
    echo "  ⚠️  TV shell integration may not be initialized"
end
echo ""

# Test 6: Config File
echo "📄 Test 6: Configuration Files"
if test -f ~/.config/television/config.toml
    echo "  ✅ TV config exists"
    if grep -q "oxocarbon" ~/.config/television/config.toml
        echo "  ✅ Oxocarbon theme configured"
    end
else
    echo "  ❌ TV config missing"
end
echo ""

# Test 7: Keybinding Conflicts
echo "⚠️  Test 7: Keybinding Conflict Check"
set -l ctrl_bindings (bind | grep -E 'bind --preset ctrl-[fbge] ')
if test -n "$ctrl_bindings"
    echo "  ℹ️  Fish preset Ctrl bindings (these are normal):"
    echo $ctrl_bindings | string split0 | while read -l line
        echo "    $line"
    end
else
    echo "  ✅ No Ctrl preset bindings"
end
echo ""

# Summary
echo "📊 Summary"
echo "=========="
echo "Test complete! Review results above."
echo ""
echo "Next steps:"
echo "1. Restart shell: exec fish"
echo "2. Try Alt+F to search files"
echo "3. Try Ctrl+T for smart autocomplete"
echo "4. Try Ctrl+R for command history"
echo ""
echo "Documentation:"
echo "  bat ~/.config/television/README.md"
echo "  bat ~/.config/television/REVIEW.md"
