{
  lib,
  mkCoqDerivation,
  which,
  coq,
  stdlib,
  version ? null,
  elpi-version ? null,
}:

let
  default-elpi-version =
    if elpi-version != null then
      elpi-version
    else
      (
        let

          case = case: out: { inherit case out; };
        in
        with lib.versions;
        lib.switch coq.coq-version [
          (case (range "8.20" "8.20") "2.0.7")
          (case (range "8.18" "8.19") "1.18.1")
          (case (range "8.16" "8.17") "1.17.0")
          (case "8.15" "1.15.0")
          (case (range "8.13" "8.14") "1.13.7")
          (case "8.12" "1.12.0")
          (case "8.11" "1.11.4")
        ] { }
      );
  elpi = coq.ocamlPackages.elpi.override { version = default-elpi-version; };
  propagatedBuildInputs_wo_elpi = [
    coq.ocamlPackages.findlib
  ];
  derivation = mkCoqDerivation {
    pname = "elpi";
    repo = "coq-elpi";
    owner = "LPCIC";
    inherit version;
    defaultVersion =
      let
        case = case: out: { inherit case out; };
      in
      with lib.versions;
      lib.switch coq.coq-version [
        (case (range "8.20" "8.20") "2.6.0")
        (case (range "8.20" "8.20") "2.5.2")
        (case "8.19" "2.0.1")
        (case "8.18" "2.0.0")
        (case "8.17" "1.18.0")
        (case "8.16" "1.15.6")
        (case "8.15" "1.14.0")
        (case "8.14" "1.11.2")
        (case "8.13" "1.11.1")
        (case "8.12" "1.8.3_8.12")
        (case "8.11" "1.6.3_8.11")
      ] null;
    release."2.6.0".sha256 = "sha256-23BHq1NFUkI3ayXnGUwiGFySLyY3EuH4RyMgAhQqI4g=";
    release."2.5.2".sha256 = "sha256-lLzjPrbVB3rrqox528YiheUb0u89R84Xmrgkn0oplOs=";
    release."2.5.0".sha256 = "sha256-Z5xjO83X/ZoTQlWnVupGXPH3HuJefr57Kv128I0dltg=";
    release."2.4.0".sha256 = "sha256-W2+vVGExLLux8e0nSZESSoMVvrLxhL6dmXkb+JuKiqc=";
    release."2.3.0".sha256 = "sha256-XVOI+s8Qpa7f17+Xq0y7IGPLFeJqo+cDcd3zfMuO7UU=";
    release."2.2.0".sha256 = "sha256-rADEoqTXM7/TyYkUKsmCFfj6fjpWdnZEOK++5oLfC/I=";
    release."2.0.1".sha256 = "sha256-cuoPsEJ+JRLVc9Golt2rJj4P7lKltTrrmQijjoViooc=";
    release."2.0.0".sha256 = "sha256-A/cH324M21k3SZ7+YWXtaYEbu6dZQq3K0cb1RMKjbsM=";
    release."1.19.0".sha256 = "sha256-kGoo61nJxeG/BqV+iQaV3iinwPStND+7+fYMxFkiKrQ=";
    release."1.18.0".sha256 = "sha256-2fCOlhqi4YkiL5n8SYHuc3pLH+DArf9zuMH7IhpBc2Y=";
    release."1.17.0".sha256 = "sha256-J8GatRKFU0ekNCG3V5dBI+FXypeHcLgC5QJYGYzFiEM=";
    release."1.15.6".sha256 = "sha256-qc0q01tW8NVm83801HHOBHe/7H1/F2WGDbKO6nCXfno=";
    release."1.15.1".sha256 = "sha256-NT2RlcIsFB9AvBhMxil4ZZIgx+KusMqDflj2HgQxsZg=";
    release."1.14.0".sha256 = "sha256:1v2p5dlpviwzky2i14cj7gcgf8cr0j54bdm9fl5iz1ckx60j6nvp";
    release."1.13.0".sha256 = "1j7s7dlnjbw222gnbrsjgmjck1yrx7h6hwm8zikcyxi0zys17w7n";
    release."1.12.1".sha256 = "sha256-4mO6/co7NcIQSGIQJyoO8lNWXr6dqz+bIYPO/G0cPkY=";
    release."1.11.2".sha256 = "0qk5cfh15y2zrja7267629dybd3irvxk1raz7z8qfir25a81ckd4";
    release."1.11.1".sha256 = "10j076vc2hdcbm15m6s7b6xdzibgfcbzlkgjnlkr2vv9k13qf8kc";
    release."1.10.1".sha256 = "1zsyx26dvj7pznfd2msl2w7zbw51q1nsdw0bdvdha6dga7ijf7xk";
    release."1.9.7".sha256 = "0rvn12h9dpk9s4pxy32p8j0a1h7ib7kg98iv1cbrdg25y5vs85n1";
    release."1.9.5".sha256 = "0gjdwmb6bvb5gh0a6ra48bz5fb3pr5kpxijb7a8mfydvar5i9qr6";
    release."1.9.4".sha256 = "0nii7238mya74f9g6147qmpg6gv6ic9b54x5v85nb6q60d9jh0jq";
    release."1.9.3".sha256 = "198irm800fx3n8n56vx1c6f626cizp1d7jfkrc6ba4iqhb62ma0z";
    release."1.9.2".sha256 = "1rr2fr8vjkc0is7vh1461aidz2iwkigdkp6bqss4hhv0c3ijnn07";
    release."1.8.3_8.12".sha256 = "15z2l4zy0qpw0ws7bvsmpmyv543aqghrfnl48nlwzn9q0v89p557";
    release."1.8.3_8.12".version = "1.8.3";
    release."1.8.2_8.12".sha256 = "1n6jwcdazvjgj8vsv2r9zgwpw5yqr5a1ndc2pwhmhqfl04b5dk4y";
    release."1.8.2_8.12".version = "1.8.2";
    release."1.8.1".sha256 = "1fbbdccdmr8g4wwpihzp4r2xacynjznf817lhijw6kqfav75zd0r";
    release."1.8.0".sha256 = "13ywjg94zkbki22hx7s4gfm9rr87r4ghsgan23xyl3l9z8q0idd1";
    release."1.7.0".sha256 = "1ws5cqr0xawv69prgygbl3q6dgglbaw0vc397h9flh90kxaqgyh8";
    release."1.6.3_8.11".sha256 = "1j340cr2bv95clzzkkfmsjkklham1mj84cmiyprzwv20q89zr1hp";
    release."1.6.3_8.11".version = "1.6.3";
    release."1.6.2_8.11".sha256 = "06xrx0ljilwp63ik2sxxr7h617dgbch042xfcnfpy5x96br147rn";
    release."1.6.2_8.11".version = "1.6.2";
    release."1.6.1_8.11".sha256 = "0yyyh35i1nb3pg4hw7cak15kj4y6y9l84nwar9k1ifdsagh5zq53";
    release."1.6.1_8.11".version = "1.6.1";
    release."1.6.0_8.11".sha256 = "0ahxjnzmd7kl3gl38kyjqzkfgllncr2ybnw8bvgrc6iddgga7bpq";
    release."1.6.0_8.11".version = "1.6.0";
    release."1.6.0".sha256 = "0kf99i43mlf750fr7fric764mm495a53mg5kahnbp6zcjcxxrm0b";
    releaseRev = v: "v${v}";

    buildFlags = [ "OCAMLWARN=" ];

    mlPlugin = true;
    useDuneifVersion = v: lib.versions.isGe "2.2.0" v || v == "dev";

    propagatedBuildInputs = propagatedBuildInputs_wo_elpi ++ [ elpi ];

    preConfigure = ''
      make elpi/dune || true
    '';

    meta = {
      description = "Coq plugin embedding ELPI";
      maintainers = [ lib.maintainers.cohencyril ];
      license = lib.licenses.lgpl21Plus;
    };
  };
  patched-derivation1 = derivation.overrideAttrs (
    o:
    lib.optionalAttrs (o ? elpi-version) {
      propagatedBuildInputs = propagatedBuildInputs_wo_elpi ++ [
        (coq.ocamlPackages.elpi.override { version = o.elpi-version; })
      ];
    }
  );
  patched-derivation2 = patched-derivation1.overrideAttrs (
    o:
    lib.optionalAttrs (o.version != null && (o.version == "dev" || lib.versions.isGe "2.2.0" o.version))
      {
        propagatedBuildInputs = o.propagatedBuildInputs ++ [ coq.ocamlPackages.ppx_optcomp ];
      }
  );
  patched-derivation3 = patched-derivation2.overrideAttrs (
    o:
    lib.optionalAttrs (o.version != null && o.version == "2.4.0") {
      propagatedBuildInputs = o.propagatedBuildInputs ++ [ stdlib ];
    }
  );
  patched-derivation4 = patched-derivation3.overrideAttrs (
    o:
    lib.optionalAttrs (o.version != null && (o.version == "dev" || lib.versions.isGe "2.5.0" o.version))
      {
        configurePhase = ''
          make dune-files || true
        '';
        buildPhase = ''
          dune build -p rocq-elpi @install ''${enableParallelBuilding:+-j $NIX_BUILD_CORES}
        '';
        installPhase = ''
          dune install --root . rocq-elpi --prefix=$out --libdir $OCAMLFIND_DESTDIR
          mkdir $out/lib/coq/
          mv $OCAMLFIND_DESTDIR/coq $out/lib/coq/${coq.coq-version}
        '';
      }
  );
in
# this is just a wrapper for rocqPackages.stdlib for Rocq >= 9.0
if coq.rocqPackages ? rocq-elpi then
  coq.rocqPackages.rocq-elpi.override {
    inherit version elpi-version;
    inherit (coq.rocqPackages) rocq-core;
  }
else
  patched-derivation4
