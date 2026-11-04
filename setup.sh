
#!/bin/bash

set -e

# Virtual environment name
VENV_NAME="venv"

echo "======================================"
echo " Ubuntu Python Environment Setup"
echo "======================================"

# Check Python 3
if ! command -v python3 &> /dev/null; then
    echo "Python3 not found. Installing..."
    sudo apt update
    sudo apt install -y python3 python3-pip python3-venv
fi

# Check venv support
if ! python3 -m venv --help &> /dev/null; then
    echo "Installing python3-venv..."
    sudo apt update
    sudo apt install -y python3-venv
fi

# Create virtual environment
if [ ! -d "$VENV_NAME" ]; then
    echo "Creating virtual environment..."
    python3 -m venv "$VENV_NAME"
else
    echo "Virtual environment already exists."
fi

# Activate virtual environment
source "$VENV_NAME/bin/activate"

# Upgrade pip
echo "Upgrading pip..."
python -m pip install --upgrade pip

# Install essential libraries
echo "Installing NumPy, Pandas and Scikit-learn..."

python -m pip install numpy pandas scikit-learn

# Attempt PyTorch CPU installation
echo "Attempting PyTorch CPU installation..."

if python -m pip install torch --index-url https://download.pytorch.org/whl/cpu; then
    echo "PyTorch CPU installed successfully."
else
    echo "WARNING: PyTorch CPU installation failed."
    echo "Skipping PyTorch. Other packages will remain installed."
fi

# Verify installations
echo ""
echo "======================================"
echo " Installation Summary"
echo "======================================"

python - <<'PY'
import importlib

packages = {
    "NumPy": "numpy",
    "Pandas": "pandas",
    "Scikit-learn": "sklearn",
    "PyTorch": "torch"
}

for name, module in packages.items():
    try:
        imported = importlib.import_module(module)
        version = getattr(imported, "__version__", "Installed")
        print(f"[OK] {name}: {version}")
    except Exception:
        print(f"[SKIPPED/FAILED] {name}")

PY

echo ""
echo "Setup complete!"
echo "To activate the environment later, run:"
echo "source $VENV_NAME/bin/activate"
