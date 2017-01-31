import os

cwd = os.path.dirname(os.path.abspath(__file__))
home = os.path.expanduser("~")

for file in os.listdir(cwd):
    if not file.endswith(".symlink"):
        continue

    new_filename = ".%s" % (file.replace(".symlink", ""))

    abs_path = os.path.join(cwd, file)
    symlink_path = os.path.join(home, new_filename)

    print "Symlinking: %s to %s" % (symlink_path, abs_path)

    if os.path.islink(symlink_path) and os.path.realpath(symlink_path) != abs_path:
        print "Removing broken symlink %s" % symlink_path
        os.remove(symlink_path)
    elif os.path.exists(symlink_path):
        print "Removing %s" % symlink_path
        os.remove(symlink_path)

    os.symlink(abs_path, symlink_path)
