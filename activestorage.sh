#!/usr/bin/env bash
echo ~----------~----------Startingd $HOSTNAME, pwd: `pwd`, dlr0: "$0", bashsource0: "${BASH_SOURCE[0]}", $(date +"%Y-%m-%d_%H.%M.%S")


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# read settings..

read  appn  sfil  sfil2  mpwd  parm0</tmp/"_brvar1202_${USER}".txt
echo $appn $sfil $sfil2 $mpwd $parm0

# timeout1=5 ; read -t "${timeout1}" -p "Press ENTER or wait $timeout1 seconds..." || true ;  echo ;


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# If not installed, install imagemagick
sudo apt -y install imagemagick

bin/rails active_storage:install
  

rails db:migrate RAILS_ENV=development


sleep 1
git add -A # Add all files and commit them
git commit -m "activestorage1"



###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


echo "# " >> Gemfile
echo "gem 'mini_magick'">> Gemfile

bundle update

sleep 1
git add -A # Add all files and commit them
git commit -m "activestorage gemfile"


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# model..


###  ~~
# add new lines of text after patrn...
#
filetarg='app/models/country_of_origin.rb'
cat $filetarg
r1tmp="/tmp/_temprubyrunner_${USER}.rb"
cat << 'HEREDOC' > $r1tmp
patrn='class'
  repl2 = %Q{
    has_one_attached :avatar
    has_many_attached :documents
  }
  ARGF.each do |line|
    puts line
    puts repl2 if line =~ /#{Regexp.escape(patrn)}/
  end
HEREDOC
ruby $r1tmp $filetarg > $filetarg.tmp ; cat $filetarg.tmp ; cp $filetarg.tmp $filetarg; rm $filetarg.tmp




###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# _form

# 7. Add input fields to app/views/country_of_origins/_form.html.erb:

   # class="actions"


###  ~~~~
# add new lines of text n lines after patrn...
#
filetarg='app/views/country_of_origins/_form.html.erb'
cat $filetarg
r1tmp="/tmp/_temprubyrunner_${USER}.rb"
cat << 'HEREDOC' > $r1tmp
patrn='f.number_field :sort_order' 
  repl2 = %Q{
  <hr>
  <div class="field">
    <%= f.label :avatar %>
    <%= f.file_field :avatar %>
  </div>
  <div class="field">
    <%= f.label :documents %>
    <%= f.file_field :documents, multiple: true %>
  </div>
  <hr>
  }
  i=-2
  ARGF.each_with_index do |line, ndx| 
    puts line
    if line =~ /#{Regexp.escape(patrn)}/
      i = ndx + 2
    end
    if ndx == i
        puts repl2 
    end 
  end
HEREDOC
ruby $r1tmp $filetarg > $filetarg.tmp ; cat $filetarg.tmp ; cp $filetarg.tmp $filetarg; rm $filetarg.tmp


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# controllers


# this one isn't needed
#
# add new lines of text after patrn...
#
# filetarg='app/controllers/country_of_origins_controller.rb'
# cat $filetarg
# r1tmp="/tmp/_temprubyrunner_${USER}.rb"
# cat << 'HEREDOC' > $r1tmp
# patrn='if @country_of_origin.save'
#   repl2 = %Q{
    
#         avatar = params[:country_of_origin][:avatar]
#         documents = params[:country_of_origin][:documents]

#         if avatar
#           @country_of_origin.avatar.attach(avatar)
#         end
#         if documents
#           @country_of_origin.documents.attach(documents)
#         end
#         }
#   ARGF.each do |line|
#     puts line
#     puts repl2 if line =~ /#{Regexp.escape(patrn)}/
#   end
# HEREDOC
# ruby $r1tmp $filetarg > $filetarg.tmp ; cat $filetarg.tmp ; cp $filetarg.tmp $filetarg; rm $filetarg.tmp



# edit whitelist..
# original..      params.require(:country_of_origin).permit(:name, :pdate, :active_status, :sort)
filetarg='app/controllers/country_of_origins_controller.rb'
sed -i '/params.require/s/)$/, :avatar)/' $filetarg
sed -i '/params.require/s/)$/, documents: [])/' $filetarg



# add new lines of text before patrn...
#
filetarg='app/controllers/country_of_origins_controller.rb'
cat $filetarg
r1tmp="/tmp/_temprubyrunner_${USER}.rb"
cat << 'HEREDOC' > $r1tmp
patrn='private'
  repl2 = %Q{
    
    def delete_document_attachment
        @document = ActiveStorage::Attachment.find(params[:id])
        @document.purge
        # redirect_to @current_page
        redirect_back(fallback_location: root_path)     
    end

    }
  ARGF.each do |line|
    puts repl2 if line =~ /#{Regexp.escape(patrn)}/
    puts line
  end
HEREDOC
ruby $r1tmp $filetarg > $filetarg.tmp ; cat $filetarg.tmp ; cp $filetarg.tmp $filetarg; rm $filetarg.tmp



###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# edit routes



# add new lines of text after patrn...
#
filetarg='config/routes.rb'
cat $filetarg
r1tmp="/tmp/_temprubyrunner_${USER}.rb"
cat << 'HEREDOC' > $r1tmp
patrn='Rails.application.routes.draw'
  repl2 = %Q{
  resources :country_of_origins do
    member do
      delete :delete_document_attachment
    end
  end
  }
  ARGF.each do |line|
    puts line
    puts repl2 if line =~ /#{Regexp.escape(patrn)}/
  end
HEREDOC
ruby $r1tmp $filetarg > $filetarg.tmp ; cat $filetarg.tmp ; cp $filetarg.tmp $filetarg; rm $filetarg.tmp



###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


sleep 1
git add -A # Add all files and commit them
  git commit -m "activestorage app edits"



###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Add line to config..

filetarg='config/environments/development.rb'
sed -i '/Rails.application.configure/a   \ \ config.active_storage.service = :local' $filetarg


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# edit show...

filetarg='app/views/country_of_origins/show.html.erb'
cat $filetarg
r1tmp="/tmp/_temprubyrunner_${USER}.rb"
cat << 'HEREDOC' > $r1tmp
patrn='@country_of_origin.sort'
repl2 = %Q{
<hr>
<p>
  <strong>Documents:</strong>
  <ul>
   <% @country_of_origin.documents.each do |document| %>
      <li><%= link_to document.blob.filename, url_for(document) %></li>
      <%# show thumbnail if it is an image.. %> 
      <%= if document.image?  then ( image_tag document.variant(resize: "180x180") )  end %> 
          <%= link_to 'Remove', delete_document_attachment_country_of_origin_url(document),
                    method: :delete,
                    data: { confirm: 'Are you sure you want to delete?' } %>

   <% end %>
  </ul>
</p>
<hr>
}
  i=-2
  ARGF.each_with_index do |line, ndx| 
    puts line
    if line =~ /#{Regexp.escape(patrn)}/
      i = ndx + 1
    end
    if ndx == i
        puts repl2 
    end 
  end
HEREDOC
ruby $r1tmp $filetarg > $filetarg.tmp ; cat $filetarg.tmp ; cp $filetarg.tmp $filetarg; rm $filetarg.tmp




git add -A # Add all files and commit them
  git commit -m "activestorage app edits2"



###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

