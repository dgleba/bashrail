#!/usr/bin/env bash


# kaminari pagainate, with ransack search  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
pwd

# https://www.anthonycandaele.com/blog/2015/08/04/adding-pagination-to-your-rails-app-with-kaminari

# http://www.softwaremaniacs.net/2014/01/replacing-scaffoldcontroller-generator.html



# to get original controller generator....
  railt1="$(bundle show railties)"
  echo "${railt1}"
  path1='lib/rails/generators/rails/scaffold_controller/templates'
  echo "${railt1}/${path1}"
  ls -la "${railt1}/${path1}"

  path2='lib/templates/rails/scaffold_controller/orig_default'
  mkdir -p $path2
  rsync -auv "${railt1}/${path1}/" $path2
# 

# before..
# def index
  # @<%= plural_table_name %> = <%= orm_class.all(class_name) %>
#
# after..
#   from railt251b or c..
# insert_into_file 'lib/templates/rails/scaffold_controller/controller.rb', after: /def index\n/ do
  # <<-'RUBY'
  # i think this should be .. <%= singular_table_name %>
    # @q = @<%= plural_table_name %>.search params[:q]
    # @<%= plural_table_name %> = @q.result.page(params[:page])
  # RUBY
# end
#

path1='lib/templates/rails/scaffold_controller'
# rsync.. -a - rltpgoD  preserve almost all. -u update don't copy older source files.
rsync -auv  $sfil2/$path1/ $path1/


rails generate 'kaminari:config'


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function blockcomment1() {
: <<'BLOCKCOMMENT'


manualv:

haml..

.col-sm-5.col-sm-offset-7
  = search_form_for @q, class: 'search-form' do |f|
    .input-group
      = f.search_field :<%= attributes.first.name %>_cont, class: 'form-control'
      %span.input-group-btn
        %button.btn.btn-primary
          %i.fa.fa-search

to erb..

<div class="col-sm-5 col-sm-offset-7">
  <%= search_form_for @q, class: 'search-form' do |f| %>
    <div class="input-group">
      <%= f.search_field :?attributes.first.name?_cont, class: 'form-control' %>
      <span class="input-group-btn">
        <button class="btn btn-primary">
          <i class="fa fa-search"></i>
        </button>
      </span>
    </div>
  <% end %>
</div>

then modify for templating...


<div class="col-sm-5 col-sm-offset-7">
  <%%= search_form_for @q, class: 'search-form' do |f| %>
    <div class="input-group">
      <%%= f.search_field :<%= attributes.first.name %>_cont, class: 'form-control' %>
      <span class="input-group-btn">
        <button class="btn btn-primary">
          <i class="fa fa-search"></i>
        </button>
      </span>
    </div>
  <%% end %>
</div>


BLOCKCOMMENT
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# edit template index...
#
file1='index.html.erb'
path1='lib/templates/erb/scaffold/'
cp -a $path1$file1  $path1$file1$(date +"__%Y.%m.%d_%H.%M.%S").bak.txt
#
#replace foo with bar once per line... #sed -i -e 's/foo/bar/' filename
pattern1='titleize'

tmpf1='/tmp/herefile1'
cat > $tmpf1 <<HEREDOC

<div class="col-sm-5 col-sm-offset-7">
  <%%= search_form_for @q, class: 'search-form' do |f| %>
    <div class="input-group">
      <%%= f.search_field :<%= attributes.first.name %>_cont, class: 'form-control' %>
      <span class="input-group-btn">
        <button class="btn btn-primary">
          <i class="fa fa-search"></i>
        </button>
      </span>
    </div>
  <%% end %>
</div>

HEREDOC

# add place holder..
phold="placeholder21"
sed -i "/$pattern1/a ${phold}" $path1$file1
# Replace placeholder with tmpfile..
sed  "/$phold/ { r $tmpf1
  d }" $path1$file1



git add -A # Add all files and commit them
  git commit -m "Kaminari Ransack"

