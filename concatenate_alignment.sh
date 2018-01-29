#sed -e 's/$/.fa/' -i core_orthogroups.txt #bash oneliner to add .fa in each line of the list
#cat ../../phylogenomics/test/core_orthogroups.txt | xargs mv -t ../../phylogenomics/test/ #move the listed files to desired directory
#sed -i '/^>/ s/_.*//' *.fa #Remove everything after 1st "_" to make all the names same
for f in *.fa; do awk '/^>/{f=!d[$1];d[$1]=1}f' $f > $f.nodup; done # remove duplicate before concatanation
#Line 6-14 will concatanate fasta files side by side, line 15-18 will fix the alignment, header and remove blank lines 
for i in *nodup;
        do awk '/>/{print "\n" $0} $1!~/>/{printf $0} END{print "\n"}' $i > $i.oneline
done

cat /dev/null > result
for i in *.oneline;
        do paste result $i | sed 's/    //' >> pasted
                mv pasted result
done
rm *.oneline
sed -e 's/\(>\).*\(>\)/\1\2/'g result > result_test_1.fa
sed -i 's/>>/>/' result_test_1.fa
sed -i '/^$/d' result_test_1.fa

