# Jetcms

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'jetcms'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jetcms

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Spec

- S3 Static Web Hosting Only.
    - S3 を使った、静的サイトホスティングのみに対応。


- ディレクトリベースのビルド。

$ jetcms new .
$ jetcms new ./websites

とするとディレクトリ構成として

    - jetcms/ というディレクトリが登場して、そこに構成に必要なファイルを生成する。

$ jetcms


概念
    pages
        - 固定ページの生成。
        
    article
        - ブログのような日付ベースのドキュメント生成する。
        
        
生成されるディレクトリ。
    _jetcms/
        page/
            index.html
            xxx.html
            hinata/
                index.html (<= サブディレクトリにも対応)
        layout/
            article.html.erb (article に強制的に適用される)
        article/
            2013/
                11/
                    15/
                        test.md (md の場合は HTML 変換)
        assets/
            images/
            javascripts/
            stylesheets/
            
    ./
        index.html
        xxx.html
        article/2013/11/15/test.html
        assets/images/
               javascripts/
               stylesheets/
               
    .gitignore