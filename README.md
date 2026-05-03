Ansible playbook for data.isimip.org and files.isimip.org
=========================================================

Setup
-----

```bash
python3 -m venv env
source env/bin/activate
pip install -r requirements.txt
```

Create `hosts.yml` with:

```yaml
all:
  hosts:
    data:
      ansible_host: isimip-data
      ansible_user: root
      proxy_host: ...
      environments:
      - app: prod
        ssl: true
        data_url: data.isimip.org
        gunicorn_port: 9000
      - app: dev
        ssl: true
        data_url: dev.isimip.org
        gunicorn_port: 9001
    files:
      ansible_host: isimip-files
      ansible_user: root
      files_url: files.isimip.org
      files_ssl: true
  vars:
    user: root
    ansible_python_interpreter: auto_silent
```

For a development setup on virtual machines use:

```yaml
all:
  hosts:
    data:
      ansible_host: isimip-data.utm
      ansible_user: root
      proxy_host: false
      environments:
      - app: prod
        ssl: false
        data_url: data.isimip.utm
        gunicorn_port: 9000
      - app: dev
        ssl: false
        data_url: dev.isimip.utm
        gunicorn_port: 9001
    files:
      ansible_host: isimip-files.utm
      ansible_user: root
      files_url: files.isimip.utm
      files_ssl: false
  vars:
    user: root
    ansible_python_interpreter: auto_silent
```

Usage
-----

```bash
./play
./play -l data
./play -l files
```
