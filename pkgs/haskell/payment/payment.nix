{ mkDerivation, aeson, aeson-pretty, ansi-wl-pprint, async
, attoparsec, base, bson, bytestring, cased, cassava, containers
, data-default, Decimal, directory, errors, exceptions, filepath
, flexible, flexible-instances, foldl, formatting, hashable, hspec
, keys, lens, lens-aeson, lifted-async, lifted-base, MissingH
, monad-control, money, mongoDB, mtl, old-locale, options, parsec
, persistent, persistent-mongoDB, persistent-template, pipes
, pipes-bytestring, pipes-concurrency, pipes-csv
, pipes-postgresql-simple, pipes-safe, pointed, postgresql-simple
, pretty, profunctors, QuickCheck, random, safe, semigroupoids
, semigroups, split, stdenv, syb, tasty, tasty-hspec
, template-haskell, text, time, transformers, transformers-base
, unordered-containers, uuid, vector, word8, yaml, fetchgit
, pipes-shell, system-filepath, turtle
}:
mkDerivation {
  pname = "payment";
  version = "3.0.0";
  doCheck = false;
  src = fetchgit {
    url = http://git.monster.cat/payments;
    rev = "f13684c7c241ee655e92044bfd2d646c5fd3955a";
    sha256 = "1kbzmmzxjb6ia7h026x8w55p6x8wy0nx7p2ap94naka0r34hfq3f";
  };
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    aeson aeson-pretty ansi-wl-pprint async attoparsec base bson
    bytestring cased cassava containers data-default Decimal directory
    errors exceptions filepath flexible flexible-instances foldl
    formatting hashable keys lens lens-aeson lifted-async lifted-base
    MissingH monad-control money mongoDB mtl old-locale options parsec
    persistent persistent-mongoDB persistent-template pipes
    pipes-bytestring pipes-concurrency pipes-csv
    pipes-postgresql-simple pipes-safe pointed postgresql-simple pretty
    profunctors QuickCheck random safe semigroupoids semigroups split
    syb template-haskell text time transformers transformers-base
    unordered-containers uuid vector word8 yaml pipes-shell system-filepath
    turtle
  ];
  executableHaskellDepends = [
    aeson aeson-pretty ansi-wl-pprint async attoparsec base bytestring
    cased cassava data-default Decimal directory errors filepath
    flexible flexible-instances foldl formatting hashable keys lens
    lens-aeson lifted-base MissingH money mtl old-locale options parsec
    pipes pipes-bytestring pipes-csv pipes-postgresql-simple pipes-safe
    pointed pretty profunctors random safe semigroupoids semigroups
    split syb text time transformers unordered-containers uuid vector
    word8 yaml pipes-shell system-filepath turtle
  ];
  testHaskellDepends = [ base hspec QuickCheck tasty tasty-hspec ];
  license = stdenv.lib.licenses.bsd3;
}

