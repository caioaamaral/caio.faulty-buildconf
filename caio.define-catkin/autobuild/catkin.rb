
module Autobuild
    def self.catkin(options, &block)
        Catkin.new(options, &block)
    end

    class Catkin < Autobuild::CMake
        def initialize(options)
            super(options)
            @mutex = Mutex.new
        end

        def update_srcdir
            @importdir ||= @srcdir
            return if File.exist?(File.join(srcdir, 'package.xml'))
            usual_manifestdir = File.join(srcdir, name, 'package.xml')

            if File.exist?(usual_manifestdir)
                @srcdir = File.dirname(usual_manifestdir)
                return
            end

            dir_glob = "#{importdir}/**/#{name}/package.xml"
            @srcdir = (Dir[dir_glob].map do |path|
                File.dirname(path)
            end.first || @srcdir)
        end

        def import(options)
            @mutex.synchronize do
                return if updated? || failed?
                result = super(options)
                update_srcdir
                result
            end
        end
    end
end
