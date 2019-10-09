#!/usr/bin/env bash
echo ~----------~----------Startingd $HOSTNAME, pwd: `pwd`, dlr0: "$0", bashsource0: "${BASH_SOURCE[0]}", $(date +"%Y-%m-%d_%H.%M.%S")


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function purpose1() {

echo tmp1
exit 999

: <<'BLOCKCOMMENT'

  Purpose:    https://github.com/nathanvda/cocoon


BLOCKCOMMENT
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# read settings..

read  appn  sfil  sfil2  mpwd  parm0</tmp/"_brvar1202_${USER}".txt
echo $appn $sfil $sfil2 $mpwd $parm0

# timeout1=5 ; read -t "${timeout1}" -p "Press ENTER or wait $timeout1 seconds..." || true ;  echo ;


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


echo "gem 'cocoon'" >> Gemfile

bundle



###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



# add new lines of text after patrn...

filetarg='app/assets/javascripts/application.js'
r1tmp="/tmp/_temprubyrunner_${USER}.rb"
cat << 'HEREDOC' > $r1tmp
  repl2 = %Q{//= require cocoon}
  ARGF.each do |line|
    puts line
    puts repl2 if line =~ /tree/
  end
HEREDOC
ruby $r1tmp $filetarg > $filetarg.tmp
cp $filetarg.tmp $filetarg; rm $filetarg.tmp
cat $filetarg



git add -A # Add all files and commit them
git commit -m "cocoon1"


###  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


rails generate scaffold Lpa_answer body:text user:references lpa_question:references issue_description:text action_taken:text -f

rails generate scaffold Lpa_question title:string lpa_survey:references question_type:integer  sort:integer active_status:integer -f

rails generate scaffold Lpa_survey title:string user:references  sort:integer active_status:integer -f


#  --no-migration
# _____________ 

# rails generate scaffold Survey name:string sort:integer active_status:integer --no-migration 
# rails generate scaffold Question name:string qtype:integer survey:references sort:integer active_status:integer --no-migration
# rails generate scaffold Choice name:string question:references sort:integer active_status:integer --no-migration
# rails generate scaffold Answer body:text choice:references question:references response:references issue:string action:text --no-migration
# rails generate scaffold Response name:string survey:references user:references ip:string --no-migration


rake db:migrate

git add -A # Add all files and commit them
git commit -m "cocoon - scaffold survey"


### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function notes1() {

exit 999

: <<'BLOCKCOMMENT'


Your models are associated like this:

class Project < ActiveRecord::Base
  has_many :tasks, inverse_of: :project
  accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true
end

class Task < ActiveRecord::Base
  belongs_to :project
end


# controller..

def project_params
    params.require(:project).permit(:name, :description, tasks_attributes: [:id, :description, :done, :_destroy])
end
  

BLOCKCOMMENT
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
