{ lib
, buildPythonPackage
, fetchPypi
, zope_interface
, zope_testing
}:

buildPythonPackage rec {
  pname = "tl-eggdeps";
  version = "0.5.1";

  src = fetchPypi {
    inherit version;
    pname = "tl.eggdeps";
    sha256 = "16e6593b676cfed783e9f8c257ee18a6e7e6d4cb27df2e9aa4a8ce253f30d94f";
  };

  propagatedBuildInputs = [ zope_interface zope_testing ];

  # tests fail, see https://hydra.nixos.org/build/4316603/log/raw
  doCheck = false;

  meta = with lib; {
    description = "A tool which computes a dependency graph between active Python eggs";
    homepage = "http://thomas-lotze.de/en/software/eggdeps/";
    license = licenses.zpl20;
  };

}
