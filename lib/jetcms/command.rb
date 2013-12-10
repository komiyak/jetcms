# coding: utf-8

require 'fileutils'

module Jetcms
  class Command
    def self.template_path
      File.expand_path("../template", File.dirname(__FILE__))
    end
  
    def self.generate_files(dirname)
      puts "Successfully generated template."

      Dir::mkdir( File.expand_path("./#{dirname}") )
      Dir::mkdir( File.expand_path("./#{dirname}/_jetcms") )

      Dir::mkdir( File.expand_path("./#{dirname}/_jetcms/page") )
      Dir::mkdir( File.expand_path("./#{dirname}/_jetcms/page/example") )
      Dir::mkdir( File.expand_path("./#{dirname}/_jetcms/layout") )
      Dir::mkdir( File.expand_path("./#{dirname}/_jetcms/article") )

      Dir::mkdir( File.expand_path("./#{dirname}/_jetcms/assets") )
      Dir::mkdir( File.expand_path("./#{dirname}/_jetcms/assets/images") )
      Dir::mkdir( File.expand_path("./#{dirname}/_jetcms/assets/javascripts") )
      Dir::mkdir( File.expand_path("./#{dirname}/_jetcms/assets/stylesheets") )
  
      # article データ YYYY/MM/DD 形式のディレクトリを作成する
      nowdate = Time.now
      Dir::mkdir( File.expand_path("./#{dirname}/_jetcms/article/#{nowdate.strftime('%Y')}") )
      Dir::mkdir( File.expand_path("./#{dirname}/_jetcms/article/#{nowdate.strftime('%Y')}/#{nowdate.strftime('%m')}") )
      Dir::mkdir( File.expand_path("./#{dirname}/_jetcms/article/#{nowdate.strftime('%Y')}/#{nowdate.strftime('%m')}/#{nowdate.strftime('%d')}") )
  
      # article のサンプルデータを作成する
      FileUtils.cp(self.template_path + "/example.md", File.expand_path("./#{dirname}/_jetcms/article/#{nowdate.strftime('%Y')}/#{nowdate.strftime('%m')}/#{nowdate.strftime('%d')}/example.md"))
  
      # generate .gitkeep
      File.open( File.expand_path("./#{dirname}/_jetcms/page/.gitkeep"), "w").close()
      File.open( File.expand_path("./#{dirname}/_jetcms/layout/.gitkeep"), "w").close()
  
      File.open( File.expand_path("./#{dirname}/_jetcms/assets/images/.gitkeep"), "w" ).close()
      File.open( File.expand_path("./#{dirname}/_jetcms/assets/javascripts/.gitkeep"), "w" ).close()
      File.open( File.expand_path("./#{dirname}/_jetcms/assets/stylesheets/.gitkeep"), "w" ).close()
  
      # sample html
      File.open( File.expand_path("./#{dirname}/_jetcms/page/index.html"), "w" ).close()
      File.open( File.expand_path("./#{dirname}/_jetcms/page/example/index.html"), "w" ).close()
  
      # Generate .gitignore
      File.open( File.expand_path("./#{dirname}/.gitignore"), "w") {|file|
        file.puts("/*")
        file.puts("!_jetcms/")
        file.puts("!.gitignore")
      }

    end
  end
end