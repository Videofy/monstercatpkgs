{ Decimal
, MissingH
, aeson
, async
, attoparsec
, base
, bson
, bytestring
, compact-string-fix
, conduit
, data-default
, failure
, fetchzip
, flexible
, flexible-instances
, ghc-prim
, hashable
, hashable-generics
, lens
, mkDerivation
, mongoDB
, mtl
, persistent
, persistent-mongoDB
, persistent-template
, pwstore-fast
, safe
, stdenv
, template-haskell
, text
, time
, transformers
, unordered-containers
, uuid
, vector
, word8
, netrcFile ? null
}:

mkDerivation rec {
  pname = "monstercat-backend";
  version = "1.1.0";

  src = fetchzip {
    url = "https://github.com/monstercat/backend/archive/${version}.tar.gz";
    sha256 = "1xj1z7nyww2zirnrsh50i8xw7alidaj9fpfz8qvj12d6syiwrqlj";
    curlOpts = "--netrc-file ${netrcFile}";
  };

  buildDepends = [
    Decimal
    MissingH
    aeson
    async
    attoparsec
    base
    bson
    bytestring
    compact-string-fix
    conduit
    data-default
    failure
    flexible
    flexible-instances
    ghc-prim
    hashable
    lens
    mongoDB
    mtl
    persistent
    persistent-mongoDB
    persistent-template
    pwstore-fast
    safe
    template-haskell
    text
    time
    transformers
    unordered-containers
    uuid
    vector
    word8
  ];

  description = "Monstercat backend database";
  license = stdenv.lib.licenses.unfree;
}
