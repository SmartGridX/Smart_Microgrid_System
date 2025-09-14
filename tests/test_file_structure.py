import os
import pytest

PROJECT_ROOT = os.path.abspath(
    os.path.join(os.path.dirname(__file__), "..") 
    )


EXPECTED_DIRS = [
    ".github",
    # "mobile_app",
    "website",
    "tests",
]

EXPECTED_FILES = [
    "README.md",
    "requirements.txt",
    "CONTRIBUTING.md",
    "CODE_OF_CONDUCT.md",
    "SECURITY.md",
    "LICENSE",
    os.path.join(".github", "workflows", "ci.yml"), 
      
]



def test_required_directories_exist():
    for d in EXPECTED_DIRS:
        path = os.path.join(PROJECT_ROOT, d)
        assert os.path.isdir(path), f"❌ Missing required directory: {d}"

def test_required_files_exist():
    for f in EXPECTED_FILES:
        path = os.path.join(PROJECT_ROOT, f)
        assert os.path.isfile(path), f"❌ Missing required file: {f}"

def test_git_initialized():
    git_dir = os.path.join(PROJECT_ROOT, ".git")
    assert os.path.isdir(git_dir), "❌ Git is not initialized in Smart_Microgrid_System/"