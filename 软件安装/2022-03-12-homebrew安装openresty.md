# homebrew安装openresty

# 整体流程

- 终端执行`brew tap openresty/brew`
- 终端执行`brew install openresty`
- 启动openresty

# 详细过程

- 终端执行`brew tap openresty/brew`

```bash
hfwas@hfwasdeMac-mini ~ % brew tap openresty/brew
HOMEBREW_BREW_GIT_REMOTE set: using https://mirrors.ustc.edu.cn/brew.git for Homebrew/brew Git remote.
remote: Enumerating objects: 17678, done.
remote: Counting objects: 100% (17678/17678), done.
remote: Compressing objects: 100% (4898/4898), done.
remote: Total 17678 (delta 11973), reused 17678 (delta 11973)
Receiving objects: 100% (17678/17678), 7.04 MiB | 27.63 MiB/s, done.
Resolving deltas: 100% (11973/11973), completed with 330 local objects.
From https://mirrors.ustc.edu.cn/brew
   10edae9b9..f0f1eb6d4  master     -> origin/master
 * [new tag]             3.2.10     -> 3.2.10
 * [new tag]             3.2.11     -> 3.2.11
 * [new tag]             3.2.12     -> 3.2.12
 * [new tag]             3.2.13     -> 3.2.13
 * [new tag]             3.2.14     -> 3.2.14
 * [new tag]             3.2.15     -> 3.2.15
 * [new tag]             3.2.16     -> 3.2.16
 * [new tag]             3.2.17     -> 3.2.17
 * [new tag]             3.2.2      -> 3.2.2
 * [new tag]             3.2.3      -> 3.2.3
 * [new tag]             3.2.4      -> 3.2.4
 * [new tag]             3.2.5      -> 3.2.5
 * [new tag]             3.2.6      -> 3.2.6
 * [new tag]             3.2.7      -> 3.2.7
 * [new tag]             3.2.8      -> 3.2.8
 * [new tag]             3.2.9      -> 3.2.9
 * [new tag]             3.3.0      -> 3.3.0
 * [new tag]             3.3.1      -> 3.3.1
 * [new tag]             3.3.10     -> 3.3.10
 * [new tag]             3.3.11     -> 3.3.11
 * [new tag]             3.3.12     -> 3.3.12
 * [new tag]             3.3.13     -> 3.3.13
 * [new tag]             3.3.14     -> 3.3.14
 * [new tag]             3.3.15     -> 3.3.15
 * [new tag]             3.3.16     -> 3.3.16
 * [new tag]             3.3.2      -> 3.3.2
 * [new tag]             3.3.3      -> 3.3.3
 * [new tag]             3.3.4      -> 3.3.4
 * [new tag]             3.3.5      -> 3.3.5
 * [new tag]             3.3.6      -> 3.3.6
 * [new tag]             3.3.7      -> 3.3.7
 * [new tag]             3.3.8      -> 3.3.8
 * [new tag]             3.3.9      -> 3.3.9
 * [new tag]             3.4.0      -> 3.4.0
 * [new tag]             3.4.1      -> 3.4.1
HOMEBREW_CORE_GIT_REMOTE set: using https://mirrors.ustc.edu.cn/homebrew-core.git for Homebrew/brew Git remote.
remote: Enumerating objects: 167223, done.
remote: Counting objects: 100% (167223/167223), done.
remote: Compressing objects: 100% (46836/46836), done.
Updating Homebrew... 4% (6689/167223)
remote: Total 167223 (delta 120365), reused 167223 (delta 120365)
Receiving objects: 100% (167223/167223), 111.09 MiB | 37.19 MiB/s, done.
Resolving deltas: 100% (120365/120365), completed with 2975 local objects.
From https://mirrors.ustc.edu.cn/homebrew-core
   b62502da6f4..73ea3533862 master     -> origin/master
==> Auto-updated Homebrew!
Updated 2 taps (homebrew/core and homebrew/cask).
==> New Formulae
aarch64-elf-binutils            erofs-utils                     libxls                          rizin
aarch64-elf-gcc                 esbuild                         licensefinder                   roapi
abi-compliance-checker          esphome                         lighthouse                      rollup
abi-dumper                      etcd-cpp-apiv3                  lilypond                        rospo
abricate                        f2                              linode-cli                      rover
actionlint                      fann                            linux-headers@4.15              rpki-client
age                             fanyi                           linux-headers@5.16              rsc_2fa
airspyhf                        fastfec                         liqoctl                         ruby@3.0
alda                            fastp                           lit                             rune
alembic                         fastq-tools                     litani                          rure
alerter                         fb303                           llvm@12                         rustfmt
all-repos                       fbthrift                        locust                          sail
alpscore                        fdroidcl                        lua-language-server             salt-lint
ansilove                        feroxbuster                     luau                            samba
apache-pulsar                   ffmpeg@4                        lunzip                          scalingo
apt                             fheroes2                        ly                              scorecard
arkade                          firefoxpwa                      lziprecover                     scry
artillery                       fisher                          macos-term-size                 sdl12-compat
ascii2binary                    flamebearer                     mailcatcher                     seaweedfs
asyncapi                        fluid-synth@2.1                 mapproxy                        selene
atlas                           fnlfmt                          mariadb@10.5                    sevenzip
atmos                           fnt                             mbedtls@2                       sextractor
atop                            fprettify                       mcfly                           sigrok-cli
aws-auth                        fst                             mdzk                            singularity
aws-sso-util                    func-e                          microsocks                      slirp4netns
aws-vault                       fuse-overlayfs                  mimalloc                        smug
bash-language-server            fypp                            mist                            sniffer
bash_unit                       g2o                             mmtabbarview                    solana
basis_universal                 gemgen                          mold                            solargraph
bat-extras                      ghcup                           mrbayes                         spago
bbtools                         ghostunnel                      msgpack-cxx                     spdx-sbom-generator
biber                           git-branchless                  mt32emu                         spidermonkey@78
bioperl                         git-cliff                       mu-repo                         spirv-llvm-translator
bk                              git-credential-libsecret        murex                           spot
bkt                             git-svn                         nanoflann                       sql-lint
boost@1.76                      gitlab-ci-local                 nbsdgames                       sqlfluff
bottom                          go-critic                       ncc                             sshs
brev                            go@1.16                         ncnn                            statix
brigade-cli                     goawk                           neovim-qt                       stylua
btop                            gomodifytags                    nerdctl                         swiftplantuml
bubblewrap                      goplus                          netmask                         symengine
bupstash                        goproxy                         newrelic-infra-agent            tagref
ca-certificates                 gotests                         node@16                         tailscale
canfigger                       gotify                          notcurses                       tarlz
cargo-bloat                     grafana-agent                   ns-3                            teku
cargo-llvm-lines                graphqurl                       nsh                             terminalimageviewer
cargo-outdated                  gst-plugins-rs                  numdiff                         terraform-lsp
cassandra@3                     gtop                            odo-dev                         terraform-rover
cava                            h2c                             oh-my-posh                      texlive
cgif                            hcl2json                        onedrive                        textidote
charmcraft                      htmlq                           opendht                         tfk8s
checkmake                       http-prompt                     openfpgaloader                  tfmigrate
chroma                          hubble                          openliberty-jakartaee8          tfproviderlint
chrpath                         hurl                            openliberty-jakartaee9          tfschema
cilium-cli                      i2c-tools                       openliberty-microprofile4       tfupdate
clang-format@11                 imap-backup                     openliberty-webprofile8         tidy-viewer
clarinet                        influxdb-cli                    openliberty-webprofile9         tilt
clickhouse-cpp                  inotify-tools                   opensearch-dashboards           toml11
clickhouse-odbc                 iodine                          openssl@3                       tracker
cloudflared                     iproute2                        osc-cli                         trzsz
cloudiscovery                   iputils                         ots                             tsduck
cmake-docs                      iredis                          pam-reattach                    twty
colima                          isa-l                           pari-elldata                    uftrace
conmon                          ivtools                         pari-galdata                    umple
copier                          java-service-wrapper            pari-galpol                     urlwatch
corepack                        jellyfish                       pari-seadata                    usbutils
cosign                          jless                           pari-seadata-big                uutils-findutils
coursier                        joplin-cli                      payload-dumper-go               uuu
cpptoml                         jpdfbookmarks                   pdf2djvu                        vala-language-server
cppzmq                          jsonschema                      php@8.0                         vermin
cpufetch                        juliaup                         pinot                           vespa-cli
cri-tools                       k2tf                            pip-audit                       viddy
cruft                           kdoctor                         pip-tools                       vite
crun                            kn                              pkg-config-wrapper              viu
csview                          kopia                           pkgconf                         vkectl
ctlptl                          kube-score                      pocsuite3                       vtable-dumper
cue                             kubernetes-cli@1.22             poppler-qt5                     vue-cli
cwb3                            kubescape                       postgresql@13                   webp-pixbuf-loader
cyral-gimme-db-token            kubeval                         procps                          websocketpp
darglint                        kyverno                         psalm                           weggli
datafusion                      lastz                           py-spy                          west
datree                          ld-find-code-refs               pydocstyle                      wildmidi
djhtml                          libadwaita                      pyoxidizer                      wordle
doc8                            libaec                          pyright                         xauth
docuum                          libavif                         python-launcher                 xkcd
dotbot                          libfuse@2                       python-tk@3.10                  xsel
dpp                             libgrape-lite                   python@3.10                     yamale
drill                           libmng                          quick-lint-js                   yaml-language-server
dsq                             libnghttp2                      qwt-qt5                         youtubeuploader
dtm                             librasterlite2                  rbw                             yt-dlp
dynaconf                        librespot                       red-tldr                        zbctl
dynomite                        librist                         regula                          zet
eigenpy                         libsigrok                       reproc                          zk
elixir-ls                       libsigrokdecode                 reshape                         zsh-fast-syntax-highlighting
elvis                           libsoup@2                       rhit
==> Updated Formulae
Updated 5361 formulae.
==> Renamed Formulae
annie -> lux                                                     prestosql -> trino
envoy@1.17 -> envoy@1.18                                         richmd -> rich-cli
kafkacat -> kcat                                                 rt-audio -> rtaudio
linux-headers -> linux-headers@4.4                               selenium-server-standalone -> selenium-server
mr2 -> zoro                                                      wxmac -> wxwidgets
parallelstl -> onedpl                                            wxmac@3.0 -> wxwidgets@3.0
==> Deleted Formulae
advancemenu                     exomizer                        kakasi                          pdflib-lite
amap                            flasm                           l-smash                         postmark
ape                             fondu                           libbind                         rawtoaces
appledoc                        gconf                           liberasurecode                  redsocks
balance                         gcore                           libinfinity                     sdhash
bbcolors                        gf-complete                     libmill                         shorten
boost@1.57                      git-hooks                       libopendkim                     soundpipe
boost@1.60                      git-sh                          libpuzzle                       srmio
carina                          giter8                          libvbucket                      svdlibc
colorsvn                        go@1.10                         m2c                             swiftplate
contacts                        go@1.11                         magnetix                        terraform-provisioner-ansible
csv-fix                         go@1.12                         makepp                          tj
dlite                           go@1.9                          marst                           torrentcheck
dnsrend                         gr-osmosdr                      mboxgrep                        udns
drip                            hardlink-osx                    md                              vavrdiasm
dshb                            henplus                         namazu                          whitedb
eject                           hornetq                         ocamlsdl                        whohas
es                              httptunnel                      pandoc-citeproc                 xtail
eventlog                        jerasure                        path-extractor                  zdelta
==> New Casks
8x8-work                  duplicate-file-finder     keyman                    pichon                    stork
actual                    eliot                     kindavim                  pingnoo                   supermjograph
adguard-vpn               emmetapp                  kmeet                     pktriot                   supernotes
almighty                  enigma                    leapp                     playcover                 surge-xt
alpha                     epilogue-operator         letter-opener             playdate-simulator        swiftplantumlapp
ankama                    equinox                   libcblite                 plistedplus               tablecruncher
appflowy                  far2l                     libcblite-community       pluginval                 teamspeak-client
appium-inspector          fastmarks                 linearmouse               podpisuj                  temurin
arctype                   fig                       live-home-3d              poker-copilot             tentacle-sync-studio
athens                    finalshell                ludwig                    polypane                  tev
avtouchbar                firmaec                   lunasea                   ppsspp                    textsniper
azirevpn                  fishing-funds             lycheeslicer              privadovpn                the-watcher
bespoke                   flacon                    macast                    projector                 thetimemachinemechanic
betterdiscord-installer   fluent-reader             maccleaner-pro            pulse                     thinlinc-client
betterdummy               flycast                   macloggerdx               pure-writer               threema
biglybt                   fmail                     macmorpheus               qth                       threema-work
billings-pro              folder-colorizer          macrorecorder             quarto                    tic80
black-ink                 fotokasten                mana-security             quit-all                  tidelift
blackhole-64ch            foxglove-studio           manyverse                 rancher                   tidgi
blender-benchmark         foxit-pdf-editor          mathcha-notebook          rectangle-pro             todoist
blockbench                fs-uae-launcher           mds                       redis-pro                 toland-qlmarkdown
breitbandmessung          fxfactory                 megazeux                  remarkable                topnotch
buckets                   gaphor                    memory-cleaner            remix-ide                 touch-portal
bugdom                    gcc-aarch64-embedded      midi-router-client        remotehamradio            trackerzapper
centered                  gcs                       mightymike                remotion                  transfer
cirrus                    gitdock                   millie                    replacicon                trex
citrix-workspace          google-assistant          mimestream                restream-chat             trezor-suite
clay                      google-chat-electron      moebius                   revolver-office           ubports-installer
cleanmymac-zh             gosign                    monterey-cache-cleaner    ricochet-refresh          ujam
clips-ide                 grammarly-desktop         moradownloader            safe-exam-browser         ultracopier
clock-signal              gridtracker               mural                     scatter                   unipro-ugene
cloudash                  guilded                   music-bar                 schildichat               universal-gcode-platform
clover                    hackolade                 mweb-pro                  scroll                    uvtools
coarchi                   handyprintpro             mysteriumvpn              sdm                       vale-server
codeql                    hepta                     nanosaur                  semeru-jdk-open           valkyrie
coffitivity-offline       heroic                    nimblenote                shapr3d                   videoduke
confluent-cli             hostsx                    nordlayer                 shortery                  vlc-setup
creality-slicer           hush                      notch-simulator           shottr                    volley
cron                      hydrus-network            notion-enhanced           sigmaos                   vpn-tracker-365
datasette                 imagex                    notunes                   sioyek                    vsd-viewer
dataspell                 immersed                  nozbe-personal            sitala                    vsdx-annotator
dbgate                    infra                     nudge                     sleek                     vym
deepnest                  inkstitch                 odbc-manager              smartreporter-free        waltr-heic-converter
defold                    inso                      only-switch               smplayer                  wezterm
devtoys                   iptvnator                 open-video-downloader     sonic-lineup              wifi-explorer-pro
diagnostics               itraffic                  openbci                   sonic-robo-blast-2        wing-personal
direqual                  izotope-product-portal    openin                    sonic-robo-blast-2-kart   wolai
disk-diet                 jetbrains-gateway         openshift-client          sonic3air                 wondershare-edrawmax
disk-expert               jt-bridge                 otto-matic                soothe2                   write
djl-bench                 jump-desktop-connect      paddle-easydl             soundtoys                 wsjtx
dockview                  jupyterlab                panwriter                 spaceid                   xemu
doughnut                  kdocs                     paperpile                 sqlcl                     xstation5
dropbox-capture           kdrive                    pdfify                    ssdreporter-free          zebra2
dropzone                  keycombiner               pensela                   steam-plus-plus
==> Updated Casks
Updated 2439 casks.
==> Deleted Casks
3cxphone                                   hbuilder                                   qtvlm
adafruit-arduino                           hessenbox-da                               quickkeyextension
adobe-lens-profile-creator                 hocus-focus                                qyooo
agfeo-dashboard                            hoststool                                  raiderio
aio-creator-neo                            imarisviewer                               rcloneosx
air-connect                                imitone                                    rcse
airqmon                                    imobie-m1-app-checker                      red
aja-system-test                            inboard                                    refined-github-safari
aleo-studio                                instant-articles-builder                   residualvm
anka-build-cloud-registry                  instasizer                                 river-sparkle
anytrans                                   inxmail-professional                       rpvoip
anytrans-for-android                       iridient-developer                         rubitrack-pro
anzeigenchef                               ivideonclient                              s3stat-setup
armitage                                   jabt-flow                                  sbarex-qlmarkdown
art-directors-toolkit                      jaksta-media-recorder                      scrooo
asc-timetables                             jalbum                                     scrutiny
aurora                                     jidusm                                     sickbeard-anime
avast-secureline-vpn                       jsui                                       sigilium-email-signatures
axe-edit-iii                               juicebar                                   sigviewer
axe-electrum                               knox                                       silverlight
baiducloud                                 lektor                                     simplelink-msp432e4-sdk
bearychat                                  lelivrescolairefr                          skreenics
beautune                                   lightwright                                skybox
bigsur-cache-cleaner                       lilypond                                   smallpdf
bitshares                                  linein                                     spectrum
blooo                                      littlesecrets                              spectx
blue-jeans-browser-plugin                  livereload                                 spek
boonzi                                     liya                                       sql-power-architect-jdbc
breakaway                                  locklizard-safeguard-viewer                squadanimatorgaa
brooklite                                  loni-pipeline                              squadanimatorrugby
caramba-switcher                           macclean                                   squadanimatorsoccer
celldesigner                               macfusion                                  stageplotpro
chameleon-ssd-optimizer                    macintosh-explorer                         stashcat
chocolat                                   macspice                                   strange-flesh
collabshot                                 magic-launch                               superbeam
colormunki-photo                           magicprefs                                 tbe
comparemerge                               masterway-note                             tbs-studio
cytoscape                                  mathinspector                              tcl
deadbeef                                   mediahuman-audio-converter                 teamwire
delayedlauncher                            meshmixer                                  telavox-flow
dissenter-browser                          microsoft-lync                             thetube
dnagedcom                                  microsoft-r-open                           tidepool-uploader
domainbrain                                modulair                                   tmnotifier
doomrl                                     molsoftbrowser                             tranquility
dragthing                                  mweb                                       transtype
drama                                      napari                                     trayplay
dukto                                      noraswitch                                 trufont
duoshao                                    nordvpn-teams                              tuntap
dusty                                      nosqlclient                                uberconference
eaccess                                    now                                        uc-one
edenmath                                   nozbe                                      unity-appletv-support-for-editor
edrawmax                                   nure                                       unity-download-assistant
eggplant                                   obyte                                      unity-linux-il2cpp-support-for-editor
elgiganten-jotta                           octoscreen                                 unity-linux-support-for-editor
elpki                                      omx-ebooks                                 unity-lumin-support-for-editor
eudic-es                                   open-ecard                                 unity-macos-il2cpp-support-for-editor
everweb                                    optimal-layout                             unity-standard-assets
evolve-ip-uc-one                           otter-browser                              unity-web-player
fastonosql                                 outwit-hub                                 upic
finisher-fluxx                             password-assistant                         utox
finisher-micro                             pastor                                     vectr
finisher-neo                               pdftotext                                  videobox
finisher-voodoo                            phocus                                     virustotaluploader
flashlighttool                             phonebrowse                                visicut
flow-e                                     phoneclean                                 vivi
fluxcenter                                 phonerescue                                wanna
fm3-edit                                   phonetrans                                 wavtap
fraise                                     pixelpeeper                                web-sharing
freeter                                    platelet                                   webex-nbr-player
fritzing                                   playnow                                    webex-wrf-player
gameshow                                   plecs-standalone                           wercker-cli
geotagger                                  pluralsight                                windocd
getrasplex                                 pomolectron                                wingpersonal
gitbook                                    powerword                                  wolfram-player
globalmeet                                 privatus                                   wwdcsrt
google-backup-and-sync                     pro-fit                                    xamarin
google-photos-backup-and-sync              pullover                                   xlink-kai
hackhands                                  punto-switcher                             yy
hands-off                                  qit                                        zbuc-imgur
handylock                                  qqbrowser                                  zipcleaner
harvest                                    qtum                                       zoolz

==> Tapping openresty/brew
Cloning into '/opt/homebrew/Library/Taps/openresty/homebrew-brew'...
remote: Enumerating objects: 2927, done.
remote: Counting objects: 100% (95/95), done.
remote: Compressing objects: 100% (87/87), done.
remote: Total 2927 (delta 23), reused 70 (delta 8), pack-reused 2832
Receiving objects: 100% (2927/2927), 646.50 KiB | 545.00 KiB/s, done.
Resolving deltas: 100% (1611/1611), done.
Tapped 62 formulae (79 files, 787.7KB).
```

- 终端执行`brew install openresty`

```bash
hfwas@hfwasdeMac-mini ~ % brew install openresty
==> Downloading https://ghcr.io/v2/homebrew/core/geoip/manifests/1.6.12-2
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/geoip/blobs/sha256:c2ae63b815cc930a90d57c78a1d7a51a57085d67aa20431db716982353a95
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sha256:c2ae63b815cc930a90d57c78a1d7a51a57085d67aa20
######################################################################## 100.0%
==> Downloading https://raw.githubusercontent.com/openresty/openresty/master/patches/openssl-1.1.1f-sess_set_get_cb_yield.patch
######################################################################## 100.0%
==> Downloading https://www.openssl.org/source/openssl-1.1.1l.tar.gz
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/pcre/manifests/8.45
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/pcre/blobs/sha256:11193fd0a113c0bb330b1c2c21ab6f40d225c1893a451bba85e8a1562b914a
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sha256:11193fd0a113c0bb330b1c2c21ab6f40d225c1893a45
######################################################################## 100.0%
==> Downloading https://openresty.org/download/openresty-1.19.9.1.tar.gz
######################################################################## 100.0%
==> Installing openresty from openresty/brew
Warning: A newer Command Line Tools release is available.
Update them from Software Update in System Preferences or run:
  softwareupdate --all --install --force

If that doesn't show you any updates, run:
  sudo rm -rf /Library/Developer/CommandLineTools
  sudo xcode-select --install

Alternatively, manually download them from:
  https://developer.apple.com/download/all/.
You should download the Command Line Tools for Xcode 13.2.1.

==> Installing dependencies for openresty/brew/openresty: geoip, openresty/brew/openresty-openssl111 and pcre
==> Installing openresty/brew/openresty dependency: geoip
==> Pouring geoip--1.6.12.arm64_monterey.bottle.2.tar.gz
🍺  /opt/homebrew/Cellar/geoip/1.6.12: 18 files, 831.0KB
==> Installing openresty/brew/openresty dependency: openresty/brew/openresty-openssl111
Warning: A newer Command Line Tools release is available.
Update them from Software Update in System Preferences or run:
  softwareupdate --all --install --force

If that doesn't show you any updates, run:
  sudo rm -rf /Library/Developer/CommandLineTools
  sudo xcode-select --install

Alternatively, manually download them from:
  https://developer.apple.com/download/all/.
You should download the Command Line Tools for Xcode 13.2.1.

==> Patching
==> Applying openssl-1.1.1f-sess_set_get_cb_yield.patch
patching file include/openssl/bio.h
patching file include/openssl/ssl.h
patching file ssl/bio_ssl.c
Hunk #3 succeeded at 370 (offset 1 line).
patching file ssl/ssl_lib.c
Hunk #1 succeeded at 3671 (offset 53 lines).
patching file ssl/ssl_sess.c
patching file ssl/statem/statem_srvr.c
patching file util/libssl.num
==> perl ./Configure --prefix=/opt/homebrew/Cellar/openresty-openssl111/1.1.1l_1 --openssldir=/opt/homebrew/etc/openssl@1.1.1 --libdir=lib no-threads shared zl
==> make
==> make install MANDIR=/opt/homebrew/Cellar/openresty-openssl111/1.1.1l_1/share/man MANSUFFIX=ssl
🍺  /opt/homebrew/Cellar/openresty-openssl111/1.1.1l_1: 8,066 files, 17.9MB, built in 43 seconds
==> Installing openresty/brew/openresty dependency: pcre
==> Pouring pcre--8.45.arm64_monterey.bottle.tar.gz
🍺  /opt/homebrew/Cellar/pcre/8.45: 204 files, 4.6MB
==> Installing openresty/brew/openresty
==> ./configure -j8 --prefix=/opt/homebrew/Cellar/openresty/1.19.9.1_2 --pid-path=/opt/homebrew/var/run/openresty.pid --lock-path=/opt/homebrew/var/run/openres
==> make
==> make install
==> Caveats
You can find the configuration files for openresty under /opt/homebrew/etc/openresty/.

To start openresty/brew/openresty now and restart at login:
  brew services start openresty/brew/openresty
Or, if you don't want/need a background service you can just run:
  openresty
==> Summary
🍺  /opt/homebrew/Cellar/openresty/1.19.9.1_2: 305 files, 6.9MB, built in 37 seconds
==> `brew cleanup` has not been run in the last 30 days, running now...
Disable this behaviour by setting HOMEBREW_NO_INSTALL_CLEANUP.
Hide these hints with HOMEBREW_NO_ENV_HINTS (see `man brew`).
Removing: /Users/hfwas/Library/Caches/Homebrew/docker--20.10.7... (22.9MB)
Removing: /Users/hfwas/Library/Caches/Homebrew/gettext--0.21... (8.7MB)
Removing: /Users/hfwas/Library/Caches/Homebrew/git--2.32.0... (14.8MB)
Removing: /Users/hfwas/Library/Caches/Homebrew/helm--3.6.2... (14.3MB)
Removing: /Users/hfwas/Library/Caches/Homebrew/mysql@5.7--5.7.34... (71MB)
Removing: /Users/hfwas/Library/Caches/Homebrew/nvm--0.38.0... (42.9KB)
Removing: /Users/hfwas/Library/Caches/Homebrew/openssl@1.1--1.1.1k... (5.2MB)
Removing: /Users/hfwas/Library/Caches/Homebrew/pcre2--10.37... (1.5MB)
Removing: /Users/hfwas/Library/Caches/Homebrew/helm_bottle_manifest--3.6.2... (4.4KB)
Removing: /Users/hfwas/Library/Caches/Homebrew/openssl@1.1_bottle_manifest--1.1.1k... (4.8KB)
Removing: /Users/hfwas/Library/Caches/Homebrew/git_bottle_manifest--2.32.0... (6.8KB)
Removing: /Users/hfwas/Library/Caches/Homebrew/docker_bottle_manifest--20.10.7... (5.5KB)
Removing: /Users/hfwas/Library/Caches/Homebrew/pcre2_bottle_manifest--10.37... (5.1KB)
Removing: /Users/hfwas/Library/Caches/Homebrew/nvm_bottle_manifest--0.38.0... (1.7KB)
Removing: /Users/hfwas/Library/Caches/Homebrew/mysql@5.7_bottle_manifest--5.7.34... (6.3KB)
Removing: /Users/hfwas/Library/Caches/Homebrew/gettext_bottle_manifest--0.21... (6.7KB)
Removing: /Users/hfwas/Library/Caches/Homebrew/Cask/docker--3.5.1,66090.dmg... (555MB)
Removing: /Users/hfwas/Library/Logs/Homebrew/docker... (64B)
Removing: /Users/hfwas/Library/Logs/Homebrew/nvm... (64B)
Removing: /Users/hfwas/Library/Logs/Homebrew/gettext... (64B)
Removing: /Users/hfwas/Library/Logs/Homebrew/pcre2... (64B)
Removing: /Users/hfwas/Library/Logs/Homebrew/openssl@1.1... (64B)
Removing: /Users/hfwas/Library/Logs/Homebrew/mysql@5.7... (1.3KB)
Removing: /Users/hfwas/Library/Logs/Homebrew/helm... (64B)
Removing: /Users/hfwas/Library/Logs/Homebrew/git... (64B)
Pruned 0 symbolic links and 4 directories from /opt/homebrew
==> Caveats
==> openresty
You can find the configuration files for openresty under /opt/homebrew/etc/openresty/.

To start openresty/brew/openresty now and restart at login:
  brew services start openresty/brew/openresty
Or, if you don't want/need a background service you can just run:
  openresty
```

- 启动openresty

```bash
hfwas@hfwasdeMac-mini ~ % openresty
hfwas@hfwasdeMac-mini ~ % ps -ef | grep openresty
  501 69486     1   0  3:10下午 ??         0:00.00 nginx: master process openresty
  501 69493 69430   0  3:10下午 ttys001    0:00.00 grep openresty
```

# openresty相关知识

- 查看homwbrew配置，执行`brew --config`

```bash
hfwas@hfwasdeMac-mini ~ % brew --config
HOMEBREW_VERSION: 3.4.1
ORIGIN: https://mirrors.ustc.edu.cn/brew.git
HEAD: ea0ddc3297739b7380887d4a7e6b6590c314dca9
Last commit: 5 days ago
Core tap ORIGIN: https://mirrors.ustc.edu.cn/homebrew-core.git
Core tap HEAD: 73ea3533862802fe56061de0f3757ca03e3572ef
Core tap last commit: 57 minutes ago
Core tap branch: master
HOMEBREW_PREFIX: /opt/homebrew
HOMEBREW_BREW_GIT_REMOTE: https://mirrors.ustc.edu.cn/brew.git
HOMEBREW_CASK_OPTS: []
HOMEBREW_CORE_GIT_REMOTE: https://mirrors.ustc.edu.cn/homebrew-core.git
HOMEBREW_MAKE_JOBS: 8
Homebrew Ruby: 2.6.8 => /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/bin/ruby
CPU: octa-core 64-bit arm_firestorm_icestorm
Clang: 13.0.0 build 1300
Git: 2.32.0 => /opt/homebrew/bin/git
Curl: 7.77.0 => /usr/bin/curl
macOS: 12.2.1-arm64
CLT: 13.0.0.0.1.1627064638
Xcode: N/A
Rosetta 2: false
```

- 可以获取`HOMEBREW_PREFIX: /opt/homebrew`的值，值为：`/opt/homebrew`

- 进入次路径，可以修改相关配置文件

```bash
hfwas@hfwasdeMac-mini ~ % cd /opt/homebrew 
hfwas@hfwasdeMac-mini homebrew % ls
CHANGELOG.md	Cellar		LICENSE.txt	SECURITY.md	docs		lib		sbin
CONTRIBUTING.md	Dockerfile	Library		bin		etc		manpages	share
Caskroom	Frameworks	README.md	completions	include		opt		var
hfwas@hfwasdeMac-mini homebrew % 
hfwas@hfwasdeMac-mini homebrew % cd etc 
hfwas@hfwasdeMac-mini etc % ls
bash_completion.d	gitconfig		my.cnf			openresty		openssl@1.1		openssl@1.1.1
hfwas@hfwasdeMac-mini etc % 
hfwas@hfwasdeMac-mini etc % cd openresty 
hfwas@hfwasdeMac-mini openresty % ls
fastcgi.conf		fastcgi_params.default	mime.types		nginx.conf.default	uwsgi_params
fastcgi.conf.default	koi-utf			mime.types.default	scgi_params		uwsgi_params.default
fastcgi_params		koi-win			nginx.conf		scgi_params.default	win-utf
```

# 相关命令

- 启动openresty，执行`openresty`

- 停止openresty，执行
- 重启openresty，执行
- 













