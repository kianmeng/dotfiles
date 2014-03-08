# http://www.commandlinefu.com/commands/view/153/add-all-unversioned-files-to-svn
alias svnaa='svn st | grep "^\?" | awk "{print \$2}" | xargs svn add $1'
alias svnra='svn st | grep "^\!" | awk "{print \$2}" | xargs svn rm $1'
