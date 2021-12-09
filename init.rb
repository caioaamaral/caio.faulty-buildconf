Autoproj.config.set("build", File.join(Autoproj.root_dir, "build")) unless Autoproj.config.get("build", nil)
Autoproj.config.set("source", "src") unless Autoproj.config.source_dir
