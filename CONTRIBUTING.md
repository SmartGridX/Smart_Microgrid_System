# Contributing to Smart Microgrid System

Thank you for your interest in contributing to the **Smart Microgrid System** project!  
Your contributions—whether code, documentation, bug reports, or suggestions—help us improve the system for smarter energy management.

---

## 🚀 How to Contribute

### 🐛 Reporting Issues
- Check the **Issues** tab to see if your issue already exists.
- If not, create a **new issue** with:
  - Clear and descriptive title  
  - Steps to reproduce the problem  
  - Expected vs actual behavior  
  - Screenshots or logs (if applicable)  

---

### 💡 Suggesting Features
- Open a new issue under the **Feature Request** label.
- Describe:
  - The feature name  
  - Why it’s needed  
  - How it improves the system  

---

### 🛠️ Submitting Code
1. **Fork the repository**  
2. **Clone your fork**  
   ```bash
   git clone https://github.com/yourusername/Smart_Microgrid_System.git

   cd Smart_Microgrid_System
   
   pip install -r requirements.txt
   ```
3. Make changes in the proper directories:

- website/ → HTML, CSS, JS changes , Dockerfile

- tests/ → Add or update tests

- mobile_app/ → Frontend , Backend , Dockerfile , docker-compose.yml

4. Run tests before commiting
    ```bash
    pytest -v
    ```
5. Commit with a clear message
   ```bash
    git add .
    git commit -m "Add feature: describe your change"
   ```
6.Push to your branch
  ```bash
  git push origin feature/my-new-feature
  ```
7. Open a pull request
- Provide a clear description of your changes

- Link related issues if applicable
---

###📏 Code Style

- Use consistent indentation (2 or 4 spaces).

- Write descriptive variable and function names.

- Keep CSS/JS organized inside website/styles/ and website/scripts/.

- Update or add tests for any new functionality.
---

### 🔍 Review Process

- PRs will be reviewed by maintainers.

- Changes may be requested before merging.

- Always pull the latest changes from dev before starting work.
