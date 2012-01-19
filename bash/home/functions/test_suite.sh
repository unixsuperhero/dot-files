
## Run and rerun the test suite automagically

retest () {
  if [[ -z $1 ]]; then
    if bundle exec cucumber -f progress $(_failed_tests) |
      tee "tmp/_fail.log"
    then
      rm tmp/fail.log
      mv tmp/_fail.log tmp/fail.log
    fi
  else
    bundle exec rake db:migrate db:test:prepare
    bundle exec specjour | tee "tmp/fail.log"
  fi
}

_failed_tests() {
  if [[ -z $1 ]]; then
    sed -n '/Failing Scenarios/,$p' "tmp/fail.log" |
      grep -o 'features[/][^#]*' |
      sed 's/ *$//' |
      sed 's/.*//'
  else
    sed -n '/Failing Scenarios/,$p' "tmp/fail.log" |
      grep -o 'features[/][^#]*' |
      sed 's/ *$//' |
      sed 's/.*//' |
      sed 's/:[0-9][0-9]*//'
  fi
}

fail() {
  echo "Running:"
  echo '--------------------------------'
  declare -f fail
  the_date=$(date +"%Y%m%d%H%M%S")
  log_file="fail.${the_date}.log"
  echo '--------------------------------'
  echo 'log_file: [tmp/'$log_file'] the_date: ['$the_date']'
  echo '--------------------------------'
  echo
  rake db:migrate db:test:prepare
  bundle exec specjour | tee "tmp/$log_file"
  [[ -r "tmp/fail.log" ]] && rm "tmp/fail.log"
  ln -s "$(pwd)/tmp/$log_file" "tmp/fail.log"
}

failed_tests() {
  #sed -n '/Failing Scenarios/,$p' "tmp/fail.log" | grep -o 'features[/][^#]*' | sed 's/ *$//' | sed 's/.*//'
  _failed_tests $@
}

unfail() {
  the_date=$(date +"%Y%m%d%H%M%S")
  log_file="fail.${the_date}.log"
  bundle exec cucumber -f progress $(failed_tests) | tee "tmp/$log_file"
  [[ -r "tmp/fail.log" ]] && rm "tmp/fail.log"
  ln -s "$(pwd)/tmp/$log_file" "tmp/fail.log"
}
