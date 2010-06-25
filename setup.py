from distutils.core import setup
from distutils.core import Extension
from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext

ext_modules=[
    Extension("pyalpm",
              ["pyalpm.pyx"],
              libraries=["alpm"]) # Unix-like specific
]

setup(
  name = "pyalpm",
  cmdclass = {"build_ext": build_ext},
  ext_modules = ext_modules
)
