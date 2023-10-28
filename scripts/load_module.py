#!/usr/bin/env python3

def by_path(path, name=None):
    if name is None:
        import os
        name = os.path.basename(path).removesuffix(".py")
    import importlib.util, importlib.machinery
    spec = importlib.util.spec_from_loader(name, importlib.machinery.SourceFileLoader(name, path))
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module

if __name__ == "__main__":
    import sys
    by_path(sys.argv[1])
