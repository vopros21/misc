# select user info, report info and report attachment for 1% users from DB and save needed files in organized structure
mkdir configs
cd configs
sql -v -save {attachment} user{user_id}_er{report_id}.zip "SELECT t.user_id, t.report_id, t.attachment from (SELECT er.*, ROW_NUMBER() over (ORDER BY er.user_id) as num from error_reports er inner join (select user_id, max(report_time) as time from error_reports group by user_id) er2 on er.user_id = er2.user_id and er.report_time = er2.time where er.report_time > sysdate - 365) t where mod(t.num, 100) =  0" > ../sql-output.txt
mkdir tmp
for f in *.zip;
do
    userfolder=${f%.*}
    mkdir $userfolder
    unzip "$f" -d tmp/ >> ../zip-output.txt && find ./tmp ! -name 'config*' -type f -exec rm -f {} + && for c in tmp/*; do mv "$c" $userfolder/"${c#*/}"; done;
done
rmdir tmp
rm *.zip
zip -r ../configs.zip * >> ../zip-output.txt
cd ..
rm -r configs
