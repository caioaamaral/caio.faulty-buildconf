def catkin_package_setup(pkg)
    pkg.update_srcdir
    pkg.with_tests('tests') do
        pkg.run('test', Autobuild.tool(:make), 'test', working_directory: pkg.builddir)
    end
    pkg.post_import do
        test_dir = File.join(pkg.srcdir, 'test')
        if File.directory?(test_dir)
            pkg.test_utility.source_dir = File.join(pkg.builddir, 'test_results', pkg.name)
            pkg.define 'CATKIN_ENABLE_TESTING', pkg.test_utility.enabled?
        end
    end

    common_make_based_package_setup(pkg)
    pkg.define 'CMAKE_EXPORT_COMPILE_COMMANDS', 'ON'
    pkg.define 'CATKIN_DEVEL_PREFIX', File.join(Autoproj.root_dir, 'devel')
    pkg.use_package_xml = true
end

def catkin_package(name, workspace: Autoproj.workspace)
    package_common(:catkin, name, workspace: workspace) do |pkg|
        catkin_package_setup(pkg)
        yield(pkg) if block_given?
    end
end
