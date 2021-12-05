Autoproj.env_add_path 'PYTHONPATH', File.join(Autoproj.prefix, 'lib', 'python2.7', 'site-packages')
Autoproj.env_add_path 'ROS_PACKAGE_PATH', File.join(Autoproj.prefix, 'share')
Autoproj.env_set 'ROS_MASTER_URI', 'http://localhost:11311'
Autoproj.config.set('build', File.join(Autoproj.root_dir, 'build')) unless Autoproj.config.get('build', nil)
Autoproj.config.set('source', 'src') unless Autoproj.config.source_dir

