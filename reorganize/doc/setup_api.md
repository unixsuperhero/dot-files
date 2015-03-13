
# Setup Api

* class FileSystem
  * def initialize              file_opts
  * def glob                    pattern
  * def basename                f
  * def directory?              f
  * def exist?                  f
  * def join                    *args
  * def realpath                f,                relative_to=nil
  * def symlink?                f
  * def ln                      src,              dest,             opts=file_opts
  * def ln_s                    src,              dest,             opts=file_opts
  * def ln_sf                   src,              dest,             opts=file_opts
  * def link                    src,              dest,             opts=file_opts
  * def mkdir_p                 list,             opts=file_opts
  * def mv                      src,              dest,             opts=file_opts
  * def rm                      list,             opts=file_opts

* class Dotfiles
  * def self.build              args=ARGV.clone
  * def self.install            args=ARGV.clone
  * def self.setup              args=ARGV.clone
  * def initialize              args=ARGV.clone
  * def fs
  * def shell
  * def ignored_shells
  * def ignored_dirs
  * def link                    src,              dest
  * def file_opts
  * def build_dir
  * def build
  * def owd
  * def pwd
  * def backup_dir
  * def real_base_dir
  * def real_pwd
  * def ensure_base_dir_is_pwd
  * def install
  * def setup
  * def parse_options
