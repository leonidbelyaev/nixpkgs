{ lib
, buildPythonPackage
, pythonOlder
, fetchPypi
, jupyter-packaging
, bqscales
, ipywidgets
, numpy
, pandas
, traitlets
, traittypes
}:

buildPythonPackage rec {
  pname = "bqplot";
  version = "0.12.36";

  format = "pyproject";
  disabled = pythonOlder "3.6";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-alU+Vf28xPYuBWeb10slSdHvvkPhIK07C8sDplx5Ia8=";
  };

  nativeBuildInputs = [
    jupyter-packaging
  ];

  propagatedBuildInputs = [
    bqscales
    ipywidgets
    numpy
    pandas
    traitlets
    traittypes
  ];

  # no tests in PyPI dist, and not obvious to me how to build the js files from GitHub
  doCheck = false;

  pythonImportsCheck = [
    "bqplot"
    "bqplot.pyplot"
  ];

  meta = {
    description = "2D plotting library for Jupyter based on Grammar of Graphics";
    homepage = "https://bqplot.github.io/bqplot";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ bcdarwin ];
  };
}
