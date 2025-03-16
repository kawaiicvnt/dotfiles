{ pkgs, lib }:

let
  inherit (pkgs.stdenv) isDarwin isLinux isi686 isx86_64 isAarch32 isAarch64;
  vscode-utils = pkgs.vscode-utils;
  merge = lib.attrsets.recursiveUpdate;
in
merge
  (merge
    (merge
      (merge
      {
        "andrewbutson"."vscode-openai" = vscode-utils.extensionFromVscodeMarketplace {
          name = "vscode-openai";
          publisher = "andrewbutson";
          version = "1.6.17";
          sha256 = "0jismv846q6aaci5s9hydlld5lnbvbhd7y2n95z2zqxp0fnay4wx";

        };
        "arm"."device-manager" = vscode-utils.extensionFromVscodeMarketplace {
          name = "device-manager";
          publisher = "arm";
          version = "1.13.2";
          sha256 = "19nfdhpg6hsb4l81b5gwvcg7zc8iwb37kphjc9h3jja1s45wyyza";

        };
        "arm"."embedded-debug" = vscode-utils.extensionFromVscodeMarketplace {
          name = "embedded-debug";
          publisher = "arm";
          version = "1.2.2";
          sha256 = "1lyq41d77xbppck0mlx7ddkhjp1zn3gn2lkvzcrskrgv3qb3hf4c";

        };
        "burkeholland"."simple-react-snippets" = vscode-utils.extensionFromVscodeMarketplace {
          name = "simple-react-snippets";
          publisher = "burkeholland";
          version = "1.2.8";
          sha256 = "1vws37kz25wbdfnp4pvqz4ar5c0dn07yjya7aq317a6ij4jp3d6f";

        };
        "cortex-debug"."svd-viewer" = vscode-utils.extensionFromVscodeMarketplace {
          name = "svd-viewer";
          publisher = "cortex-debug";
          version = "1.2.3";
          sha256 = "1zyljmlzw9yrwfjwkfh4z8w8bjkwhi6adhrkz182ngsibw5irgdy";

        };
        "eclipse-cdt"."peripheral-inspector" = vscode-utils.extensionFromVscodeMarketplace {
          name = "peripheral-inspector";
          publisher = "eclipse-cdt";
          version = "1.6.0";
          sha256 = "0rxlj214ghn7fv0wvvjp6vlvcjf4g0sdbjld7pqw4bhimfgcpgnp";

        };
        "eclipse-cdt"."serial-monitor" = vscode-utils.extensionFromVscodeMarketplace {
          name = "serial-monitor";
          publisher = "eclipse-cdt";
          version = "1.0.2";
          sha256 = "0q56w9c4d7a9ywscx6y4sl5a12hk4my8cryzq3rfwgkbvzqbn2xj";

        };
        "fill-labs"."dependi" = vscode-utils.extensionFromVscodeMarketplace {
          name = "dependi";
          publisher = "fill-labs";
          version = "0.7.13";
          sha256 = "1dsd4qal7wmhhbzv5jmcrf8igm20dnr256s2gp1m5myhj08qlzay";

        };
        "hancel"."serialport-helper" = vscode-utils.extensionFromVscodeMarketplace {
          name = "serialport-helper";
          publisher = "hancel";
          version = "0.0.15";
          sha256 = "0fwq0xdma5iak60j4m0gicvji46b2aj7bg49b4wrsda2kbjf1dn2";

        };
        "marus25"."cortex-debug" = vscode-utils.extensionFromVscodeMarketplace {
          name = "cortex-debug";
          publisher = "marus25";
          version = "1.12.1";
          sha256 = "1kbw93915a2ag3rgddyz4wnlifl6f2m9cxbxqqghfs341f1vm0la";

        };
        "mcu-debug"."debug-tracker-vscode" = vscode-utils.extensionFromVscodeMarketplace {
          name = "debug-tracker-vscode";
          publisher = "mcu-debug";
          version = "0.0.15";
          sha256 = "0wlz089z91my82kygv7kmip0nfkmgczcyl5h1hpxwzvb5ji0rvns";

        };
        "mcu-debug"."memory-view" = vscode-utils.extensionFromVscodeMarketplace {
          name = "memory-view";
          publisher = "mcu-debug";
          version = "0.0.25";
          sha256 = "0iqfblx5ayhpf1gj3szf3hn6145yqmkgqn18bhi5l9l7h8qkgjad";

        };
        "mcu-debug"."peripheral-viewer" = vscode-utils.extensionFromVscodeMarketplace {
          name = "peripheral-viewer";
          publisher = "mcu-debug";
          version = "1.4.6";
          sha256 = "1a499vnjmdxlh98h4c82dfrkafak3rj9h0wiwqrbibd0xcmq2mby";

        };
        "mcu-debug"."rtos-views" = vscode-utils.extensionFromVscodeMarketplace {
          name = "rtos-views";
          publisher = "mcu-debug";
          version = "0.0.7";
          sha256 = "1nhxhiq6a5rckfy9pqdkjbfq06c4xzlaqm4a5rq5r26a9rhh1wsn";

        };
        "ms-vscode"."vscode-serial-monitor" = vscode-utils.extensionFromVscodeMarketplace {
          name = "vscode-serial-monitor";
          publisher = "ms-vscode";
          version = "0.13.1";
          sha256 = "1qp0z2xm7qwcjaybgi9lsqzm7irwb9f5kdyw2crwqx24dqs854m9";
        };
        "msjsdiag"."vscode-react-native" = vscode-utils.extensionFromVscodeMarketplace {
          name = "vscode-react-native";
          publisher = "msjsdiag";
          version = "1.13.0";
          sha256 = "0s0npjnzqj3g877b9kqgc07dipww468sfbiwnf55yvvcxyhb7g6f";

        };
        "sos82"."microbit-micropython" = vscode-utils.extensionFromVscodeMarketplace {
          name = "microbit-micropython";
          publisher = "sos82";
          version = "0.1.0";
          sha256 = "0fv95hnwrqr4xfwxaxnbhklqg4jmyzqz5bgd8x423hcdm0p9pg3m";

        };
        "vue"."volar" = vscode-utils.extensionFromVscodeMarketplace {
          name = "volar";
          publisher = "vue";
          version = "2.2.8";
          sha256 = "1f40fp4gkmsk10xafqjlgdznxnamqxvbfvipy5vskqgjmx71xwbr";

        };
        "webfreak"."debug" = vscode-utils.extensionFromVscodeMarketplace {
          name = "debug";
          publisher = "webfreak";
          version = "0.27.0";
          sha256 = "0z72kls30miqg2rmdlz7knvjx6ywnip9vnxk562p4xg5qm8kkyd7";

        };
      }
        (lib.attrsets.optionalAttrs (isLinux && (isi686 || isx86_64)) {
          "arm"."environment-manager" = vscode-utils.extensionFromVscodeMarketplace {
            name = "environment-manager";
            publisher = "arm";
            version = "1.12.0";
            sha256 = "0qnqgh3g1vhk48zxlwhwanlziidr2xc7p1x1qy293rc4337vkvrm";
            arch = "linux-x64";

          };
          "makinteract"."micro-bit-python" = vscode-utils.extensionFromVscodeMarketplace {
            name = "micro-bit-python";
            publisher = "makinteract";
            version = "0.1.34";
            sha256 = "1qgxh39hjw5qhalc7zjyggxdyjykk07vrz9055sk65dxfxbpiaqg";
            arch = "linux-x64";

          };
          "microbit"."microbit-pack" = vscode-utils.extensionFromVscodeMarketplace {
            name = "microbit-pack";
            publisher = "microbit";
            version = "1.0.4";
            sha256 = "1xz4215k36j2jpj6pxl1qbxqdw8y7xalgn51zaki9w076708qgjl";
            arch = "linux-x64";

          };
          "platformio"."platformio-ide" = vscode-utils.extensionFromVscodeMarketplace {
            name = "platformio-ide";
            publisher = "platformio";
            version = "3.3.4";
            sha256 = "0saqkiaa5f8cnwlr5q51nnzmihx1w268wh7nrfqahh2bmrm85vhw";
            arch = "linux-x64";

          };
        }))
      (lib.attrsets.optionalAttrs (isLinux && (isAarch32 || isAarch64)) {
        "arm"."environment-manager" = vscode-utils.extensionFromVscodeMarketplace {
          name = "environment-manager";
          publisher = "arm";
          version = "1.12.0";
          sha256 = "15y4zd8qqdpcsnv7wpp26h89d5mjvhaqz4g3sfp9pj9yi8wr9nc4";
          arch = "linux-arm64";

        };
        "makinteract"."micro-bit-python" = vscode-utils.extensionFromVscodeMarketplace {
          name = "micro-bit-python";
          publisher = "makinteract";
          version = "0.1.34";
          sha256 = "1rgrrp285g7r8lr2ynqgci1j0arq555v9drciy6zk7vxa1pm69i1";
          arch = "linux-arm64";

        };
        "microbit"."microbit-pack" = vscode-utils.extensionFromVscodeMarketplace {
          name = "microbit-pack";
          publisher = "microbit";
          version = "1.0.4";
          sha256 = "0hsas035bm5a96nr8mw22c4gnjk4cb5ddzq2iacv4sqv9dmmwplf";
          arch = "linux-arm64";

        };
        "platformio"."platformio-ide" = vscode-utils.extensionFromVscodeMarketplace {
          name = "platformio-ide";
          publisher = "platformio";
          version = "3.3.4";
          sha256 = "05pgxia21lx0x3jg4xn4li36d54acay2fznfcgkh15ngi4lm3c7b";
          arch = "linux-arm64";

        };
      }))
    (lib.attrsets.optionalAttrs (isDarwin && (isi686 || isx86_64)) {
      "arm"."environment-manager" = vscode-utils.extensionFromVscodeMarketplace {
        name = "environment-manager";
        publisher = "arm";
        version = "1.12.0";
        sha256 = "0ndlz1m4lq0yl8a49ixw11xycc2c0bgivx3bfffahqp0j967r4ag";
        arch = "darwin-x64";

      };
      "makinteract"."micro-bit-python" = vscode-utils.extensionFromVscodeMarketplace {
        name = "micro-bit-python";
        publisher = "makinteract";
        version = "0.1.34";
        sha256 = "09r06kq17bgc34nsgna5z6pj6agjfs1k6633q07kg9sqbyncf0p5";
        arch = "darwin-x64";

      };
      "microbit"."microbit-pack" = vscode-utils.extensionFromVscodeMarketplace {
        name = "microbit-pack";
        publisher = "microbit";
        version = "1.0.4";
        sha256 = "0s1h12bjw7hf01hwljvazwrwcnbw4j4g0c6gf1lfdsdhs1hdhrry";
        arch = "darwin-x64";

      };
      "platformio"."platformio-ide" = vscode-utils.extensionFromVscodeMarketplace {
        name = "platformio-ide";
        publisher = "platformio";
        version = "3.3.4";
        sha256 = "1jk0xhbfm072hqb36jy5vfc4im1bpswcmpls06n6csg60airmqak";
        arch = "darwin-x64";

      };
    }))
  (lib.attrsets.optionalAttrs (isDarwin && (isAarch32 || isAarch64)) {
    "arm"."environment-manager" = vscode-utils.extensionFromVscodeMarketplace {
      name = "environment-manager";
      publisher = "arm";
      version = "1.12.0";
      sha256 = "0qrjzsypdnvil69p0m0sfnxydkbya5pd4vczqzay4vjvg09d3v5h";
      arch = "darwin-arm64";

    };
    "makinteract"."micro-bit-python" = vscode-utils.extensionFromVscodeMarketplace {
      name = "micro-bit-python";
      publisher = "makinteract";
      version = "0.1.34";
      sha256 = "1yfzs9p4inivla53z3cx1h3k2hcc978qczl3jg4grhh2sdlaplp2";
      arch = "darwin-arm64";

    };
    "microbit"."microbit-pack" = vscode-utils.extensionFromVscodeMarketplace {
      name = "microbit-pack";
      publisher = "microbit";
      version = "1.0.4";
      sha256 = "007rwxgxpgsx94m7hx8ip23s0y6fi6f4awdw6xf9fsilpzqa6kdp";
      arch = "darwin-arm64";

    };
    "platformio"."platformio-ide" = vscode-utils.extensionFromVscodeMarketplace {
      name = "platformio-ide";
      publisher = "platformio";
      version = "3.3.4";
      sha256 = "0avw9arqmfxcmvzmg8q9g6y24dy5p7kr7igimf3pnaqis8ky90lm";
      arch = "darwin-arm64";

    };
  })

