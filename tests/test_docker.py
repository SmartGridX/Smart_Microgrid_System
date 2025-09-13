import subprocess

def test_docker_build():
    """Check if Docker image builds successfully"""
    result = subprocess.run(
        ["docker", "build", "-t", "my-website-test", "website/"],
        capture_output=True,
        text=True
    )
    assert result.returncode == 0, f"Docker build failed:\n{result.stderr}"

def test_docker_run():
    """Check if Docker container can run and stop"""
    # Run container in detached mode
    run_cmd = subprocess.run(
        ["docker", "run", "-d", "-p", "8080:80", "--name", "my-website-test", "my-website-test"],
        capture_output=True,
        text=True
    )
    assert run_cmd.returncode == 0, f"Docker run failed:\n{run_cmd.stderr}"

    # Stop and remove container
    stop_cmd = subprocess.run(
        ["docker", "rm", "-f", "my-website-test"],
        capture_output=True,
        text=True
    )
    assert stop_cmd.returncode == 0, f"Failed to remove container:\n{stop_cmd.stderr}"
