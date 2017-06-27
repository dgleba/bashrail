#!/usr/bin/env bash


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

I have had no luck getting this to work..

see: C:\backup\1\brail317r29-willfilter2.REDWE_C_var_share203_dg_brail317r29-willfilter2.170619_211517.7z


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# read settings..

read  appn  sfil  sfil2  mpwd  parm0</tmp/"_brvar1202_${USER}".txt
echo $appn $sfil $sfil2 $mpwd $parm0

# or  ../bashrail/will_filter1.sh
  

# timeout1=5 ; read -t "${timeout1}" -p "Press ENTER or wait $timeout1 seconds..." || true ;  echo ;


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

echo "gem 'will_filter', github: 'berk/will_filter'" >> Gemfile

echo 'Rails.application.config.assets.precompile += %w( will_filter/filter.css )' >> config/initializers/assets.rb

bundle

git add -A # Add all files and commit them
git commit -m "will_filter1"

###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

rails generate will_filter  
rake db:migrate

###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# comment out line if matches patrn and insert repl2 before that line...

filetarg='app/controllers/products_controller.rb'
r1tmp="/tmp/_temprubyrunner_${USER}.rb"
cat << 'HEREDOC' > $r1tmp
  repl2 = %Q{
  not used this time
  }
  ARGF.each do |line|
    if line =~ /@q = @products.search params/ then
      # puts repl2
      print '  #'
      puts line
      
    else
      puts line
    end
  end
HEREDOC
ruby $r1tmp $filetarg > $filetarg.tmp
cp $filetarg.tmp $filetarg; rm $filetarg.tmp


  
### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# comment out line if matches patrn and insert repl2 before that line...

filetarg='app/controllers/products_controller.rb'
r1tmp="/tmp/_temprubyrunner_${USER}.rb"
cat << 'HEREDOC' > $r1tmp
  repl2 = %Q{
  @Products = Product.filter(:params => params)  
  }
  ARGF.each do |line|
    if line =~ /@products = @q.result.page/ then
      puts repl2
      print '  #'
      puts line
      
    else
      puts line
    end
  end
HEREDOC
ruby $r1tmp $filetarg > $filetarg.tmp
cp $filetarg.tmp $filetarg; rm $filetarg.tmp


  
### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# comment out line if matches patrn and insert repl2 before that line...

filetarg='app/views/products/index.html.erb'
r1tmp="/tmp/_temprubyrunner_${USER}.rb"
cat << 'HEREDOC' > $r1tmp
  repl2 = %Q{
  <%= will_filter_tag(@products) %>  
  }
  ARGF.each do |line|
    if line =~ /<%= paginate @products %>/ then
      puts repl2
      print '  #'
      puts line
      
    else
      puts line
    end
  end
HEREDOC
ruby $r1tmp $filetarg > $filetarg.tmp
cp $filetarg.tmp $filetarg; rm $filetarg.tmp

  
### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# add new lines of text after patrn...

filetarg='config/routes.rb'
r1tmp="/tmp/_temprubyrunner_${USER}.rb"
cat << 'HEREDOC' > $r1tmp
  repl2 = %Q{
  #
  mount WillFilter::Engine => "/will_filter"
  #
  }
  ARGF.each do |line|
    puts line
    puts repl2 if line =~ /Rails.application.routes.draw/
  end
HEREDOC
ruby $r1tmp $filetarg > $filetarg.tmp
cp $filetarg.tmp $filetarg; rm $filetarg.tmp


### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


git add -A # Add all files and commit them
git commit -m "will_filter2"

# diff last commit... git diff HEAD^ HEAD

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


function blockcomment21() {
: <<'BLOCKCOMMENT'

manually edit..

+++ b/app/views/products/index.html.erb
 
-  <div class="col-sm-3">
-    <%= search_form_for @q, class: 'search-form' do |f| %>
-      <div class="input-group">
-        <%= f.search_field :name_cont, class: 'form-control' %>
-        <span class="input-group-btn">
-          <button class="btn btn-primary">Search <i class="fa fa-search"></i>
-          </button>
-        </span>
-      </div>
-    <% end %>
-  </div>

_____________ 



remove..

  <div class="col-sm-2 ">
    <%= page_entries_info @products, :entry_name => 'item' %>
  </div>

_____________ 



this should be:

     <%#= paginate @products %>



BLOCKCOMMENT
}

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
