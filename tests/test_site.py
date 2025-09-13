# tests/test_site.py
import os

def test_index_exists():
    """Check that index.html exists"""
    assert os.path.exists("website/index.html"), "index.html is missing!"

def test_index_has_content():
    """Check that index.html is not empty"""
    with open("website/index.html", encoding="utf-8") as f:
        content = f.read().strip()
    assert len(content) > 10, "index.html seems empty"

def test_index_contains_homepage_text():
    """Check homepage contains expected keyword"""
    with open("website/index.html", encoding="utf-8") as f:
        content = f.read()
    assert "Home" in content or "Microgrid Monitoring" in content
