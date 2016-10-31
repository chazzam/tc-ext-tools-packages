. common;
EXT_DIR_MOH="asterisk-moh-FORMAT";
EXT_DIR_SOUNDS="asterisk-sounds-LANGUAGE-FORMAT";
EXT_DIR_SOUNDS_MINIMUM="asterisk-sounds-LANGUAGE-FORMAT-minimum";
DIR_SOUNDS=${DIR_SOUNDS##/};
DIR_MOH=${DIR_MOH##/};
DIR_SOUNDS=${DIR_SOUNDS%%/};
DIR_MOH=${DIR_MOH%%/};

write_install_file() {
  local dir="${1%%/}";
  local install_file="$dir/install";
  local type=${TYPE:-core};

  case $type in
    core)
      ( cat <<EOF
${DIR_SOUNDS}/$LANGUAGE/*.${FORMAT}
${DIR_SOUNDS}/$LANGUAGE/*/*.${FORMAT}
${DIR_SOUNDS}/$LANGUAGE/CHANGES*
${DIR_SOUNDS}/$LANGUAGE/CREDITS*
${DIR_SOUNDS}/$LANGUAGE/LICENSE*
${DIR_SOUNDS}/$LANGUAGE/*.txt
EOF
      ) > $install_file;
      ;;
    moh)
      ( cat <<EOF
${DIR_MOH}/*.${FORMAT}
EOF
      ) > $install_file;
      ;;
    min)
      ( cat <<EOF
${DIR_MOH}/macroform-cold_day.${FORMAT}
${DIR_SOUNDS}/$LANGUAGE/demo-*.${FORMAT}
EOF
      ) > $install_file;
      ;;
  esac;
}

write_format_dirs() {
  local dir_base="$1";
  TYPE="${2-core}";
  for f in $FORMATS; do
    FORMAT="$f";
    local dir=${dir_base/FORMAT/$f};
    [ -d $dir ] && continue;
    mkdir $dir
    touch ${dir%%/}/dep;
    write_install_file "$dir";
  done;
}

main() {
  ( cd extensions;
    write_format_dirs "$EXT_DIR_MOH" "moh";
    for l in $LANGUAGES_CORE; do
      LANGUAGE="$l";
      local dir_snd="${EXT_DIR_SOUNDS/LANGUAGE/$l}";
      local dir_min="${EXT_DIR_SOUNDS_MINIMUM/LANGUAGE/$l}";
      write_format_dirs "$dir_snd" "core";
      write_format_dirs "$dir_min" "min";
    done;
  );
}

main;
