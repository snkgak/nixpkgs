{ lib
, buildPythonPackage
, fetchPypi
, pytestCheckHook
}:

buildPythonPackage rec {
  version = "2.0.3";
  pname = "dbutils";

  src = fetchPypi {
    inherit version;
    pname = "DBUtils";
    sha256 = "7d4fa60e9d9e140144566107da387b7c07ba62908b48eefff05ef3afac3202d1";
  };

  checkInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "dbutils" ];

  meta = with lib; {
    description = "Database connections for multi-threaded environments";
    homepage = "https://webwareforpython.github.io/DBUtils/";
    license = licenses.mit;
    maintainers = with maintainers; [ SuperSandro2000 ];
  };
}
