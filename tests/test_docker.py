import subprocess
import pytest
import os

# Container/image names
DB_CONTAINER = "microgrid-db"
BACKEND_IMAGE = "microgrid-backend-test"


def run_cmd(cmd: list[str]) -> str:
    """Run a shell command and return stdout (strip)."""
    result = subprocess.run(cmd, capture_output=True, text=True, encoding="utf-8", errors="replace")
    if result.returncode != 0:
        raise RuntimeError(f"Command failed: {' '.join(cmd)}\n{result.stderr}")
    return result.stdout.strip()


def is_container_running(name: str) -> bool:
    return bool(run_cmd(["docker", "ps", "-q", "-f", f"name={name}"]))


def is_container_exists(name: str) -> bool:
    return bool(run_cmd(["docker", "ps", "-a", "-q", "-f", f"name={name}"]))


def test_backend_docker_build():
    """Build backend image + ensure DB container exists/runs."""

    project_root = os.path.abspath(os.path.join(os.path.dirname(__file__), "..","mobile_app","Backend"))

    # --- Build backend test image (Dockerfile must be in project root) ---
    run_cmd([
        "docker", "build",
        "-t", BACKEND_IMAGE,
        "-f", os.path.join(project_root, "Dockerfile"),
        project_root
    ])

    # --- Ensure DB container is created ---
    if not is_container_exists(DB_CONTAINER):
        run_cmd([
            "docker", "run", "-d",
            "--name", DB_CONTAINER,
            "-e", "POSTGRES_PASSWORD=postgres",
            "-e", "POSTGRES_USER=postgres",
            "-e", "POSTGRES_DB=microgrid",
            "postgres:15"
        ])

    # --- Ensure DB is running ---
    if not is_container_running(DB_CONTAINER):
        run_cmd(["docker", "start", DB_CONTAINER])

    assert is_container_running(DB_CONTAINER), f"DB container {DB_CONTAINER} is not running"


def test_backend_docker_run():
    """Check if backend container can run with DB."""
    assert is_container_running(DB_CONTAINER), f"Database container '{DB_CONTAINER}' is not running"

    backend_container = run_cmd([
        "docker", "run", "--rm", "-d",
        "--name", "microgrid-backend-test-container",
        "--link", DB_CONTAINER,
        BACKEND_IMAGE
    ])

    assert backend_container, "Backend container failed to start"

    # Stop backend container after check
    run_cmd(["docker", "stop", "microgrid-backend-test-container"])
