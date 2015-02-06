# mysql prompt setting
export MYSQL_PS1="\u@\h [\d]> "
export PAGER=less

# see http://serverfault.com/a/399875
function mysql_export_grants(){
    MYSQL_CONN="-uroot"
    mysql ${MYSQL_CONN} --skip-column-names -A -e"SELECT CONCAT('SHOW GRANTS FOR ''',user,'''@''',host,''';') FROM mysql.user WHERE user<>''" | mysql ${MYSQL_CONN} --skip-column-names -A | sed 's/$/;/g' > mysql_user_grants.sql
}
