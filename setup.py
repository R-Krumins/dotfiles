import re

def get_distro_family():
    with open("/etc/os-release") as f:
        content = f.read()

    match = re.search(r'^ID=(["\']?)(?P<id>[^"\n]+)\1', content, re.MULTILINE)
    if match:
        return match.group("id")

    return None

distro = get_distro_family()
print(distro)
