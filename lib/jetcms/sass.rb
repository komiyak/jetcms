# coding: utf-8

require 'sass'

module Jetcms
  class SassCompiler
    def self.run
      # create directory
      FileUtils.mkdir_p("assets/stylesheets/")
    
      # ディレクトリチェンジ
      original_dir = Dir.pwd
      Dir.chdir("_jetcms/assets/stylesheets")

      # 差集合を使って、頭に _ がついていない sass のみを取得し、コンパイルする
      a = Dir.glob( "*.scss" )
      b = Dir.glob( "_*.scss" ) # 取り除きたいファイル郡

      sass_files = a - b

      sass_files.each do |file_path|
        name = File::basename(file_path, '.scss')

        p "Compiled #{file_path}"
        f = File.open(file_path)
        output = Sass::Engine.new( f.read, :syntax => :scss, :style => :compressed ).render
        f.close
  
  
        # すでに css があるならば、それを削除する
        if File.exist?("../../../assets/stylesheets/#{name}.css")
          p "    deleted old css file (#{name}.css)."
          File.delete("../../../assets/stylesheets/#{name}.css")
        end
  
        f = File.open("../../../assets/stylesheets/#{name}.css", "w")
        f.write( output ) # footer を書き込む
        f.close
      end

      # 元の場所に戻す
      Dir.chdir(original_dir)
    end
  end
end