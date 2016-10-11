default['wljava']['uri'] = nil
default['wljava']['skip'] = false
default['wljava']['force_i586'] = false
default['wljava']['java_home'] = nil

# linux only
default['wljava']['set_default'] = true
default['wljava']['owner'] = 'root'
default['wljava']['group'] = 'root'
default['wljava']['set_etc_environment'] = false
default['wljava']['use_alt_suffix'] = false
default['wljava']['reset_alternatives'] = true
default['wljava']['alternatives_priority'] = 1062
default['wljava']['bin_cmds'] = %w(
  appletviewer apt ControlPanel extcheck idlj jar jarsigner java javac
  javadoc javafxpackager javah javap javaws jcmd jconsole jcontrol jdb
  jdeps jhat jinfo jjs jmap jmc jps jrunscript jsadebugd jstack
  jstat jstatd jvisualvm keytool native2ascii orbd pack200 policytool
  rmic rmid rmiregistry schemagen serialver servertool tnameserv
  unpack200 wsgen wsimport xjc
)

# windows only
default['wljava']['win_addlocal'] = 'ToolsFeature,SourceFeature,PublicjreFeature'
default['wljava']['win_javalink'] = "#{ENV['SYSTEMDRIVE']}\\java\\bin"
default['wljava']['win_jre_home'] = nil
