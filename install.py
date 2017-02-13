import os

cwd = os.path.dirname(os.path.abspath(__file__))
home = os.path.expanduser("~")

def symlink(abs_path, symlink_path):

    if os.path.islink(symlink_path):
        if os.path.realpath(symlink_path) != abs_path:
            print "Removing broken symlink %s" % symlink_path
        else:
            print "%s is already linked correctly" % symlink_path
            return
    elif os.path.exists(symlink_path):
        print "Removing %s" % symlink_path
        os.remove(symlink_path)

    print "Symlinking: %s to %s" % (symlink_path, abs_path)
    os.symlink(abs_path, symlink_path)


# Base level dotfiles.
for file in os.listdir(cwd):
    if not file.endswith(".symlink"):
        continue

    # I don't love how this can just replace all `.symlink`s but I'm broadly
    # controlling the inputs so it's good enough for now.
    new_filename = ".%s" % (file.replace(".symlink", ""))

    abs_path = os.path.join(cwd, file)
    symlink_path = os.path.join(home, new_filename)
    symlink(abs_path, symlink_path)


# Fish config
config_dir = os.path.expanduser("~/.config")
if not os.path.exists(config_dir):
    print "Creating %s" % config_dir
    os.makedirs(config_dir)

fish_config = os.path.join(cwd, "fish")
symlink_path = os.path.join(config_dir, "fish")

symlink(fish_config, symlink_path)
